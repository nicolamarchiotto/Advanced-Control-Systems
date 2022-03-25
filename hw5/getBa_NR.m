function [Ba_NR]=getBa_NR()
    [~, Ja, ~, ~]=getJacobians();
    B=getB_Lagrangian();
    Ba_NR=pinv(Ja')*B*pinv(Ja);
end
