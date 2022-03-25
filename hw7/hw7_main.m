%% Homework 7 - Joint Space Inverse Dynamics Control
robot = importrobot('PPP.urdf');

showdetails(robot)

config = homeConfiguration(robot);
show(robot,config);
%%
% Nominal Values

B=myRobot.B_Lagrangian;
C=myRobot.C_Lagrangian;
G=myRobot.G_Lagrangian;
F=myRobot.F;

% Estimated Values
 
% B=est_myRobot.B_Lagrangian;
% C=est_myRobot.C_Lagrangian;
% G=est_myRobot.G_Lagrangian;
% F=est_myRobot.F;

qk1=[0,0.1,0.2,0.2,0.2,0.2];
qk2=[0,0.1,0.2,0.2,0.2,0.2];
qk3=[0,-0.1,-0.2,-0.2,-0.2,-0.2];
tk=[0,1,2,3,4,5];
Ts=0.001;
dqi=0;
dqf=0;

DimValues=3;
TimeValues=tk(1):Ts:tk(end);

DataPositions=[];
DataVelocities=[];
DataAccelerations=[];

[q1,dq1,ddq1,dddq,dqk]=multipoint_traj_computed_vel(qk1,tk,Ts,dqi,dqf,false);
[q2,dq2,ddq2,dddq,dqk]=multipoint_traj_computed_vel(qk2,tk,Ts,dqi,dqf,false);
[q3,dq3,ddq3,dddq,dqk]=multipoint_traj_computed_vel(qk3,tk,Ts,dqi,dqf,false);
DataPositions(1,:)=q1;
DataPositions(2,:)=q2;
DataPositions(3,:)=q3;

DataVelocities(1,:)=dq1;
DataVelocities(2,:)=dq2;
DataVelocities(3,:)=dq3;

DataAccelerations(1,:)=ddq1;
DataAccelerations(2,:)=ddq2;
DataAccelerations(3,:)=ddq3;

q_d.time=TimeValues;
q_d.signals.values=DataPositions';
q_d.signals.dimensions=DimValues;

dq_d.time=TimeValues;
dq_d.signals.values=DataVelocities';
dq_d.signals.dimensions=DimValues;


ddq_d.time=TimeValues;
ddq_d.signals.values=DataAccelerations';
ddq_d.signals.dimensions=DimValues;
% 
% Kd=diag([1 1 1]).*40;
% Kp=diag([1 1 1]).*200;

Kd=diag([1 1 1]).*0;
Kp=diag([1 1 1]).*0;
% To achieve torque saturation
% Kp=diag([1 1 1]).*1000.*2;