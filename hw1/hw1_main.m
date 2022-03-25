%% Homework 1 - Compute Direct Kin, Inverse Kin, Differential Kin

robot = importrobot('PPP.urdf');


showdetails(robot)

figure;
config = homeConfiguration(robot);
show(robot,config);
%%
clc
syms d1 d2 d3 symsVars
symsVars=[d1 d2 d3];

DH=getDHTable();

%DIRECT KINEMATICS
struct=getTransformationMatrices();

TB0=struct.TB0;
TB1=struct.TB1;
TB2=struct.TB2;
TBE=struct.TBE;

%INVERSE KINEMATICS
syms x y z invKin
invKin=getInverseKinematics();
%Test for inverse kinematics
subs(invKin,[x y z],[0 0 0]);

%DIFFERENETIAL KINEMATICS

[J,Ja,Ta,~]=getJacobians();

%% COMPUTATIONS USING ROBOT TOOLBOX

%Direct kinematics
bte=getTransform(robot,config,"ee","base_link");

%Inverse kinematics

ik=inverseKinematics('RigidBodyTree',robot);
initialguess = robot.homeConfiguration;
weights = [0.25 0.25 0.25 1 1 1];
% randConfig = robot.randomConfiguration;
% randConfig.JointPosition
% tform = getTransform(robot,randConfig,'ee','base_link');
tform=subs(TBE,[d1 d2 d3],[0.0 0.0 0.0]);
tform=double(tform);
[configSol,solInfo] = ik("ee",tform,weights,initialguess);
configSol.JointPosition;

%Analitical jacobian
ja=jacobian([TBE(1,4),TBE(2,4),TBE(3,4)],[d1,d2,d3]);

%geometric jacobian,
ind2=geometricJacobian(robot,homeConfiguration(robot),"ee");

