function [tauLag]=getLagrangianSymbolic()

syms d1 d2 d3
q=[d1; d2; d3];

syms d_d1 d_d2 d_d3
dq=[d_d1; d_d2; d_d3];

syms dd_d1 dd_d2 dd_d3
ddq=[dd_d1; dd_d2; dd_d3];

n=3;

B=getB_Lagrangian();

C=getC_Lagrangian();
g=getG_Lagrangian();

tauLag = sym('tauLag',[3 1]);


for i=1:n
    b_term=0;   
    c_term=0;   
    for j=1:n
        b_term = b_term + B(i,j)*ddq(j);
        c_term = c_term + C(i,j)*dq(j);
    end
    g_term=g(i);
    tauLag(i)=b_term+c_term+g_term;
end
end