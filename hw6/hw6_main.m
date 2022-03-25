%% Homework 6 - Joint Space PD Control with Gravity Compensation
robot = importrobot('PPP.urdf');

showdetails(robot)

config = homeConfiguration(robot);
show(robot,config);
%%
% Initialization 
Kp=diag([20,20,20]);
Kd=diag([15,15,15]);
G=myRobot.G_Lagrangian;
G_C=myRobot.G_Lagrangian.*1.1;
qd=[0.1; 0.1; 0.15 ];

%% Plot q2 with and without gravity term 
plot(out.q.Time,out.q.Data(:,2))
xlim([0,6]);    
hold on

%% Plot tau2 with and without gravity term 
plot(out.tau_no_g.Time,out.tau_no_g.Data(2,:))
xlim([0,6]);        
hold on

% plot(out.tau_no_g.Time,ones(size(out.tau_no_g.Time,1)).*G(2));
