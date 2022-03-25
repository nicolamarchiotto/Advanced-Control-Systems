%% Homework 11 - Admittance Control
robot = importrobot('PPP.urdf');
showdetails(robot)

config = homeConfiguration(robot);
show(robot,config);
%%
Mt=diag([1 1 1 1 1 1]);
KDt=diag([1 3 1 1 1 1]).*10;
KPt=diag([1 0.1 1 1 1 1]).*100;

Kp=diag([28,22,20,0,0,0]);
Kd=diag([240,15,150,0,0,0]);
B=myRobot.B_Lagrangian;
C=myRobot.C_Lagrangian;
G=myRobot.G_Lagrangian;
F=myRobot.F;
Ja=myRobot.Ja;
Ja_inv=pinv(Ja);
dJa=myRobot.dJa;
J=myRobot.J;

%Environmental rest position w.r.t. base frame
x_r=[0.3;0.26; 0.3; -pi/2; -pi/2; -pi/2];
K=diag([1,10,1,0,0,0]); 

xk1=[0.2,0.22,0.3,0.3,0.3]; 
xk2=[0.2,0.22,0.3,0.3,0.3];
xk3=[0.2502,0.22,0.3,0.3,0.3];
xk4=[-pi/2,-pi/2,-pi/2,-pi/2,-pi/2];
xk5=[-pi/2,-pi/2,-pi/2,-pi/2,-pi/2];
xk6=[-pi/2,-pi/2,-pi/2,-pi/2,-pi/2];

tk=[0,1,2,3,4];
Ts=0.001;
dx_i=0;
dx_f=0;

DimValues=6;
TimeValues=tk(1):Ts:tk(end);

DataPositions=[];
DataVelocities=[];
DataAccelerations=[];

[x1,dx1,ddx1,~,~]=multipoint_traj_computed_vel(xk1,tk,Ts,dx_i,dx_f,false);
[x2,dx2,ddx2,~,~]=multipoint_traj_computed_vel(xk2,tk,Ts,dx_i,dx_f,false);
[x3,dx3,ddx3,~,~]=multipoint_traj_computed_vel(xk3,tk,Ts,dx_i,dx_f,false);
[x4,dx4,ddx4,~,~]=multipoint_traj_computed_vel(xk4,tk,Ts,dx_i,dx_f,false);
[x5,dx5,ddx5,~,~]=multipoint_traj_computed_vel(xk5,tk,Ts,dx_i,dx_f,false);
[x6,dx6,ddx6,~,~]=multipoint_traj_computed_vel(xk6,tk,Ts,dx_i,dx_f,false);

DataPositions(1,:)=x1;
DataPositions(2,:)=x2;
DataPositions(3,:)=x3;
DataPositions(4,:)=x4;
DataPositions(5,:)=x5;
DataPositions(6,:)=x6;

DataVelocities(1,:)=dx1;
DataVelocities(2,:)=dx2;
DataVelocities(3,:)=dx3;
DataVelocities(4,:)=dx4;
DataVelocities(5,:)=dx5;
DataVelocities(6,:)=dx6;

DataAccelerations(1,:)=ddx1;
DataAccelerations(2,:)=ddx2;
DataAccelerations(3,:)=ddx3;
DataAccelerations(4,:)=ddx4;
DataAccelerations(5,:)=ddx5;
DataAccelerations(6,:)=ddx6;

x_d.time=TimeValues;
x_d.signals.values=DataPositions';
x_d.signals.dimensions=DimValues;

dx_d.time=TimeValues;
dx_d.signals.values=DataVelocities';
dx_d.signals.dimensions=DimValues;

ddx_d.time=TimeValues;
ddx_d.signals.values=DataAccelerations';
ddx_d.signals.dimensions=DimValues;

