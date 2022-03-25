function [B] = getB_RNE()
    %RNE closed form not affected by position, only acceleration
    B1=RNE(zeros(3,1),zeros(3,1),[1 0 0]',zeros(3,1));
    B2=RNE(zeros(3,1),zeros(3,1),[0 1 0]',zeros(3,1));
    B3=RNE(zeros(3,1),zeros(3,1),[0 0 1]',zeros(3,1));
    B=[B1,B2,B3];
end