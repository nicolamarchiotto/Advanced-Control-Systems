function [Cadx]=getCadx()
%Since C and Ja are zero matrices, Cadx will be always a zero 6x1 column vector
%Equations leaved to better visualize it
    dq=[0.1;0.1;0.1];
    [~, Ja, ~, dJa]=getJacobians();
    Ba=getBa();
    B=getB_Lagrangian();
    C=getC_Lagrangian();
    Cadx=Ba*Ja*inv(B)*C*dq-Ba*dJa*dq;
end
