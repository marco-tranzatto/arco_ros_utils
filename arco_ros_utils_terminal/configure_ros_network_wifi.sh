#!/usr/bin/env bash

#Configure ROS Network with a master running on a remote computer
echo "Usage : source $0 <MASTER_IP>"
network_interface_name="wlp3s0"
#get IP address of this network interface
machine_ip=$(ip addr | awk '/inet/ && /'${network_interface_name}'/{sub(/\/.*$/,"",$2); print $2}')
export ROS_IP=$machine_ip
export ROS_MASTER_URI=http://"$1":11311
echo "ROS_IP="$ROS_IP
echo "ROS_MASTER_URI"=$ROS_MASTER_URI
