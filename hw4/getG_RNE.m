%works
function [G] = getG_RNE()
    %RNE closed form not affected by position, only acceleration
    q=zeros(3,1);
    G=RNE(q,zeros(3,1),zeros(3,1));
end