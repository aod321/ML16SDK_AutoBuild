#include <unistd.h>
#include <sys/types.h>
#include <boost/bind.hpp>
#include <boost/thread/thread.hpp>
#include <boost/asio.hpp> 
#include <iostream>
#include <ML16lidar.h>

using namespace boost::asio;
using namespace tanway;

void UDP_SOCKET::begin(){
        try{
                udp_socketptr = new ip::udp::socket(io_serviceA); 
                ip::udp::endpoint local_add(ip::address::from_string(ip),port);
                udp_socketptr->open(local_add.protocol());
                udp_socketptr->bind(local_add);
        }
        catch(std::exception&e){
                std::cerr<<e.what()<<std::endl;
        }
}
void UDP_SOCKET::end(){
        io_serviceA.stop();
}

std::size_t UDP_SOCKET::get_Recv(){

        std::size_t recv_len;
        ip::udp::endpoint  sendpoint;      //请求IP
        clear_recv();
        recv_len=udp_socketptr->receive_from(buffer(receive_str, 300),sendpoint);//收取
        return recv_len;
} 



UDP_SOCKET::UDP_SOCKET(){
        memset(receive_str,0,300);
        port = 5600;
        ip="0.0.0.0";
}
















void ML16::capture(){
        unsigned char *p;
        int publish_flag;
        int point_count=0;
        int recv_len=0;
        while(1){
                udp.clear_recv();
                recv_len=udp.get_Recv();
                buf = udp.receive_str;
                if(recv_len!=0){  
                        hA=bytesToInt(buf[8],buf[7])/100.f;
                        if(hA>=StartAngle && hA<=EndAngle){
                                capture_finish=0;
                                publish_flag = 1;
                                for(p=buf+4;*p!=0;p+=6){
                                        point_count++;
                                        seq = p[0];
                                        length =(bytesToInt(p[2],p[1]) * 0.032)*0.15;
                                        h_Angle = bytesToInt(p[4],p[3]) / 100.f;
                                        intense = p[5];
                                        coshA_RA = cos(h_Angle * RA);
                                        cosvA_RA = cos(v_Angle[seq-1] * RA);
                                        sinhA_RA = sin(h_Angle * RA);
                                        sinvA_RA = sin(v_Angle[seq -1] * RA);
                                        x = length * cosvA_RA * coshA_RA;
                                        y = length * cosvA_RA * sinhA_RA;
                                        z = length * sinvA_RA;
                                        rgb =getColorbyL(length);
                                        pointbase.x=x;
                                        pointbase.y=y;
                                        pointbase.z=z;
                                        pointbase.rgb=rgb;
                                        temp_pointcloud.points.push_back(pointbase);
                                }
                        }
                        if(hA>=EndAngle && publish_flag){

                                capture_finish=0;
                                publish_pointcloud.points.clear();
                                temp_pointcloud.width=point_count;
                                temp_pointcloud.height=1;

                                //Specifies if all the data in points is finite (true), or whether the XYZ values of certain points might contain Inf/NaN values (false).
                                temp_pointcloud.is_dense = false;
                                temp_pointcloud.points.resize (temp_pointcloud.width * temp_pointcloud.height);


                                publish_pointcloud = temp_pointcloud;
                                capture_finish=1;
                                temp_pointcloud.points.clear();
                                point_count=0;
                                publish_flag = 0;
                        }
                }
                else{
                        publish_pointcloud.points.clear();
                
                }
       }
}




void ML16::set_Color(uint32_t Start,uint32_t End){
        StartAngle = Start;
        EndAngle = End;
}


void ML16::set_Mode(std::string m){
        mode = m;
        if(mode == "in")ColorThrehold = 30;
        else ColorThrehold = 150;
}





// 颜色随距离插值法渐变
float ML16::getColorbyL(float length){
        /* 24位RGB分开处理 */
        uint8_t r0 = (BeginColor >> 16) & 0x0000ff;
        uint8_t r1 = (EndColor >> 16) & 0x0000ff;
        uint8_t g0 = (BeginColor >> 8)  & 0x0000ff;
        uint8_t g1 = (EndColor >> 8)  & 0x0000ff;
        uint8_t b0 = (BeginColor)  & 0x0000ff;
        uint8_t b1 = (EndColor)  & 0x0000ff;
        /* 颜色随距离渐变  */
        float dDeltaR=(r1-r0)/(float)ColorThrehold;
        float dDeltaG=(g1-g0)/(float)ColorThrehold;
        float dDeltaB=(b1-b0)/(float)ColorThrehold;
        uint8_t r_R=r0 + dDeltaR*length;
        uint8_t r_G=g0 + dDeltaG*length;
        uint8_t r_B=b0 + dDeltaB*length;
        /* 以下两行代码将RGB数据按照PCL中对PointCLoud的要求处理,
         * 以下两行注释为原文引用，以供参考*/ 
        /*Due to historical reasons*
         *the RGB information is packed into an integer 
         *and casted to a float.*
         *Refrence from 
         *http://docs.pointclouds.org/1.7.0/structpcl_1_1_point_x_y_z_r_g_b.html*
         */
        uint32_t r_RGB = ((uint32_t)r_R << 16 | (uint32_t)r_G << 8 | (uint32_t)r_B);
        float rgb = *reinterpret_cast<float*>(&r_RGB);
        return rgb;
}


void ML16::start_capture(int sync){
        udp.begin();
        if(!sync){
                if(!thr)
                        thr = new boost::thread(boost::bind(&ML16::capture, this));
        }
        else 
                capture();

}




void ML16::thrjoin(){
        thr->join();
}

void ML16::stop(){
        udp.end();
}


ML16::ML16(){

        for(int i=0;i<16;i++)
                v_Angle[i]=(13/8.f)*((i+1)-8.5);
        
        RA = (float) (3.14159265f / 180.0f);  
        mode = "in";
        BeginColor=0xFF0000;         //渐变开始色 Red
        EndColor=0X0000FF;           //渐变结束色 Blue
        ColorThrehold=30;
        capture_finish=0;


}






