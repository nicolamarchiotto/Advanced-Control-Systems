function [tauRNE]=getRNESymbolic()
% var declatarion
% JOINT variables

% positions
d1 = sym('d1', 'real');
d2 = sym('d2', 'real');
d3 = sym('d3', 'real');

% velocities
d_d1 = sym('d_d1', 'real');
d_d2 = sym('d_d2', 'real');
d_d3 = sym('d_d3', 'real');

% accelerations
dd_d1 = sym('dd_d1', 'real');
dd_d2 = sym('dd_d2', 'real');
dd_d3 = sym('dd_d3', 'real');

% LINK variables
% NOTATION, ex: velocity of link 1 expressed in 0 = p1_0

% Linear accelerations of origin of frames
ddp1_1=[]; ddp2_2=[]; ddp3_3=[];
% Linear accelerations of centre of mass
ddpc1_1=[]; ddpc2_2=[]; ddpc3_3=[];

% Angular velocity of link
w0_0=[]; w1_1=[]; w2_2=[]; w3_3=[];
% Angular aceeleration of link
dw0_0=[]; dw1_1=[]; dw2_2=[]; dw3_3=[];

% Vector from origin frame i-1 to origin frame i expressed in ref frame i
r0_1=[0, -0.2, -d2]';
r1_2=[0, 0.2502, -d3]';
r2_3=[0, 0, -d3-0.2]';
% Vector from origin of frame i to center of mass of link i expressed in ref frame i
r1_c1=[0, -0.2, -d2]';
r2_c2=[0, -0.2, -d3]';
r3_c3=[0, 0, -0.2]';

transMat = getTransformationMatrices();
R01=transMat.T01(1:3,1:3);
R12=transMat.T12(1:3,1:3);
R2E=transMat.T2E(1:3,1:3);
R3E=R2E;

% Intial conditions
% g0=[0, -9.81, 0]';
g0 = sym('g',[3 1],'real');
ddp0_0=g0;
w0_0=[0, 0, 0]';
dw0_0=[0, 0, 0]';
z0=[0, 0, 1]';

%FORWARD RECURSION

%Link 1
R=eval(R01);
w1_1=R'*w0_0;
dw1_1=R'*dw0_0;
ddp1_1=R'*ddp0_0+cross(dw1_1,r0_1)+cross(w1_1,cross(w1_1,r0_1))+R'*(dd_d1.*z0)+cross(dd_d1.*w1_1,R'*z0);
ddpc1_1=ddp1_1+cross(dw1_1,r1_c1)+cross(w1_1,cross(w1_1,r1_c1));

%Link 2
R=eval(R12);
w2_2=R'*w1_1;
dw2_2=R'*dw1_1;
ddp2_2=R'*ddp1_1+cross(dw2_2,r1_2)+cross(w2_2,cross(w2_2,r1_2))+R'*(dd_d2.*z0)+cross(dd_d2.*w2_2,R'*z0);
ddpc2_2=ddp2_2+cross(dw2_2,r2_c2)+cross(w2_2,cross(w2_2,r2_c2));

%Link 3
R=eval(R2E);
w3_3=R'*w2_2;
dw3_3=R'*dw2_2;
ddp3_3=R'*ddp2_2+cross(dw3_3,r2_3)+cross(w3_3,cross(w3_3,r2_3))+R'*(dd_d3.*z0)+cross(dd_d3.*w3_3,R'*z0);
ddpc3_3=ddp3_3+cross(dw3_3,r3_c3)+cross(w3_3,cross(w3_3,r3_c3));


%BACKWARD RECURSION

[m,~]=getLinkMassesAndCOMs();
m1=m(1);
m2=m(2);
m3=m(3);
%Initial conditions
he=[0 0 0 0 0 0]';
f4_4=he(1:3);
mu4_4=he(4:6);
Fv3=0; Fs3=0;
Fv2=0; Fs2=0;
Fv1=0; Fs1=0;


%Link 3
R=eval(R3E);
f3_3=R*f4_4+m3*ddpc3_3;
mu3_3=cross(-f3_3,r2_3+r3_c3)+R*mu4_4+cross(R*f4_4,r3_c3);
tau3=f3_3'*R2E'*z0+Fv3*d_d3+Fs3*sign(d_d3);

%Link 2
R=eval(R2E);
f2_2=R*f3_3+m2*ddpc2_2;
mu2_2=cross(-f2_2,r1_2+r2_c2)+R*mu3_3+cross(R*f3_3,r2_c2);
tau2=f2_2'*R12'*z0+Fv2*d_d2+Fs2*sign(d_d2);


%Link 1
R=eval(R12);
f1_1=R*f2_2+m1*ddpc1_1;
mu1_1=cross(-f1_1,r0_1+r1_c1)+R*mu2_2+cross(R*f2_2,r1_c1);
tau1=f1_1'*R01'*z0+Fv1*d_d1+Fs1*sign(d_d1);

tauRNE=[tau1;tau2;tau3];
end