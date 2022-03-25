function [J, Ja, Ta, dJa]=getJacobians()
%ANALITICAL JACOBIAN
syms d1 d2 d3 symsVars
symsVars=[d1 d2 d3];

struct=getTransformationMatrices();
TB0=struct.TB0;
TB1=struct.TB1;
TB2=struct.TB2;
TBE=struct.TBE;

Ja=zeros(6,3);

for ind1=1:6
    for ind2=1:3
        if(ind1<=3)
            Ja(ind1,ind2)=diff(TBE(ind1,4),symsVars(ind2));
        else
            %since I have no revolute joints in my robot, the last 3 rows will be
            %all 0
            Ja(ind1,ind2)=0;
        end
    end
end

%GEOMETRIC JACOBIAN
J=[TB0(1:3,3),TB1(1:3,3),TB2(1:3,3)];
for ind1=1:3
    J(4:6,ind1)=[0 0 0]';
end
J=eval(J);

%Computation of T matrix which relates J and Ja, assumed euler angles ZYZ
%w.r.t the base frame
alfa=0;
beta=pi;
gamma=pi;

Ta=getTa(alfa,beta,gamma);
dJa=zeros(6,3);


end