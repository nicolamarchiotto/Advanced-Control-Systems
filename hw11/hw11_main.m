%% Homework 11 - Compliance Control
robot = importrobot('PPP.urdf');
showdetails(robot)

config = homeConfiguration(robot);
show(robot,config);
%%

Kp=diag([28,22,20,0,0,0]);
Kd=diag([24,15,15,0,0,0]);    
G=myRobot.G_Lagrangian;
Ja=myRobot.Ja;
J=myRobot.J;
TBE=myRobot.homTransf.TBE;
K=diag([1,10,1,0,0,0]); 
Ta=getTa(-pi/2,-pi/2,-pi/2);

%Environmental rest position w.r.t. base frame
x_r=[0.8;0.52; 0.3; -pi/2; -pi/2; -pi/2];

% Desired pose in operational space
x_d=[0.3 ; 0.5; 0.8; -pi/2; -pi/2; -pi/2];

% xd=[0.2; 0.2; 0.2502; -pi/2; -pi/2; -pi/2];   %=starting pose in op space

% Desired frame x w.r.t. base frame
R_d=eul2rotm(x_d(4:6)', 'ZYZ');
T_d=[R_d, x_d(1:3); [0 0 0 1]];

%Environmental rest rotational matrix w.r.t. base frame
R_r=eul2rotm(x_r(4:6)', 'ZYZ');
T_r=[R_r, x_r(1:3); [0 0 0 1]];

%Environmental rest position w.r.t. desired frame
T_r_d=pinv(T_d)*T_r;
eul_r_d = rotm2eul(T_r_d(1:3,1:3),'ZYZ');
x_r_d=[T_r_d(1:3,4);eul_r_d'];

% eul = rotm2eul(R_e,'ZYZ')