%% Homework 9 - Operational Space PD Control Law With Gravity Compensation
robot = importrobot('PPP.urdf');

showdetails(robot)

config = homeConfiguration(robot);
show(robot,config);
%%
% Initialization 
Kp=diag([28,22,20]);
Kd=diag([25,15,15]);    
G=myRobot.G_Lagrangian;
Ja=myRobot.Ja;
Ja=Ja(1:3,:);

% xd=[0.2; 0.2; 0.2502 ];

xd=[0.3; 0.3; 0.3];
