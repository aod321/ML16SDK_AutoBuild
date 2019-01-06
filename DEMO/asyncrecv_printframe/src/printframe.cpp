#include <iostream>
#include "ML16lidar.h"
using namespace std;

#define RED 0XFF0000
#define BLUE 0x0000FF

ML16 lidarinstance;                             //雷达类实例化

int main(){

        lidarinstance.set_Mode("in");           //设定为室内模式,主要决定距离和颜色渐变模式
        lidarinstance.set_Color(RED,BLUE);      //从红色向蓝色按距离渐变
        lidarinstance.set_Angle(0,359);         //可选调整雷达开始和结束角,默认为0到360

        lidarinstance.start_capture(0); //0表示UDP异步接收(单独接收线程)
        std::string recv;
        cout<<"开启接收线程"<<endl;
        while(1){
                while(lidarinstance.capture_finish){

                        recv = lidarinstance.publish_pointcloud.getpoints_PCDFormat();
                       // recv = lidarinstance.publish_pointcloud.getpoints_XYZRGBFormat();
                        if(recv!=""){
//                                cout<<"Data Formart in XYZRGB"<<endl;
                                cout<<"Data Format in PCD"<<endl;
                                cout<<recv;
                                cout<<"*********************"<<endl;
                        }
                }
        }


        return 0;


}
        






