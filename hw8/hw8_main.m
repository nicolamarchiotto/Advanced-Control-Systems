%% Homework 8 - Adaptive Control

A=1;
Fc=1;
dq_d=0;
ddq_d=0;

Lamba=50;

K_theta=diag([50 10 1]);
K_theta_inv=inv(K_theta);
K_D=100;

I_hat0=oneDof.I*0.8;
F_hat0=oneDof.F*0.8;
G_hat0=oneDof.G*0.8;