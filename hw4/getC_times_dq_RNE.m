%works
function [C_times_dq] = getC_times_dq_RNE(q,dq)
    C_times_dq=RNE(q,dq,zeros(3,1));
end