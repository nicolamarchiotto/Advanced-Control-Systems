%% Homework 15 - Parallel Force/Position control

robot = importrobot('PPP.urdf');

showdetails(robot)

config = homeConfiguration(robot);
show(robot,config);
%% Initialization 
J=myRobot.J;
J=J(1:3,:);
J_inv=pinv(J);

dJ=myRobot.dJ;
dJ=dJ(1:3  ,:);

Ja=myRobot.Ja;
Ja=Ja(1:3,:);

B=myRobot.B_Lagrangian;
C=myRobot.C_Lagrangian;
G=myRobot.G_Lagrangian;
F=myRobot.F;

Kd=diag([1 20 1]) ;
Kp=diag([1 0.5 1]);

Kf=diag([1 10 1]).*10;
Ki=diag([1 10 1]);

K=diag([1 1 1]);

Md=diag([1 1 1]);
Md_inv=pinv(Md);

xr=[0;0.3;0];
fd=[0;1;0];
xd=[0.3;0;0.1];
% xd=[0.2; 0.35; 0.2502;]; % xd=[0.2; 0.2; 0.2502;];   %=starting pose in op space
