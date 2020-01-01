
** 手指静脉识别项目 **

# 项目方案设计介绍
本项目实现手指图像的处理和匹配算法，需要处理的数据是本人不同手指的图像，首先经过图像处理，使得指静脉的纹理增强凸显处理，然后将所有的这些图像进行相互间的匹配，检验类内和类间的匹配度，观察其是否能够明显区分开来，并据此计算正确率。
在本项目中，由于是基于算法原型的研究，因此我们选用了操作便捷的Matlab R2019b软件作为运行环境，在Windows 10 Pro for Workstation操作系统中实现算法。
算法分为以下几个过程：
图像预处理过程中，需要增强图像，提取手指区域，为识别做准备。拟采用CLAHE、直方图均衡、二值化等算法，以达到增强图像的效果；拟采用边缘检测算法实现手指的识别和提取
图像的特征提取和匹配过程中，拟采用两类不同的方法。一是局部不变特征提取算法。这些算法具有检测图像中的特征点，并对特征点的局部区域进行描述和匹配的功能。。二是针对二值化图像的模板匹配，检测其匹配度。


# 文件结构说明
注意：以下代码中涉及的文件夹需要先自行创建，使用其它数据来源需要先自行更改字符段中涉及的文件夹。代码中的“.\590”文件夹是本人指静脉数据来源文件夹。文件夹目录结构如下：
\图像处理与机器视觉创新实践:.
│  20191121《机器视觉创新实践》课题研究任务书（一）.pdf
│  590.zip
│  cut.m
│  gaborfilte.m
│  gaborfilter2.m
│  ImageEnhancement.m
│  img2deg.m
│  input2FingerImg.m
│  README.md
│  LICENSE
│  sift-图像增强实现2-1.mat   % 由于SIFT算法耗时较长，其结果被保存下来以便多次使用
│  SIFTpair.asv
│  SIFTpair.m
│  SURFpair.m
│  TemplateMatching.m
│  tmp.key
│  tmp.pgm
│
├─590
├─siftDemoV4
│      appendimages.m
│      basmati.pgm
│      book.pgm
│      box.pgm
│      defs.h
│      LICENSE
│      Makefile
│      match.c
│      match.m
│      README
│      scene.pgm
│      showkeys.m
│      sift
│      sift.m
│      siftWin32.exe
│      tmp.key
│      tmp.pgm
│      util.c

# 运行指南
## 提取ROI区域
运行cut.m
## 图像增强与二值化
运行ImageEnhancement.m
## Gabor图像滤波
运行gaborfilte.m
## SIFT算法特征检测与匹配
在执行此程序前需要将siftDemoV4文件夹及其子文件夹添加到路径，在matlab中右键菜单即可操作。
运行SIFTpair.m
## SURF算法特征检测与匹配
运行SURFpair.m
## 归一化互相关模板匹配
运行TemplateMatching.m
