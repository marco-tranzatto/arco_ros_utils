% Frame names:
% M = IMU of the Robot
% C = Camera frame
clc;
clear;
format longg;

% Utils
addpath('../../../arco_ros_utils_matlab/');

% From point 5 of "scripts.txt": check file "flir_camchain.yaml"
T_C_M = [0.009130986052551221, 0.9999169187973762, 0.009098384277963834, -0.03392602082590531;
        -0.012211636864009334, -0.008986580767297081, 0.9998850520390902, -0.011215216476066598;
        0.9998837437516471, -0.009241042629175023, 0.012128565962886362, -0.30857458012523553;
        0.0, 0.0, 0.0, 1.0];
    
T_M_C = invert_transformation(T_C_M);

static_tf_C_M = transformation2static_transform_publisher(T_M_C, 'imu_link', 'flir_camera_calibrated_frame');

% Output
display(static_tf_C_M);