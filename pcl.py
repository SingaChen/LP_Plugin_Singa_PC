import re
import os

def isDebug(lib):
    return len(re.findall(r'.+debug\..+',lib))!=0 or len(re.findall(r'.+-gd-+',lib))!=0 or len(re.findall(r'.+-gd\..+',lib))!=0 or len(re.findall(r'.+_d\..+',lib))!=0 or len(re.findall(r'.+d\..+',lib))!=0
def get_libs():
    return [os.path.abspath('.')+'\\'+f for f in os.listdir() if len(re.findall(r'.+\.lib',f))!=0]
def get_debug_release(libs):
    dbg=[d for d in libs if isDebug(d)]
    rls=[r for r in libs if not isDebug(r)]
    return dbg,rls 
def get_pairs(dbg,rls):
    d_mod=list(dbg)
    r_mod=list(rls)
    d_mod=[d.replace('_debug','') for d in d_mod]
    r_mod=[r.replace('_release','') for r in r_mod]
    d_mod=[d.replace('-gd-','-') for d in d_mod]
    d_mod=[d.replace('-gd.','.') for d in d_mod]
    d_mod=[d.replace('_d.','.') for d in d_mod]
    d_mod=[d.replace('d.','.') for d in d_mod]
    d_match=[dbg[i] for i in range(len(dbg)) if d_mod[i] in r_mod]
    r_match=[rls[r_mod.index(d_mod[i])] for i in range(len(d_match))]
    return d_match,r_match
    
root=os.path.abspath('.')
all_dbg=[]
all_rls=[]
paths=[root+'/lib/',root+'/3rdParty/Boost/lib/',root+'/3rdParty/FLANN/lib/',root+'/3rdParty/Qhull/lib/',root+'/3rdParty/VTK/lib/']
for p in paths:
    os.chdir(p)
    libs=get_libs()
    debug,release=get_debug_release(libs)
    all_dbg+=debug
    all_rls+=release
all_dbg+=['D:\\PCL1.11.1\\3rdParty\\OpenNI2\\Lib\\OpenNI2.lib']
all_rls+=['D:\\PCL1.11.1\\3rdParty\\OpenNI2\\Lib\\OpenNI2.lib']
all_dbg=[item.replace('\\','/') for item in all_dbg]
all_rls=[item.replace('\\','/') for item in all_rls]
lib_d,lib_r=get_pairs(all_dbg,all_rls)
#print(paths)
print(len(all_dbg))

text=''

#添加包含目录
text+=('INCLUDEPATH += '+root.replace('\\','/')+'/include/pcl-1.11\n')
text+=('INCLUDEPATH += '+root.replace('\\','/')+'/3rdParty/Boost/include/boost-1_74\n')
text+=('INCLUDEPATH += '+root.replace('\\','/')+'/3rdParty/Eigen/eigen3\n')
text+=('INCLUDEPATH += '+root.replace('\\','/')+'/3rdParty/FLANN/include\n')
text+=('INCLUDEPATH += '+root.replace('\\','/')+'/3rdParty/OpenNI2/Include\n')
text+=('INCLUDEPATH += '+root.replace('\\','/')+'/3rdParty/Qhull/include\n')
text+=('INCLUDEPATH += '+root.replace('\\','/')+'/3rdParty/VTK/include/vtk-8.2\n\n')

#添加依赖项
for (d,r) in zip(lib_d,lib_r):
    path=os.path.dirname(d)
    d_name=os.path.basename(d).replace('.lib','')
    r_name=os.path.basename(r).replace('.lib','')
    text+=('win32:CONFIG(release, debug|release): LIBS += -L'+path+'/'+' -l'+r_name+'\n')
    text+=('else:win32:CONFIG(debug, debug|release): LIBS += -L'+path+'/'+' -l'+d_name+'\n')
    text+=('else:unix: LIBS += -L'+path+'/'+' -l'+r_name+'\n')
    text+='\n'

#导出
with open(root+'/qt_config.txt','w') as f:
    f.write(text)