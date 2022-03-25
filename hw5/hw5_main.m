%% Homework 5 - Compute the dynamic model in the operational space
robot = importrobot('PPP.urdf');

showdetails(robot)

config = homeConfiguration(robot);
show(robot,config);

%% Generic formulation
[~, ~ ,Ta, ~]=getJacobians();

% Operational space dynamic model
Ba=getBa();
Cadx=getCadx();
Ga=getGa();
% u=Ta'*h;
% ue=Ta'*he;

% u=Ba*ddx-Cadx+ga+ue

%% For non-redundant manipulator
[~, ~ ,Ta, ~]=getJacobians();
Ba_NR=getBa_NR();
Cadx_NR=getCadx_NR();
Ga=getGa_NR();
% u=Ta'*h;
% ue=Ta'*he;

% u=Ba*ddx-Cadx+ga+ue

%%
opSpaceModelSym=vpa(getOpSpaceModelSym(),5);

