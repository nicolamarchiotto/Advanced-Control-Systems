%% Homework 10 - Operational Space Inverse Dynamics Control
robot = importrobot('PPP.urdf');

showdetails(robot)

config = homeConfiguration(robot);
show(robot,config);
%% Initialization 
Ja=myRobot.Ja;
Ja=Ja(1:3,:);
dJa=myRobot.dJa;
dJa=dJa(1:3,:);
Ja_inv=inv(Ja);

B=myRobot.B_Lagrangian;
C=myRobot.C_Lagrangian;
G=myRobot.G_Lagrangian;
F=myRobot.F;


Kd=diag([1 1 1]).*5 ;
Kp=diag([1 1 1]).*100;

% trajectory computation

xk1=[0.2,0.25,0.3];
xk2=[0.2,0.1,0.2];
xk3=[0.2502,0.2,0.1];
tk=[0,1,2];
Ts=0.001;
dxi=0;
dxf=0;

DimValues=3;
TimeValues=tk(1):Ts:tk(end);

DataPositions=[];
DataVelocities=[];
DataAccelerations=[];

[x1,dx1,ddx1,dddx,dxk]=multipoint_traj_computed_vel(xk1,tk,Ts,dxi,dxf,false);
[x2,dx2,ddx2,dddx,dxk]=multipoint_traj_computed_vel(xk2,tk,Ts,dxi,dxf,false);
[x3,dx3,ddx3,dddx,dxk]=multipoint_traj_computed_vel(xk3,tk,Ts,dxi,dxf,false);

DataPositions(1,:)=x1;
DataPositions(2,:)=x2;
DataPositions(3,:)=x3;

DataVelocities(1,:)=dx1;
DataVelocities(2,:)=dx2;
DataVelocities(3,:)=dx3;

DataAccelerations(1,:)=ddx1;
DataAccelerations(2,:)=ddx2;
DataAccelerations(3,:)=ddx3;

x_d.time=TimeValues;
x_d.signals.values=DataPositions';
x_d.signals.dimensions=DimValues;

dx_d.time=TimeValues;
dx_d.signals.values=DataVelocities';
dx_d.signals.dimensions=DimValues;


ddx_d.time=TimeValues;
ddx_d.signals.values=DataAccelerations';
ddx_d.signals.dimensions=DimValues;
