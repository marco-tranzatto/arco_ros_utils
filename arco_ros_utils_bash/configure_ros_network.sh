#!/usr/bin/env bash

#Configure ROS Network with a master running on a remote computer
echo "Usage : source $0 <MASTER_IP>"
wifi_interface_name="wlp4s0"
#get WIFI IP address of this machine
wifiip=$(ip addr | awk '/inet/ && /'${wifi_interface_name}'/{sub(/\/.*$/,"",$2); print $2}')
export ROS_IP=$wifiip
export ROS_MASTER_URI=http://"$1":11311
echo "ROS_IP="$ROS_IP
echo "ROS_MASTER_URI"=$ROS_MASTER_URI
