function [Ga]=estimated_getGa()
    [~, Ja, ~, ~]=getJacobians();
    Ba=estimated_getBa();
    B=estimated_getB_Lagrangian();
    g=estimated_getG_Lagrangian();
    Ga=Ba*Ja*inv(B)*g;
end
