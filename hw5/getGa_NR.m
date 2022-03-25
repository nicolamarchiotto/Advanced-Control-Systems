function [Ga_NR]=getGa_NR()
    [~, Ja, ~, ~]=getJacobians();
    g=getG_Lagrangian();
    Ga_NR=pinv(Ja')*g;
end
