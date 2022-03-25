fprintf("\nInitializing myRobot\n");

myRobot.dof=3;
myRobot.q0=[0; 0; 0];
myRobot.dq0=[0; 0; 0];
myRobot.ddq0=[0; 0; 0];

% assignment 1 - Direct and Inverse Kinematics, Differential Kinematics
myRobot.DH=getDHTable();
myRobot.InverseKinematics=getInverseKinematics();
[J, Ja, Ta, dJa]=getJacobians();
myRobot.J=J;    
myRobot.Ja=Ja;
myRobot.Ta=Ta;
myRobot.dJ=dJa;
myRobot.dJa=dJa;
clear J Ja Ta dJa
myRobot.homTransf=getTransformationMatrices();

% assignment 2 - Kinetic and Potential energy
[m,p]=getLinkMassesAndCOMs();
myRobot.masses.m1=m(1);
myRobot.masses.m2=m(2);
myRobot.masses.m3=m(3);
myRobot.COM.l1=p(:,1);
myRobot.COM.l2=p(:,2);
myRobot.COM.l3=p(:,3);
clear m p

% assignment 3 - Lagrangian
myRobot.B_Lagrangian=getB_Lagrangian();
myRobot.C_Lagrangian=getC_Lagrangian();
myRobot.G_Lagrangian=getG_Lagrangian();
myRobot.LagrangianSym=getLagrangianSymbolic();

% assignment 4 - RNE
myRobot.G_RNE=getG_RNE();
myRobot.B_RNE=getB_RNE();
myRobot.RNESym=getRNESymbolic();

% assignment 5 - Operational Space Model
myRobot.Ba=getBa();
myRobot.Cadx=getCadx();
myRobot.Ga=getGa();
myRobot.opSpaceModelSym=getOpSpaceModelSym();

myRobot.F=zeros(3);
fprintf("myRobot initialized\n");
