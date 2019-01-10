#include <iostream>
#include <string>
#include <boost/thread/thread.hpp>
#include <boost/asio.hpp>
#include <sys/types.h>
#include <pcl/point_types.h>
#include <pcl/point_cloud.h>

namespace tanway{ 
class UDP_SOCKET{

        private: 
                boost::asio::io_service io_serviceA;
                boost::asio::ip::udp::socket *udp_socketptr;
                int port;
                std::string ip;



        public:
                unsigned char receive_str[300];
                UDP_SOCKET();
                void begin();
                std::size_t get_Recv();
                void clear_recv(){memset(receive_str,0,300);}
                void end();
};

class ML16{
        private: 
                float v_Angle[16];
                float RA;  
                int re; 
                int StartAngle;
                int EndAngle;
                std::string mode;
                uint32_t BeginColor;         //渐变开始色 Red
                uint32_t EndColor;           //渐变结束色 Blue

                /*  Lidar Data Decode variables Define*/
                int hA;                     /*水平角度*/
                int seq,intense;
                float length,h_Angle;
                float rgb;
                double x,y,z;
                double cosvA_RA,coshA_RA,sinhA_RA,sinvA_RA;
                std::string Headerstr,Datastr;
                std::ostringstream stringStream;
                float ColorThrehold;
                unsigned char* buf;
                UDP_SOCKET udp;
                boost::thread* thr;
                
                pcl::PointXYZRGB pointbase;
                pcl::PointCloud<pcl::PointXYZRGB> temp_pointcloud;




                /*Convert byte to int   */
                int bytesToInt(unsigned char high,unsigned char low){
                        int addr = low & 0xFF;
                        addr |= ((high<<8) & 0XFF00);
                        return addr;
                }
                float getColorbyL(float);     
                void capture();
                
                

        public:
                ML16();
                void start_capture(int sync);     /*0异步，1同步*/
                void stop();
                void thrjoin();
                void set_Color(uint32_t,uint32_t);
                void set_Mode(std::string);
                void set_Angle(int start,int end){StartAngle=start;EndAngle=end;}
                std::string get_Mode(){return mode;}
                int capture_finish;
                pcl::PointCloud<pcl::PointXYZRGB> publish_pointcloud;
};
}
