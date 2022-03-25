function invKin=getInverseKinematics()
%inverse kinematics given by equating the last column of the direct
%kinematics matrix to the 3 coordinates in the cartesian space, since we
%don't have any rotation this is prettt straightforward
TBE=getTransformationMatrices().TBE;
syms d1 d2 d3 x y z InvKin

invKin(1,1)=solve(TBE(1,4) - (x), d1);
invKin(2,1)=solve(TBE(2,4) - (y), d3);
invKin(3,1)=solve(TBE(3,4) - (z), d2);
eul=rotm2eul(double(TBE(1:3,1:3)),'zyz');
invKin(4,1)=eul(1);
invKin(5,1)=eul(2);
invKin(6,1)=eul(3);

end