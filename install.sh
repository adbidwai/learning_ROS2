#! /usr/bin/bash

####################################################################################
# The following install script is for installing ROS2 Foxy Fritzoy in Ubuntu 20.04 #
####################################################################################

sudo apt update && sudo apt install curl gnupg2 lsb-release wget
curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | sudo apt-key add -
sudo sh -c 'echo "deb [arch=$(dpkg --print-architecture)] http://packages.ros.org/ros2/ubuntu $(lsb_release -cs) main" > /etc/apt/sources.list.d/ros2-latest.list'
wget https://github.com/ros2/ros2/releases/download/release-foxy-20200807/ros2-foxy-20200807-linux-focal-amd64.tar.bz2 -P ~/Downloads/
mkdir -p ~/ros2_foxy
cd ~/ros2_foxy
tar xf ~/Downloads/ros2-foxy-linux-x86_64.tar.bz2
sudo apt update
sudo apt install -y python3-rosdep
sudo rosdep init
rosdep update
rosdep install --from-paths ~/ros2_foxy/ros2-linux/share --ignore-src --rosdistro foxy -y --skip-keys "console_bridge fastcdr fastrtps osrf_testing_tools_cpp poco_vendor rmw_connext_cpp rosidl_typesupport_connext_c rosidl_typesupport_connext_cpp rti-connext-dds-5.3.1 tinyxml_vendor tinyxml2_vendor urdfdom urdfdom_headers"
sudo apt install -y libpython3-dev python3-pip
pip3 install -U argcomplete
