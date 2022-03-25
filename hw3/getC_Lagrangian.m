function [C] = getC_Lagrangian()
%Comutation of C in parametric way

syms d1 d2 d3
q=[d1; d2; d3];

syms d_d1 d_d2 d_d3
dq=[d_d1; d_d2; d_d3];

n=3;
B=getB_Lagrangian();

C=zeros(n,n);

for i=1:n
    for j=1:n
        cij=0;
        for k=1:n
            cij=cij+dq(k)*(diff(B(i,j),q(k))+diff(B(i,k),q(j))+diff(B(j,k),q(i)))/2;
        end
        C(i,j)=cij;
    end
end
end