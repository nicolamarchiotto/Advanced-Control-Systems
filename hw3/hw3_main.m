%% Homework 3 - Compute the equation of motion - Lagrangian model
clc;
robot = importrobot('PPP.urdf');

showdetails(robot)

config = homeConfiguration(robot);
show(robot,config);
%%
lagrangian=getLagrangianSymbolic();

% subs(lagrangian,[dd_d1,dd_d2,dd_d3],[0,0,0]);




