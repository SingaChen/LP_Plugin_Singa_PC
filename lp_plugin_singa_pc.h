#ifndef LP_PLUGIN_SINGA_PC_H
#define LP_PLUGIN_SINGA_PC_H

#include "LP_Plugin_Singa_PC_global.h"
#include "plugin/lp_actionplugin.h"


#include "extern/geodesic/geodesic_algorithm_exact.h"
#include <QReadWriteLock>
#include <QThreadPool>
#include <QVector3D>
#include <QVector2D>
#include <QWaitCondition>
#include <QFutureWatcher>
#include <QDoubleSpinBox>
#include "pcl/io/pcd_io.h" //PCL的PCD格式文件的输入输出头文件
#include "pcl/io/ply_io.h"
#include "pcl/point_types.h" //PCL对各种格式的点的支持头文件
//#include "pcl/visualization/cloud_viewer.h"//点云查看窗口头文件
#include "pcl/common/time.h"
#include "pcl/filters/statistical_outlier_removal.h"
#include "pcl/filters/voxel_grid.h"
#include "pcl/filters/radius_outlier_removal.h"
//#include "pcl/filters/fast_bilateral.h"
#include <QObject>



/*Define the name, version of the plugin
*/
#define LP_Plugin_Singa_PC_iid "cpii.rp5.SmartFashion.LP_Plugin_Singa_PC/0.1"

class QOpenGLBuffer;
class QComboBox;
class QLabel;
class QSlider;
class QOpenGLShaderProgram;
class LP_ObjectImpl;


class LP_PLUGIN_SINGA_PC_EXPORT LP_Plugin_Singa_PC : public LP_ActionPlugin
{
    Q_OBJECT
    Q_PLUGIN_METADATA(IID LP_Plugin_Singa_PC_iid)
    Q_INTERFACES(LP_ActionPlugin)
public:
    virtual ~LP_Plugin_Singa_PC();

    // LP_Functional interface
public:
    QWidget *DockUi() override;
    bool Run() override;
    bool eventFilter(QObject *watched, QEvent *event) override;
    bool importPLY();
    bool generatePC();
    bool rebuildmesh();
    bool resample();
    bool filter_ROR();
    bool filter_statistic();
    bool remove_manual();

public slots:
    void FunctionalRender_L(QOpenGLContext *ctx, QSurface *surf, QOpenGLFramebufferObject *fbo, const LP_RendererCam &cam, const QVariant &options) override;

    // LP_ActionPlugin interface
public:
    QString MenuName() override;
    QAction *Trigger() override;

private:
    QThreadPool mPool;
    QDoubleSpinBox *resample_x = new QDoubleSpinBox();
    QDoubleSpinBox *resample_y = new QDoubleSpinBox();
    QDoubleSpinBox *resample_z = new QDoubleSpinBox();
    QDoubleSpinBox *ROR_p1 = new QDoubleSpinBox();
    QDoubleSpinBox *ROR_p2 = new QDoubleSpinBox();
    QDoubleSpinBox *statistic_p1 = new QDoubleSpinBox();
    QDoubleSpinBox *statistic_p2 = new QDoubleSpinBox();
    std::vector<pcl::PointCloud<pcl::PointXYZRGBNormal>::Ptr> cloud_buffer;
    std::vector<int > indexs_selected;
    std::shared_ptr<QWidget> mWidget;
    QLabel *labelBufferLength=nullptr;
    QOpenGLShaderProgram *mProgram = nullptr;
    std::weak_ptr<LP_ObjectImpl> mObject;
    QMap<uint,uint> mPoints;
    std::weak_ptr<LP_RendererCamImpl> mCam;
    bool mInitialized= false;
    std::vector<QVector3D> mVs;
    std::vector<QVector3D> mNs;
    std::vector<QVector3D> mCs;
    void initializeGL();
};



#endif // LP_PLUGIN_SINGA_PC_H
