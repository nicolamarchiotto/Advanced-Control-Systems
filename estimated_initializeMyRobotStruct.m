fprintf("\nInitializing est_myRobot\n");

est_myRobot.dof=3;
est_myRobot.q0=[0; 0; 0];
est_myRobot.dq0=[0; 0; 0];
est_myRobot.ddq0=[0; 0; 0];

% assignment 1 - Direct and Inverse Kinematics, Differential Kinematics
est_myRobot.DH=getDHTable();
est_myRobot.InverseKinematics=getInverseKinematics();
[J, Ja, Ta, dJa]=getJacobians();
est_myRobot.J=J;
est_myRobot.Ja=Ja;
est_myRobot.Ta=Ta;
est_myRobot.dJa=dJa;
clear J Ja Ta dJa
est_myRobot.homTransf=getTransformationMatrices();

% assignment 2 - Kinetic and Potential energy
[m,p]=estimated_getLinkMassesAndCOMs();
est_myRobot.masses.m1=m(1);
est_myRobot.masses.m2=m(2);
est_myRobot.masses.m3=m(3);
est_myRobot.COM.l1=p(:,1);
est_myRobot.COM.l2=p(:,2);
est_myRobot.COM.l3=p(:,3);
clear m p

% assignment 3 - Lagrangian
est_myRobot.B_Lagrangian=estimated_getB_Lagrangian();
est_myRobot.C_Lagrangian=estimated_getC_Lagrangian();
est_myRobot.G_Lagrangian=estimated_getG_Lagrangian();

% assignment 4 - RNE

% assignment 5 - Operational Space Model
est_myRobot.Ba=estimated_getBa();
est_myRobot.Cadx=estimated_getCadx();
est_myRobot.Ga=estimated_getGa();

est_myRobot.F=diag([1 1 1]).*0.01;

fprintf("est_myRobot initialized\n");
