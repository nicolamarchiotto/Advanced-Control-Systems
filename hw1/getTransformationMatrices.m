function [s]=getTransformationMatrices()

DHtable=getDHTable();

syms theta alph a d
iTi=[cos(theta) -sin(theta)*cos(alph)  sin(theta)*sin(alph)   a*cos(theta);
    sin(theta)  cos(theta)*cos(alph)   -cos(theta)*sin(alph)  a*sin(theta);
    0           sin(alph)              cos(alph)              d;
    0           0                       0                       1];

TB0=subs(iTi,[theta alph a d],[DHtable(1,1) DHtable(1,2)    DHtable(1,3)    DHtable(1,4)]);
T01=subs(iTi,[theta alph a d],[DHtable(2,1) DHtable(2,2)    DHtable(2,3)    DHtable(2,4)]);
T12=subs(iTi,[theta alph a d],[DHtable(3,1) DHtable(3,2)    DHtable(3,3)    DHtable(3,4)]);
T2E=subs(iTi,[theta alph a d],[DHtable(4,1) DHtable(4,2)    DHtable(4,3)    DHtable(4,4)]);
TB1=TB0*T01;
TB2=TB1*T12;
TBE=TB2*T2E;
s=struct("TB0",TB0,"TB1", TB1,"TB2", TB2,"TBE",TBE,"T01",T01,"T12",T12,"T2E",T2E);

clear theta alpha a d
end