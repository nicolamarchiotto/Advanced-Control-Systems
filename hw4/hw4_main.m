%% Homework 4 - RNE - Recursive Newton Euler
robot = importrobot('PPP.urdf');

showdetails(robot)

config = homeConfiguration(robot);
show(robot,config);
%%
rne=getRNESymbolic();
%%
% RNE(q,dq,ddq,g0)
RNE([0.1,0.1,0.1]',[0.1,0.1,0.1]',[0.1,0.1,0.1]',[0,-9.81,0]');