function [x]=directKinematics(q)
x=[ q(1) + 1/5;
    q(3) + 1/5;
    q(2) + 1251/5000];
end