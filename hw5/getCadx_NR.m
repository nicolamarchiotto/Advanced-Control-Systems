function [Cadx_NR]=getCadx_NR()
%Since C and Ja are zero matrices, Cadx_NR will be always a zero 6x1 column vector
%Equations leaved to better visualize it
    dq=[0.1;0.1;0.1];
    [~, Ja, ~, dJa]=getJacobians();
    Ba=getBa();
    C=getC_Lagrangian();
    Cadx_NR=pinv(Ja')*C*dq-Ba*dJa*dq;
end
