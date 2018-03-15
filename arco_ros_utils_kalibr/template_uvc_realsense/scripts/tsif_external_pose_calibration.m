% Data collected on Bear on 2018-03-13
clc;
clear;
format longg;

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

display(B_r_B_V);
display(rpy_BPosemeas);