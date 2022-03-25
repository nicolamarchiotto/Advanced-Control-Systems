function [Ba]=estimated_getBa()
    [~, Ja, ~, ~]=getJacobians();
    B=estimated_getB_Lagrangian();
    Ba=pinv(Ja*inv(B)*Ja');
end
