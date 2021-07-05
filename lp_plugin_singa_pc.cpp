#include "lp_plugin_singa_pc.h"

#include <iostream> //标准输入输出流

#include "lp_renderercam.h"
#include "lp_pointcloud.h"
#include "Commands/lp_commandmanager.h"
#include "Commands/lp_cmd_export_obj.h"
#include "Commands/lp_cmd_import_opmesh.h"
#include "renderer/lp_glselector.h"
#include "renderer/lp_glrenderer.h"
#include <fstream>
#include "lp_document.h"

#include <QMessageBox>
#include <QGroupBox>
#include <QMouseEvent>
#include <QOpenGLFramebufferObject>
#include <QOpenGLContext>
#include <QOpenGLShaderProgram>
#include <QOpenGLExtraFunctions>
#include <QOpenGLTexture>
#include <QOpenGLBuffer>
#include <QVBoxLayout>
#include <QRadioButton>
#include <QLabel>
#include <QComboBox>
#include <QMatrix4x4>
#include <QPushButton>
#include <QFileDialog>
#include <QSlider>
#include <QCheckBox>
#include <QPainter>
#include <QPainterPath>
#include <QtConcurrent/QtConcurrent>



LP_Plugin_Singa_PC::~LP_Plugin_Singa_PC()
{
    emit glContextRequest([this](){
        delete mProgram;
        mProgram = nullptr;
    });
    Q_ASSERT(!mProgram);
}

bool LP_Plugin_Singa_PC::Run()
{
    mPool.setMaxThreadCount(std::max(1, mPool.maxThreadCount()-2));
    g_GLSelector->ClearSelected();
    return false;
}

void LP_Plugin_Singa_PC::FunctionalRender_L(QOpenGLContext *ctx, QSurface *surf, QOpenGLFramebufferObject *fbo, const LP_RendererCam &cam, const QVariant &options)
{
    Q_UNUSED(surf)  //Mostly not used within a Functional.
    Q_UNUSED(options)   //Not used in this functional.

    mCam = cam;

    if ( !mInitialized ){   //The OpenGL resources, e.g. Shader, not initilized
        initializeGL();     //Call the initialize member function.
    }                       //Not compulsory, (Using member function for cleaness only)
//    if ( !mObject.lock()){
//        return;             //If not mesh is picked, return. mObject is a weak pointer
//    }                       //to a LP_OpenMesh.
    if ( mVs.empty()){
        return;             //If not mesh is picked, return. mObject is a weak pointer
    }                       //to a LP_OpenMesh.
    if(cloud_buffer.size()==0) return;
    auto proj = cam->ProjectionMatrix(),    //Get the projection matrix of the 3D view
         view = cam->ViewMatrix();          //Get the view matrix of the 3D view

    auto f = ctx->extraFunctions();         //Get the OpenGL functions container

    fbo->bind();
    f->glEnable(GL_PROGRAM_POINT_SIZE);     //Enable point-size controlled by shader
    f->glEnable(GL_DEPTH_TEST);             //Enable depth test

    mProgram->bind();                       //Bind the member shader to the context
    mProgram->setUniformValue("m4_mvp", proj * view );  //Set the Model-View-Projection matrix
    mProgram->setUniformValue("f_pointSize", 1.0f);     //Set the point-size which is enabled before
    mProgram->setUniformValue("v4_color", QVector4D( 0.4f, 0.7f, 0.7f, 0.6f )); //Set the point color

//    Get the actual open-mesh data from the LP_OpenMesh class
//    auto m = std::static_pointer_cast<LP_OpenMeshImpl>(mObject.lock())->Mesh();

    for(int i = 0 ;i<mVs.size();i++)
    {
        mProgram->setUniformValue("v4_color", QVector4D( mCs[i][0], mCs[i][1], mCs[i][2], 1.0f ));
        mProgram->enableAttributeArray("a_pos");
        mProgram->setAttributeArray("a_pos",&mVs[i]);
        f->glDrawArrays(GL_POINTS, 0, GLsizei(1));
    }
//    std::vector<float> cloudData;
//    for(auto a = cloud_buffer[cloud_buffer.size()-1]->points.begin();a !=cloud_buffer[cloud_buffer.size()-1]->points.end();a++)
//    {
//        cloudData.push_back(a->_PointXYZRGBNormal::x);
//        cloudData.push_back(a->_PointXYZRGBNormal::y);
//        cloudData.push_back(a->_PointXYZRGBNormal::z);
//        mProgram->setUniformValue("v4_color", QVector4D( a->_PointXYZRGBNormal::r/255.0f, a->_PointXYZRGBNormal::g/255.0f, a->_PointXYZRGBNormal::b/255.0f, 0.6f ));
//        mProgram->enableAttributeArray("a_pos");        //Enable the "a_pos" attribute buffer of the shader
//        mProgram->setAttributeArray("a_pos",cloudData.data(),3); //Set the buffer data of "a_pos"
//        f->glDrawArrays(GL_POINTS, 0, GLsizei(1));
//        cloudData.clear();
//    }
    if (!mPoints.empty()){                         //If some vertices are picked and record in mPoints
        mProgram->setUniformValue("f_pointSize", 3.0f);    //Enlarge the point-size
        mProgram->setUniformValue("v4_color", QVector4D( 0.6f, 0.1f, 0.1f, 1.0f )); //Change to another color
        std::vector<float> pickedPoints;
        for(int i =0;i<mPoints.size();i++)
        {
            for(int j = 0;j<3;j++)
                pickedPoints.emplace_back(mVs[(mPoints.begin()+i).key()][j]);
        }
        mProgram->enableAttributeArray("a_pos");
        mProgram->setAttributeArray("a_pos",pickedPoints.data(),3);
        f->glDrawArrays(GL_POINTS, 0, pickedPoints.size()/3);
        /*
        std::vector<uint> list(mPoints.size());
        for ( int i = 0; i<list.size(); ++i ){
            list[i] = (mPoints.begin()+i).key();
        }
        // ONLY draw the picked vertices again
        f->glDrawElements(GL_POINTS, GLsizei(mPoints.size()), GL_UNSIGNED_INT, list.data());*/
    }


    mProgram->disableAttributeArray("a_pos");   //Disable the "a_pos" buffer

    mProgram->release();                        //Release the shader from the context

    fbo->release();
    f->glDisable(GL_PROGRAM_POINT_SIZE);
    f->glDisable(GL_DEPTH_TEST);

}

QWidget *LP_Plugin_Singa_PC::DockUi()
{
    mWidget = std::make_shared<QWidget>();

    QVBoxLayout *layout = new QVBoxLayout(mWidget.get());
    layout->setContentsMargins(0,2,0,2);
    QPushButton *buttonImportPLY = new QPushButton(tr("Import PLY File"),mWidget.get());
    QPushButton *buttonGeneratePC = new QPushButton(tr("Generate Point Cloud"),mWidget.get());
    QGroupBox *groupA =new QGroupBox;
    groupA->setMaximumWidth(240);
    QGridLayout *glayoutA = new QGridLayout;
    glayoutA->setContentsMargins(5,2,5,2);
    glayoutA->addWidget(buttonImportPLY,0,0);
    glayoutA->addWidget(buttonGeneratePC,0,1);
    groupA->setLayout(glayoutA);
    layout->addWidget(groupA);

    QGroupBox *groupAA = new QGroupBox;
    groupAA->setMaximumWidth(240);
    buttonSelect = new QRadioButton(tr("SelectMode"),mWidget.get());
    QGridLayout *glayoutAA = new QGridLayout;
    buttonSelect->setChecked(false);
    glayoutAA->addWidget(buttonSelect,0,0);
    buttonDepth = new QRadioButton(tr("Depth"),mWidget.get());
    buttonDepth->setChecked(false);
    glayoutAA->addWidget(buttonDepth,0,1);
    glayoutAA->setContentsMargins(5,2,5,2);
    groupAA->setLayout(glayoutAA);
    layout->addWidget(groupAA);

    QGroupBox *groupB = new QGroupBox;
    groupB->setMaximumWidth(240);
    QPushButton *buttonUndo = new QPushButton(tr("Undo"),mWidget.get());
    QGridLayout *glayoutB = new QGridLayout;
    glayoutB->addWidget(buttonUndo,0,0);
    labelBufferLength = new QLabel(tr("0"),mWidget.get());
    labelBufferLength->setAlignment(Qt::AlignHCenter|Qt::AlignVCenter);
    glayoutB->addWidget(labelBufferLength,0,1);
    glayoutB->setContentsMargins(5,2,5,2);
    groupB->setLayout(glayoutB);
    layout->addWidget(groupB);

    QGroupBox *groupC = new QGroupBox;
    groupC->setMaximumWidth(240);
    QGridLayout *glayoutC = new QGridLayout;
    QPushButton *buttonResample = new QPushButton(tr("Resample"),mWidget.get());
    glayoutC->addWidget(buttonResample,0,0);
    glayoutC->setContentsMargins(0,2,0,2);
    resample_x->setMaximumWidth(45);
    resample_x->setValue(1.0);
    resample_x->setSingleStep(0.1);
    glayoutC->addWidget(resample_x,0,1);
    resample_y->setMaximumWidth(45);
    resample_y->setValue(1.0);
    resample_y->setSingleStep(0.1);
    glayoutC->addWidget(resample_y,0,2);
    resample_z->setMaximumWidth(45);
    resample_z->setValue(1.0);
    resample_z->setSingleStep(0.1);
    glayoutC->addWidget(resample_z,0,3);
    groupC->setLayout(glayoutC);
    layout->addWidget(groupC);

    QGroupBox *groupD = new QGroupBox;
    groupD->setMaximumWidth(240);
    QGridLayout *glayoutD = new QGridLayout;
    glayoutD->setContentsMargins(0,2,0,2);
    QPushButton *buttonFilter_ROR = new QPushButton(tr("Filter_ROR"),mWidget.get());
    buttonFilter_ROR->setContentsMargins(2,0,2,0);
    glayoutD->addWidget(buttonFilter_ROR,0,0);
    ROR_p1->setMaximumWidth(45);
    ROR_p1->setValue(2.0);
    glayoutD->addWidget(ROR_p1,0,1);
    ROR_p2->setMaximumWidth(45);
    ROR_p2->setValue(4.0);
    glayoutD->addWidget(ROR_p2,0,2);
    groupD->setLayout(glayoutD);
    layout->addWidget(groupD);

    QGroupBox *groupE = new QGroupBox;
    groupE->setMaximumWidth(240);
    QGridLayout *glayoutE = new QGridLayout;
    glayoutE->setContentsMargins(0,2,0,2);
    QPushButton *buttonFilter_statistic = new QPushButton(tr("Filter_statistic"),mWidget.get());
    buttonFilter_statistic->setContentsMargins(2,0,2,0);
    glayoutE->addWidget(buttonFilter_statistic,0,0);
    statistic_p1->setMaximumWidth(45);
    statistic_p1->setValue(100);
    glayoutE->addWidget(statistic_p1,0,1);
    statistic_p2->setMaximumWidth(45);
    statistic_p2->setValue(0.5);
    glayoutE->addWidget(statistic_p2,0,2);
    groupE->setLayout(glayoutE);
    layout->addWidget(groupE);

    QGroupBox *groupF = new QGroupBox;
    groupF->setMaximumWidth((240));
    QGridLayout *glayoutF = new QGridLayout;
    glayoutF->setContentsMargins(0,2,0,2);
    QPushButton *buttonSave = new QPushButton(tr("Save"),mWidget.get());
    buttonSave->setContentsMargins(2,0,2,0);
    glayoutF->addWidget(buttonSave,0,0);
    QPushButton *buttonExportPLY = new QPushButton(tr("ExportPLY"),mWidget.get());
    buttonExportPLY->setContentsMargins(2,0,2,0);
    glayoutF->addWidget(buttonExportPLY,0,1);
    groupF->setLayout(glayoutF);
    layout->addWidget(groupF);

    layout->addStretch();

    mWidget->setLayout(layout);

    connect(buttonImportPLY, &QPushButton::clicked,[this](){
        importPLY();
        labelBufferLength->setText(QString::number(cloud_buffer.size()));
        rebuildmesh();
        emit glUpdateRequest();
        });
    connect(buttonGeneratePC, &QPushButton::clicked,[this](){
        generatePC();
        labelBufferLength->setText(QString::number(cloud_buffer.size()));
        rebuildmesh();
        emit glUpdateRequest();
        });
    connect(buttonUndo,&QPushButton::clicked,[this](){
        if(cloud_buffer.size()>1)
        {
            cloud_buffer.pop_back();
            labelBufferLength->setText(QString::number(cloud_buffer.size()));
            rebuildmesh();
        }
        emit glUpdateRequest();
    });
    connect(buttonResample, &QPushButton::clicked,[this](){
        resample();
        labelBufferLength->setText(QString::number(cloud_buffer.size()));
        rebuildmesh();
        emit glUpdateRequest();
        });
    connect(buttonFilter_ROR, &QPushButton::clicked,[this](){
        filter_ROR();
        labelBufferLength->setText(QString::number(cloud_buffer.size()));
        rebuildmesh();
        emit glUpdateRequest();
        });
    connect(buttonFilter_statistic, &QPushButton::clicked,[this](){
        filter_statistic();
        labelBufferLength->setText(QString::number(cloud_buffer.size()));
        rebuildmesh();
        emit glUpdateRequest();
        });
    connect(buttonExportPLY, &QPushButton::clicked,[this](){
        exportObj();
        emit glUpdateRequest();
    });
    connect(buttonSave, &QPushButton::clicked,[this](){
        saveMesh();
        labelBufferLength->setText(QString::number(cloud_buffer.size()));
        emit glUpdateRequest();
    });

    return mWidget.get();
}

void LP_Plugin_Singa_PC::initializeGL()
{

    constexpr char vsh[] =
            "attribute vec3 a_pos;\n"       //The position of a point in 3D that used in FunctionRender()
            "uniform mat4 m4_mvp;\n"        //The Model-View-Matrix
            "uniform float f_pointSize;\n"  //Point size determined in FunctionRender()
            "void main(){\n"
            "   gl_Position = m4_mvp * vec4(a_pos, 1.0);\n" //Output the OpenGL position
            "   gl_PointSize = f_pointSize;\n"
            "}";
    constexpr char fsh[] =
            "uniform vec4 v4_color;\n"       //Defined the point color variable that will be set in FunctionRender()
            "void main(){\n"
            "   gl_FragColor = v4_color;\n" //Output the fragment color;
            "}";

    auto prog = new QOpenGLShaderProgram;   //Intialize the Shader with the above GLSL codes
    prog->addShaderFromSourceCode(QOpenGLShader::Vertex,vsh);
    prog->addShaderFromSourceCode(QOpenGLShader::Fragment,fsh);
    if (!prog->create() || !prog->link()){  //Check whether the GLSL codes are valid
        qDebug() << prog->log();
        return;
    }

    mProgram = prog;            //If everything is fine, assign to the member variable

    mInitialized = true;
}

bool LP_Plugin_Singa_PC::eventFilter(QObject *watched, QEvent *event)
{
    static auto _isMesh = [](LP_Objectw obj){
        if ( obj.expired() || LP_OpenMeshImpl::mTypeName != obj.lock()->TypeName()){
            return LP_OpenMeshw();
        }
        return LP_OpenMeshw() = std::static_pointer_cast<LP_OpenMeshImpl>(obj.lock());
    };
    auto lastSelect = g_GLSelector->RubberBand();
    event->ignore();
    if ( QEvent::MouseButtonRelease == event->type()){
        auto e = static_cast<QMouseEvent*>(event);
        if(buttonSelect->isChecked())
        {
            if ( !mVs.empty()){
                auto rb = g_GLSelector->RubberBand();
                auto &&tmp = g_GLSelector->SelectPoints3D("Shade",
                                                    &mVs.at(0)[0],
                                                    mVs.size(),
                                                    rb->pos()+rb->rect().center(), false,
                                                    rb->width(), rb->height());
                if ( !tmp.empty())
                {
                    for (auto pt_id : tmp ){
                        if (Qt::ControlModifier & e->modifiers()){
                            if ( !mPoints.contains(pt_id)){
                                mPoints.insert(pt_id, mPoints.size());
                            }
                        }else if (Qt::ShiftModifier & e->modifiers()){
                            if ( mPoints.contains(pt_id)){
                                qDebug() << mPoints.take(pt_id);
                            }
                        }else{
                            mPoints.clear();
                            mPoints.insert(pt_id,0);
                        }
                    }

                    QString info("Picked Points:");
                    for ( auto &p : mPoints ){
                        info += tr("%1\n").arg(p);
                    }

                    if (!mPoints.empty()){
                        emit glUpdateRequest();
                    }
                    event->accept();
                }
            }
            else
            {
                auto rb = g_GLSelector->RubberBand();
                auto &&tmp = g_GLSelector->SelectInWorld("Shade",
                                                        rb->pos()+rb->rect().center());
                for ( auto &o : tmp ){
                    if ( o.lock() && LP_PointCloudImpl::mTypeName == o.lock()->TypeName()) {
                        mObject = o;
                        auto pc = std::static_pointer_cast<LP_PointCloudImpl>(o.lock());
                        mVs = pc->Points();
                        mNs = pc->Normals();
                        mCs = pc->Colors();
                        LP_Document::gDoc.RemoveObject(std::move(o));
                        emit glUpdateRequest();
                        event->accept();;    //Since event filter has been called
                    }
                }
            }
        }
        else
        {
            if ( e->button() == Qt::LeftButton&&mVs.empty() ){
                if (!mObject.lock()){
                    auto rb = g_GLSelector->RubberBand();
                    auto &&Object = g_GLSelector->SelectInWorld("Shade",rb->pos()+rb->rect().center());
                    if(Object.empty()){
                        return false;
                    }
                    auto &c = Object.front();
                    if ( c.lock()&&LP_PointCloudImpl::mTypeName == c.lock()->TypeName()){
                        mObject = c;
                        auto pc = std::static_pointer_cast<LP_PointCloudImpl>(c.lock());
                        mVs = pc->Points();
                        mNs = pc->Normals();
                        mCs = pc->Colors();
                        emit glUpdateRequest();
                        return true;    //Since event filter has been called
                    }
                }
            }
//            else if ( e->button() == Qt::RightButton )
//            {
//                mVs.clear();
//                mNs.clear();
//                mFids.clear();
//                mPoints.clear();
//                emit glUpdateRequest();
//                event->accept();
//            }
        }
    }
    else if (QEvent::KeyPress == event->type()&&buttonSelect->isChecked())
    {
        QKeyEvent *e = static_cast<QKeyEvent*>(event);
        switch(e->key()){
        case Qt::Key_Delete:{
            auto pc = std::static_pointer_cast<LP_PointCloudImpl>(mObject.lock());
            const int nVs = mVs.size();
            std::vector<QVector3D> newVs, newNs, newCs;
            for ( int i=0; i<nVs; ++i ){
                auto it = mPoints.find(i);
                if ( it == mPoints.end()) {
                    newVs.emplace_back(mVs[i]);
                    newNs.emplace_back(mNs[i]);
                    newCs.emplace_back(mCs[i]);
                }
            }
            mVs = newVs;
            mNs = newNs;
            mCs = newCs;
            mPoints.clear();
            rebuildPC();
            emit glUpdateRequest();
            break;
        }
        case Qt::Key_Space:{
            bool isClear = false;
            for(;!isClear;)
            {
                if(mPoints.empty()) isClear = true;
                auto pc = std::static_pointer_cast<LP_PointCloudImpl>(mObject.lock());
                const int nVs = mVs.size();
                std::vector<QVector3D> newVs, newNs, newCs;
                for ( int i=0; i<nVs; ++i ){
                    auto it = mPoints.find(i);
                    if ( it == mPoints.end()) {
                        newVs.emplace_back(mVs[i]);
                        newNs.emplace_back(mNs[i]);
                        newCs.emplace_back(mCs[i]);
                    }
                }
                mVs = newVs;
                mNs = newNs;
                mCs = newCs;
                mPoints.clear();
                rebuildPC();
                if ( !mVs.empty()){
                    auto rb = g_GLSelector->RubberBand();
                    auto &&tmp = g_GLSelector->SelectPoints3D("Shade",
                                                        &mVs.at(0)[0],
                                                        mVs.size(),
                                                        rb->pos()+rb->rect().center(), false,
                                                        rb->width(), rb->height());
                    if ( !tmp.empty())
                    {
                        for (auto pt_id : tmp ){
                            if (Qt::ControlModifier & e->modifiers()){
                                if ( !mPoints.contains(pt_id)){
                                    mPoints.insert(pt_id, mPoints.size());
                                }
                            }else if (Qt::ShiftModifier & e->modifiers()){
                                if ( mPoints.contains(pt_id)){
                                    qDebug() << mPoints.take(pt_id);
                                }
                            }else{
//                                mPoints.clear();
//                                mPoints.insert(pt_id,0);
                                if ( !mPoints.contains(pt_id)){
                                    mPoints.insert(pt_id, mPoints.size());
                                }
                            }
                        }

                        QString info("Picked Points:");
                        for ( auto &p : mPoints ){
                            info += tr("%1\n").arg(p);
                        }

                        if (!mPoints.empty()){
                            emit glUpdateRequest();
                        }
                        event->accept();
                    }
                }
                else
                {
                    auto rb = g_GLSelector->RubberBand();
                    auto &&tmp = g_GLSelector->SelectInWorld("Shade",
                                                            rb->pos()+rb->rect().center());
                    for ( auto &o : tmp ){
                        if ( o.lock() && LP_PointCloudImpl::mTypeName == o.lock()->TypeName()) {
                            mObject = o;
                            auto pc = std::static_pointer_cast<LP_PointCloudImpl>(o.lock());
                            mVs = pc->Points();
                            mNs = pc->Normals();
                            mCs = pc->Colors();
                            LP_Document::gDoc.RemoveObject(std::move(o));
                            emit glUpdateRequest();
                            event->accept();;    //Since event filter has been called
                        }
                    }
                }
            }
            emit glUpdateRequest();
            break;
        }
        case Qt::Key_Enter:{
            auto pc = std::static_pointer_cast<LP_PointCloudImpl>(mObject.lock());
            pc->SetPoints(std::move(mVs));
            pc->SetNormals(std::move(mNs));
            pc->SetColors(std::move(mCs));
            mVs.clear();
            mNs.clear();
            mPoints.clear();
            LP_Document::gDoc.AddObject(std::move(mObject));
            emit glUpdateRequest();
            break;
            break;
        }
        }
    }
    return QObject::eventFilter(watched, event);
}

bool LP_Plugin_Singa_PC::importPLY()
{
    auto file = QFileDialog::getOpenFileName(0,tr("Import Point Cloud"), "",
                                             tr("PointCloud(*.ply)"));

    if ( file.isEmpty()){
        return false;
    }
    qDebug()<<"Start import PLY File...";
    pcl::PointCloud<pcl::PointXYZRGBNormal>::Ptr cloud(new pcl::PointCloud<pcl::PointXYZRGBNormal>);
    if (pcl::io::loadPLYFile<pcl::PointXYZRGBNormal>(file.toStdString(), *cloud) == -1) //* 读入PCD格式的文件，如果文件不存在，返回-1
    {
        PCL_ERROR("Couldn't read file test_pcd.pcd \n"); //文件不存在时，返回错误，终止程序。
        return (false);
    }
    cloud_buffer.emplace_back(cloud);
    qDebug()<<"The amount of oringal PointCloud is :"<<cloud_buffer.back()->size();

//-------------Filter3: FastBilateralFilter(unavaliable)----------------//
//    pcl::FastBilateralFilter<pcl::PointXYZRGB> filter_fbf;
//    filter_fbf.setInputCloud (cloud);
//    filter_fbf.setSigmaS (0.05);//设置双边滤波器用于空间邻域/窗口的高斯的标准偏差
//    filter_fbf.setSigmaR (0.05);//设置高斯的标准偏差用于控制相邻像素由于强度差异而下降多少（在我们的情况下为深度）
//    filter_fbf.filter(*cloud_filtered);

    return true;
}

bool LP_Plugin_Singa_PC::generatePC()
{
    if(!mObject.lock()) {qDebug()<<"No object found!"; return false;}
    auto c = std::static_pointer_cast<LP_PointCloudImpl>(mObject.lock());
    LP_Document::gDoc.RemoveObject(std::move(mObject));
    qDebug()<<"Start Generation";
    pcl::PointCloud<pcl::PointXYZRGBNormal>::Ptr cloud(new pcl::PointCloud<pcl::PointXYZRGBNormal>);
    for(int i = 0;i<c->Points().size();i++)
    {
        pcl::PointXYZRGBNormal p(mVs[i][0],mVs[i][1],mVs[i][2],
                (uint8_t)(mCs[i][0]*255),(uint8_t)(mCs[i][1]*255),(uint8_t)(mCs[i][2]*255),
                mNs[i][0],mNs[i][1],mNs[i][2]);
        cloud->emplace_back(p);
    }
    cloud_buffer.emplace_back(cloud);
    qDebug()<<"The amount of oringal PointCloud is :"<<cloud_buffer.back()->size();
    return true;
}

bool LP_Plugin_Singa_PC::rebuildmesh()
{
    if(cloud_buffer.size()==0) return false;
    pcl::PointCloud<pcl::PointXYZRGBNormal>::Ptr cloud;
    cloud = cloud_buffer.back();
    mVs.clear();mNs.clear();mCs.clear();
    for(int i =0;i<cloud->points.size();i++)
    {
        QVector3D mN;QVector3D mC;QVector3D mV;
        for(int j = 0;j<3;j++)
        {
            mN[j] = (cloud->points[i]._PointXYZRGBNormal::normal[j]);

            mV[j] = (cloud->points[i]._PointXYZRGBNormal::data[j]);
        }
        mC[0] = ((float)cloud->points[i]._PointXYZRGBNormal::r)/255.0f;
        mC[1] = ((float)cloud->points[i]._PointXYZRGBNormal::g)/255.0f;
        mC[2] = ((float)cloud->points[i]._PointXYZRGBNormal::b)/255.0f;
        mNs.emplace_back(mN);
        mCs.emplace_back(mC);
        mVs.emplace_back(mV);
    }
    return true;
}

bool LP_Plugin_Singa_PC::rebuildPC()
{
    if(mVs.empty()||mVs.size()==cloud_buffer.back()->size()) return false;
    pcl::PointCloud<pcl::PointXYZRGBNormal>::Ptr cloud(new pcl::PointCloud<pcl::PointXYZRGBNormal>);
    for(int i = 0;i<mVs.size();i++)
    {
        pcl::PointXYZRGBNormal p(mVs[i][0],mVs[i][1],mVs[i][2],
                (uint8_t)(mCs[i][0]*255),(uint8_t)(mCs[i][1]*255),(uint8_t)(mCs[i][2]*255),
                mNs[i][0],mNs[i][1],mNs[i][2]);
        cloud->emplace_back(p);
    }
    cloud_buffer.emplace_back(cloud);
    labelBufferLength->setText(QString::number(cloud_buffer.size()));
    qDebug()<<"The amount of current PointCloud is :"<<cloud_buffer.back()->size();
    return true;
}

bool LP_Plugin_Singa_PC::saveMesh()
{
    auto pc = std::static_pointer_cast<LP_PointCloudImpl>(mObject.lock());
    pc->SetPoints(std::move(mVs));
    pc->SetNormals(std::move(mNs));
    pc->SetColors(std::move(mCs));
    mVs.clear();
    mNs.clear();
    mCs.clear();
    mPoints.clear();
    cloud_buffer.clear();
    LP_Document::gDoc.AddObject(std::move(mObject));
    emit glUpdateRequest();
    return true;
}

bool LP_Plugin_Singa_PC::resample()
{
    if(cloud_buffer.size()==0)
    {
        qDebug()<<"ERROR: NO POINTCLOUD DETECTED!";
        return false;
    }
    auto cloud = cloud_buffer.back();
    pcl::PointCloud<pcl::PointXYZRGBNormal>::Ptr cloud_filtered(new pcl::PointCloud<pcl::PointXYZRGBNormal>);
    pcl::VoxelGrid<pcl::PointXYZRGBNormal> downSampled;
    downSampled.setInputCloud (cloud);
    downSampled.setLeafSize (resample_x->value(), resample_y->value(), resample_z->value());
    downSampled.filter (*cloud_filtered);
    cloud_buffer.emplace_back(cloud_filtered);
    if(cloud_buffer.back()->size()==0)
    {
        cloud_buffer.pop_back();
        qDebug()<<"The PointCloud is empty, please double-check the parameters";
        return false;
    }
    if(cloud_buffer.back()->size()==cloud_buffer[cloud_buffer.size()-2]->size())
    {
        cloud_buffer.pop_back();
        qDebug()<<"The filter is useless, please double-check the parameters";
        return false;
    }
    qDebug()<<"The amount of resampled PointCloud is :"<<cloud_buffer.back()->size();
    return true;
}

bool LP_Plugin_Singa_PC::filter_ROR()
{
    if(cloud_buffer.size()==0)
    {
        qDebug()<<"ERROR: NO POINTCLOUD DETECTED!";
        return false;
    }
    else
    {
        auto cloud = cloud_buffer.back();
        pcl::PointCloud<pcl::PointXYZRGBNormal>::Ptr cloud_filtered(new pcl::PointCloud<pcl::PointXYZRGBNormal>);
        pcl::RadiusOutlierRemoval<pcl::PointXYZRGBNormal> filter_ror;
        filter_ror.setInputCloud (cloud);
        filter_ror.setRadiusSearch(ROR_p1->value());               // 设置搜索半径
        filter_ror.setMinNeighborsInRadius(ROR_p2->value());      // 设置一个内点最少的邻居数目
        filter_ror.filter (*cloud_filtered);
        cloud_buffer.emplace_back(cloud_filtered);
        if(cloud_buffer.back()->size()==0)
        {
            cloud_buffer.pop_back();
            qDebug()<<"The PointCloud is empty, please double-check the parameters";
            return false;
        }
        if(cloud_buffer.back()->size()==cloud_buffer[cloud_buffer.size()-2]->size())
        {
            cloud_buffer.pop_back();
            qDebug()<<"The filter is useless, please double-check the parameters";
            return false;
        }
        qDebug()<<"The amount of ROR filtered PointCloud is :"<<cloud_buffer.back()->size();
    }
    return true;
}

bool LP_Plugin_Singa_PC::filter_statistic()
{
    if(cloud_buffer.empty())
    {
        qDebug()<<"ERROR: NO POINTCLOUD DETECTED!";
        return false;
    }
    auto cloud = cloud_buffer.back();
    pcl::PointCloud<pcl::PointXYZRGBNormal>::Ptr cloud_filtered(new pcl::PointCloud<pcl::PointXYZRGBNormal>);
    pcl::StatisticalOutlierRemoval<pcl::PointXYZRGBNormal> filter_statistic;   //创建滤波器对象
    filter_statistic.setInputCloud (cloud);                           //设置待滤波的点云
    filter_statistic.setMeanK (statistic_p1->value());                               //设置在进行统计时考虑的临近点个数
    filter_statistic.setStddevMulThresh (statistic_p2->value());                      //设置判断是否为离群点的阀值，用来倍乘标准差，也就是上面的std_mul
    filter_statistic.filter (*cloud_filtered);                    //滤波结果存储到cloud_filtered
    cloud_buffer.emplace_back(cloud_filtered);
    if(cloud_buffer.back()->size()==0)
    {
        cloud_buffer.pop_back();
        qDebug()<<"The PointCloud is empty, please double-check the parameters";
        return false;
    }
    if(cloud_buffer.back()->size()==cloud_buffer[cloud_buffer.size()-2]->size())
    {
        cloud_buffer.pop_back();
        qDebug()<<"The filter is useless, please double-check the parameters";
        return false;
    }
    qDebug()<<"The amount of statistic filtered PointCloud is :"<<cloud_buffer.back()->size();
    return true;
}

bool LP_Plugin_Singa_PC::remove_manual()
{
    if(cloud_buffer.empty())
    {
        qDebug()<<"ERROR: NO POINTCLOUD DETECTED!";
        return false;
    }
    auto cloud = cloud_buffer.back();
    for(int i =0;i<cloud->points.size();i++)
    {
        if(cloud->points[i]._PointXYZRGBNormal::x<0)
            indexs_selected.emplace_back(i);
    }
    for(int i = indexs_selected.size()-1;i>-1;i--)
    {
        cloud->erase(cloud->begin()+indexs_selected[i]);
    }
    return true;
}

bool LP_Plugin_Singa_PC::exportObj()
{
    if(!mObject.lock()) {qDebug()<<"No object found!"; return false;}
    auto pc = std::static_pointer_cast<LP_PointCloudImpl>(mObject.lock());
    LP_OpenMesh mesh;
    qDebug()<<pc->Points().size();
    if(pc->Points().size()==0) return false;
    if ( LP_PointCloudImpl::mTypeName == mObject.lock()->TypeName())
    {
        MyMesh m = std::make_shared<OpMesh>();
        auto &pts = pc->Points();
        auto &norms = pc->Normals();
        auto nv = pts.size();
        for ( size_t i=0; i<nv; ++i)
        {
            auto &pt = pts[i],
                 &nl = norms[i];
            OpMesh::Point p;
            OpMesh::Normal n;
            p[0] = pt.x();
            p[1] = pt.y();
            p[2] = pt.z();
            n[0] = nl.x();
            n[1] = nl.y();
            n[2] = nl.z();
            auto vh = m->add_vertex(p);
            m->set_normal(vh, n);
        }
        mesh = LP_OpenMeshImpl::Create(nullptr);
        mesh->SetMesh(m);
    }
    if ( !mesh ){
        qInfo() << "No object selected";
        return false;
    }


    auto file = QFileDialog::getSaveFileName(0,tr("Export OBJ"), "",
                                             tr("Wavefront (*.obj)"));

    if ( file.isEmpty()){
        return false;
    }
    auto cmd = new LP_Cmd_Export_Obj;
    cmd->SetFile(file);
    cmd->SetMesh(std::move(mesh));
    if ( !cmd->VerifyInputs()){
        delete cmd;
        return false;
    }
    return true;
}

QString LP_Plugin_Singa_PC::MenuName()
{
    return tr("menuPlugins");
}

QAction *LP_Plugin_Singa_PC::Trigger()
{
    if ( !mAction ){
        mAction = new QAction("PointCloud Postprocess");
    }
    return mAction;
}
