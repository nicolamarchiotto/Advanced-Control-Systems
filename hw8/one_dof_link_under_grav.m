function [sys,x0,str,ts] = one_dof_link_under_grav(t,x,u,flag,oneDof)
%CSFUNC An example MATLAB file S-function for defining a continuous system.  
%   Example MATLAB file S-function implementing continuous equations: 
%      x' = Ax + Bu
%      y  = Cx + Du
%   
%   See sfuntmpl.m for a general S-function template.
%
%   See also SFUNTMPL.
  
%   Copyright 1990-2009 The MathWorks, Inc.

switch flag,

  %%%%%%%%%%%%%%%%%%
  % Initialization %    
  %%%%%%%%%%%%%%%%%%
  case 0,
    [sys,x0,str,ts]=mdlInitializeSizes(oneDof);

  %%%%%%%%%%%%%%%
  % Derivatives %
  %%%%%%%%%%%%%%%
  case 1,
    sys=mdlDerivatives(t,x,u,oneDof);

  %%%%%%%%%%%
  % Outputs %
  %%%%%%%%%%%
  case 3,
    sys=mdlOutputs(t,x,u);

  %%%%%%%%%%%%%%%%%%%
  % Unhandled flags %
  %%%%%%%%%%%%%%%%%%%
  case { 2, 4, 9 },
    sys = [];

  %%%%%%%%%%%%%%%%%%%%
  % Unexpected flags %
  %%%%%%%%%%%%%%%%%%%%
  otherwise
    DAStudio.error('Simulink:blocks:unhandledFlag', num2str(flag));

end
% end csfunc

%
%=============================================================================
% mdlInitializeSizes
% Return the sizes, initial conditions, and sample times for the S-function.
%=============================================================================
%
function [sys,x0,str,ts]=mdlInitializeSizes(oneDof)

sizes = simsizes;
sizes.NumContStates  = 2*oneDof.dof;
sizes.NumDiscStates  = 0;
sizes.NumOutputs     = 2*oneDof.dof;
sizes.NumInputs      = oneDof.dof;
sizes.DirFeedthrough = 0;
sizes.NumSampleTimes = 1;

sys = simsizes(sizes);
x0  = [oneDof.q0; oneDof.dq0];
str = [];
ts  = [0 0];

% end mdlInitializeSizes
%
%=============================================================================
% mdlDerivatives
% Return the derivatives for the continuous states.
%=============================================================================
%
function sys=mdlDerivatives(t,x,u,oneDof)

% x=[q;dq];
n=oneDof.dof;
q=x(1:n);
dq=x(n+1:end);

I=oneDof.I;
F=oneDof.F;
G=oneDof.G;
C=1;

sys(1:n)=dq;
%assumed no friction force
sys(n+1:2*n)=-inv(I)*(C*dq+F*dq+G*sin(q)-u);
% end mdlDerivatives
% 
%=============================================================================
% mdlOutputs
% Return the block outputs.
%=============================================================================
%
function sys=mdlOutputs(t,x,u)

sys=x;

% end mdlOutputs
