#! /bin/bash
# record topics necessary to calibrate cameras.
INITIAL_PATH=$(pwd)
NOW="$(date +"%F-%H-%M-%S")"
FOLDER_NAME="$(date +"%Y-%m-%d")"

mkdir -p ~/bags/$FOLDER_NAME
cd ~/bags/$FOLDER_NAME

rosparam dump kalibr-visensor-"$NOW".yaml

rosbag record --output-name=kalibr-visensor-"$NOW".bag \
/sensors/imu \
/cam0/image_raw \
/cam0/image_raw_throttle \
/cam1/image_raw \
/cam1/image_raw_throttle \
/imu0

cd $INITIAL_PATH
