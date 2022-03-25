function [Ga]=getGa()
    [~, Ja, ~, ~]=getJacobians();
    Ba=getBa();
    B=getB_Lagrangian();
    g=getG_Lagrangian();
    Ga=Ba*Ja*inv(B)*g;
end
