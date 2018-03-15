# arco_ros_utils
Collection of ROS utilis.

Repos:

## arco_ros_utils_py
Collections of python scripts

### tf_echo
Script to get position and quaternion information of a source frame w.r.t. a target frame.

Usage: `rosrun arco_ros_utils_py tf_echo <target_frame> <source_frame>`

Hints: target_P = RotMatrix(q_from_tf_echo) * source_P
