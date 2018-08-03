% Frame names:
% M = IMU of the Robot
% I = IMU of ViSensor
% C = Camera frame of ViSensor
clc;
clear;
format longg;

% Utils
addpath('../../../arco_ros_utils_matlab/');

% From point 7 of "scripts.txt": check file "visensorimu_robotimu.yaml" and
% copy and paste T_i_b
T_I_M = [0.028123707896299196 -0.000550709541097304 0.9996042985967822 -0.031289707012229946;
         -0.021423663275795632 -0.9997704856380867 5.195025947934452e-05 0.04554975387270407;
          0.9993748464445206 -0.021416646936098065 -0.028129051317198065 -0.3201060080673019;
          0.0 0.0 0.0 1.0];

T_M_I = invert_transformation(T_I_M);
static_tf_M_I = transformation2static_transform_publisher(T_M_I, 'imu_link', 'vi_sensor_imu_frame_debug');
% Output
display(static_tf_M_I);