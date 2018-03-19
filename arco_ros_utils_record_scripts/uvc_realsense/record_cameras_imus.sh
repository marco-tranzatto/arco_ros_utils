#! /bin/bash
# record topics necessary to calibrate cameras.
INITIAL_PATH=$(pwd)
NOW="$(date +"%F-%H-%M-%S")"
FOLDER_NAME="$(date +"%Y-%m-%d")"

mkdir -p ~/bags/$FOLDER_NAME
cd ~/bags/$FOLDER_NAME

rosparam dump kalibr-uvc-realsense-"$NOW".yaml

rosbag record --output-name=kalibr-uvc-realsense-"$NOW".bag \
/sensors/imu \
/uvc_camera/adis_imu \
/uvc_camera/cam_0/image_raw \
/uvc_camera/cam_0/image_raw_throttle \
/uvc_camera/cam_1/image_raw \
/uvc_camera/cam_1/image_raw_throttle \
/realsense/infra1/image_rect_raw \
/realsense/infra1/image_rect_raw_throttle \
/realsense/infra2/image_rect_raw \
/realsense/infra2/image_rect_raw_throttle \
-e "/realsense/extrinsics/(.*)" \
/tf 

cd $INITIAL_PATH
