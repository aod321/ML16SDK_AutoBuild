# ML16 SDK 交叉编译与移植使用手册

标签（空格分隔）： ML16 激光雷达 SDK 交叉编译 ARM移植

---
# 说明

文件目录结构如下:

```
ML16SDK-AutoBuild
│   README.md                               #说明文档
│  
└───ML16SDK                                 #SDK工程目录
│   │   CMakeLists.txt
│   │   compile.sh                          #编译脚本
│   │
│   └───src
│   │   ├── CMakeLists.txt
│   │   ├── ML16Lidar.cpp
│   │   └── ML16lidar.h
│   └───toolchains                          #工具链切换
│    ├── arm-linux-toolChain.cmake
│    └── local-toolChain.cmake
└───boost_lib
│   │   instal-boost.sh                 #预编译boost库安装脚本
│   │   
│   └───armhf       #采用arm-linux-gnueabihf-g++编译的boost
│   │    └───boost
│   │        └───...
│   └───x86         #采用linux-x86-64-gcc编译的boost(一般PC)
│   │    └───include
│   │        └───...
│   │    └───lib
│   │        └───...
│   |
└───DEMO           #SDK示例程序目录
│   │
│   └───asyncrecv_printframe    #异步接收方式使用示例
│       │   CMakeLists.txt 
│       │   compile.sh          #编译脚本
│   │    └───src                #源码目录
│   │        |   ...
│   │        └───CMakeLists.txt
│   │    └───toolchains        #工具链切换
│   │        └───... 
```

# 安装arm交叉编译工具链
```
sudo apt-get install gcc-arm-linux-gnueabihf
sudo apt-get install g++-arm-linux-gnueabihf
```

# 安装boost库
本项目采用预编译的方式,利用install-boost.sh脚本根据不同架构安装交叉编译好的boost库.
```
cd boost_lib/
./install-boost.sh local       #安装x86架构的boost库
./install-boost.sh arm         #安装交叉编译的arm架构
```

关于如何交叉编译boost库的详细指南请看[Boost交叉编译移植ARM技术文档](https://www.zybuluo.com/aod321/note/1383379)

# 本地编译SDK和DEMO

```
#本地编译SDK
cd ~/ML16SDK-AutoBuild/
cd ML16SDK/
./compile.sh local
#编译完成后自动安装ML16库到/usr/local目录下

#本地编译DEMO
cd ~/ML16SDK-AutoBuild/
cd DEMO/asyncrecv_printframe/
./compile.sh local
#编译完成后可在asyncrecv_printframe/localbin/目录下找到可执行文件
```
# 交叉编译SDK和DEMO

```
#本地编译SDK
cd ~/ML16SDK-AutoBuild/
cd ML16SDK/
./compile.sh arm
#编译完成后自动安装ML16库到/opt/ML16目录下

#本地编译DEMO
cd ~/ML16SDK-AutoBuild/
cd DEMO/asyncrecv_printframe/
./compile.sh arm
#编译完成后可在asyncrecv_printframe/arm-bin/目录下找到可执行文件
```

# 如何移植到ARM板

## 方法1.在PC上交叉编译后上传到ARM宿主机

### 1.将本机/opt目录下库文件拷贝到arm运行的linux系统同目录下
```
    local(PC)           target(ARM)
    /opt/boost   -->  /opt/boost
    /opt/ML16    -->  /opt/ML16
```
### 2. 将DEMO程序可执行文件复制到ARM宿主机执行即可
```
    local(PC)                    target(ARM)
    /arm-bin/testprint   -->    path/testprint
                                
                                ./testprint
```

## 方法2.直接在ARM宿主机上采用本地编译的方式(编译速度可能较慢)
