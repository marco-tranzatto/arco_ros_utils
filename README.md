# arco_ros_utils
Collection of ROS utilis.

Folders:

## arco_ros_cpp_template

### local_guidance_widget_manager
ROS node C++ template with any_node, clang-tools, etc.

## arco_ros_utils_kalibr

### template_uvc_realsense
Template to calibrate a Realsense D435 and a UVC device.

## arco_ros_utils_launch
Collection of launch files.

## arco_ros_utils_matlab
Collection of Matlab scripts.

### transformation2static_transform_publisher
Converts a transformation matrix (T_parent_child = [RotMatrix, Position; 0, 0, 0, 1]) to a string that can be used in a launch file to create a ROS static 
transform publisher.

Usage: `outputString = transformation2static_transform_publisher(T_target_source, targetFrameName, sourceFrameName);`

target_P = T_target_source * source_P

## arco_ros_utils_py
Collections of python scripts

### tf_echo
Script to get position and quaternion information of a source frame w.r.t. a target frame.

Usage: `rosrun arco_ros_utils_py tf_echo <target_frame> <source_frame>`

Hints: target_P = RotMatrix(q_from_tf_echo) * source_P

## arco_ros_utils_record_scripts
Collection of rosbag record scripts.
