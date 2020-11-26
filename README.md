# 人脸识别小车

### 硬件实现

黑金AX7010开发板（插入已安装PYNQ平台的SD卡）、小车套件、USB摄像头、舵机2个（分别控制摄像头的水平与俯仰角）、电机2个（左右轮）、电机控制模块、开发板电源（5V）、电机与舵机电源（6V）、线材与其他固定装置若干。

### 文件描述

##### pynq_pwm文件夹

含用于创建自定义模块的Vivado工程，Block Design中含ZYNQ模块与6个PWM模块，其中4个用于控制电机，2个用于控制舵机。

##### ip文件夹

含自定义IP核，供Vivado工程使用。

##### knn文件夹

含运行在PYNQ平台上的人脸检测、识别与控制小车的主程序。其中人脸检测由OpenCV库实现，人脸识别用LightCNN实现。

### 效果图

<img width="320" height="240" src="https://github.com/Starman-SWA/Face-recognition-trolley-based-on-AX7010-FPGA-development-board/raw/main/photo_2020-10-25_18-34-00.jpg"/>
