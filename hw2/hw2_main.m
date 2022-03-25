%% Homework 2 - Compute Potential and Kinetic energy

clc;
robot = importrobot('PPP.urdf');

showdetails(robot)

config = homeConfiguration(robot);
show(robot,config);
%%

syms d1 d2 d3 ro

% Link Masses and Position of COM w.r.t. base frame

[m,p]=getLinkMassesAndCOMs();

B=getB_Lagrangian();

%Kinetic Energy

syms d_d1 d_d2 d_d3
dq=[d_d1; d_d2; d_d3];

kinetic=dq.'*B*dq/2;

%Potential energy

potential=0;
g0=[0 0 -9.81];

for j = 1:3
potential=potential-m(j)*g0*p(:,j);
end
%%
kineticEnergy=vpa(kinetic,5);
potentialEnergy=vpa(potential,5);

% subs(kineticEnergy,[d_d1,d_d2,d_d3],[0,0,0])
% subs(potentialEnergy,[d1,d2,d3],[0,0,0])

%% Test to compute torques
syms dd_d1 dd_d2 dd_d3
tau1=(2*5626617230451602837*dd_d1)/1441151880758558720000;
tau2=(2*7076776310464902549*dd_d2)/2882303761517117440000-6942317560566071/144115188075855872;
tau3=(2*161*dd_d3)/160000;
tauTest=[tau1 tau2 tau3]';
