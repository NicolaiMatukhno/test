#include <iostream>
#include <boost/asio.hpp>
#include <sensor_msgs/JointState.h>
#include <std_msgs/Float32.h>
#include "ros/ros.h"
#include "std_msgs/Float32MultiArray.h"
#include "vector"
#include "string"
#include "Messenger.h"

using namespace boost::asio;
using ip::tcp;
using std::string;
using std::cout;
using std::endl;

struct ROS_msg_header{
    int msg_type;
};

struct ROS_msg{
    ROS_msg_header header;
    unsigned char data[];
};

struct ROS_msg_joint_data{
    int msg_type;
    float joints[7];
};

struct ROS_msg_gripper_position{
    int msg_type;
    float position;
    int endType;
};

struct ROS_msg_gripper_force{
    int msg_type;
    float force;
};

struct ROS_msgs{
    ROS_msg_gripper_position gripper_position_msg;
    int endType;
};

//void sendData(const std_msgs::Float32& msg){
 //   socket.write_some(boost::asio::buffer(msg.data, ), error);

//}

int main(int argc, char **argv) {
    boost::asio::io_service io_service;
//socket creation
    tcp::socket socket(io_service);
//connection
    std::string IP = argv[1];
    //std::string IP = "192.168.1.13";
    socket.connect(tcp::endpoint(boost::asio::ip::address::from_string(IP), 12000));
    ros::init(argc, argv, "motion_server_L");
    ros::NodeHandle n;
    Messenger<float , const std_msgs::Float32::ConstPtr> messenger;
    ros::Subscriber sub_grippe = n.subscribe("gripper_command_L",5,&Messenger<float , const std_msgs::Float32::ConstPtr>::callback, &messenger);
    ros::Rate loop_rate(10);
    boost::asio::streambuf receive_buffer;
    boost::system::error_code error;
    boost::array<ROS_msg_gripper_position , 1>* buf = new boost::array<ROS_msg_gripper_position , 1>;
    float old_data = messenger.data;
    while (ros::ok()) {
        ros::spinOnce();
        if (old_data != messenger.data){
            ROS_msg_gripper_position msgs;
            msgs.position = messenger.data;
            msgs.msg_type = 3;
            msgs.endType = 0;
            buf->assign(msgs);
            socket.write_some(boost::asio::buffer(buf, 12), error);
            old_data = messenger.data;
    }
        loop_rate.sleep();
    }
    socket.close();
    return 0;
}
