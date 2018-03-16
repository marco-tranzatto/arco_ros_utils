% Frame names:
% B = Base of the Robot
% M = IMU of the Robot
% V = External pose measurements frame
% D = Depth point cloud frame
clc;
clear;
format longg;

% From robot's fixed configuration
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

% From point 7 of "scripts.txt": check file "camcam_front.yaml"
T_frontcamera_poincloud = [	0.9996842928300443, 0.023169708002427316, -0.009720046295010469, -0.06667405082383984;
							-0.023464676175669007, 0.9992308757028601, -0.03141760675269683, -0.004111397989366857;
  							0.008984633596640574, 0.03163576572770708, 0.999459081046321, -0.001988600853398916;
							0.0, 0.0, 0.0, 1.0];


display(B_r_B_V);
display(rpy_BPosemeas);