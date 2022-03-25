function [g]=estimated_getG_Lagrangian()
%Computation of g term in parametric way

syms d1 d2 d3
q=[d1; d2; d3];
g = sym('g',[3 1]);

n=3;
[m,p]=estimated_getLinkMassesAndCOMs();
g0=[0 0 -9.81]';
% g0= sym('g',[3 1], 'real');


for i=1:n
    g_term=0;
    for j=1:n
        g_term=g_term+m(j)*g0'*diff(p(:,j),q(i));
    end
    g(i)=g_term;
end
g=eval(-g);
end