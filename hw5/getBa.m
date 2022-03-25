function [Ba]=getBa()
    [~, Ja, ~, ~]=getJacobians();
    B=getB_Lagrangian();
    Ba=pinv(Ja*inv(B)*Ja');
end
