% Frame names:
% B = Base of the Robot
% M = IMU of the Robot
% V = External pose measurements frame (UVC IMU)
% D = Depth point cloud frame
clc;
clear;
format longg;

% Utils
addpath('../../../arco_ros_utils_matlab/');

% From robot's fixed configuration yaml file
q_B_M = eul2quat([3.14159265359,0,0], 'XYZ');
B_r_B_M = [0.062; 0.05755; 0.1837];
T_B_M = [quat2rotm(q_B_M), B_r_B_M;
         0 0 0,            1];

% From MSF output (q_IC == q_M_V)
q_M_V = [0.101348483218, -0.703714434559, 0.696788162245, -0.0948722114113];
M_r_M_V = [0.340734674431; 0.0429103813035; 0.0198145612164];
T_M_V = [quat2rotm(q_M_V), M_r_M_V;
         0 0 0,            1];
     
T_B_V = T_B_M * T_M_V;

B_r_B_V = T_B_V(1:3,4);
R_B_V = T_B_V(1:3,1:3);
q_B_V = rotm2quat(R_B_V);
rpy_BPosemeas = rotm2eul(R_B_V, 'XYZ');

% From point 8 of "scripts.txt": check file "realsense_ir_front_camchain.yaml"
T_V_D = [-0.97166907200184, 0.06838402495484261, 0.22623624741860693, -0.10022524959374761;
        -0.21395734295882893, 0.15214764694677368, -0.9649214211129074, 0.008888799259616161;
        -0.10040652323965667, -0.9859892081861394, -0.13320589863586724, 0.40897503941376606;
        0.0, 0.0, 0.0, 1.0];

static_tf_V_D = transformation2static_transform_publisher(T_V_D, 'uvc_imu', 'depth');

% Output
display(B_r_B_V);
display(rpy_BPosemeas);
display(static_tf_V_D);