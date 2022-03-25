function Ta=getTa(alfa,beta,gamma)
%returns Ta matrix using ZYZ notation
% alfa,beta,gamma = fi,theta,psi

Tfi=[0  -sin(alfa)    cos(alfa)*sin(beta);
     0  cos(alfa)     sin(alfa)*cos(beta);
     1  0             cos(beta)];    

 Ta=[eye(3), zeros(3); zeros(3), Tfi];
end