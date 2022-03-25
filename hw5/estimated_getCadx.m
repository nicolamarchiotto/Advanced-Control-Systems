function [Cadx]=estimated_getCadx()
%Since C and Ja are zero matrices, Cadx will be always a zero 6x1 column vector
%Equations leaved to better visualize it
    dq=[0.1;0.1;0.1];
    [~, Ja, ~, dJa]=getJacobians();
    Ba=estimated_getBa();
    B=estimated_getB_Lagrangian();
    C=estimated_getC_Lagrangian();
    Cadx=Ba*Ja*inv(B)*C*dq-Ba*dJa*dq;
end
