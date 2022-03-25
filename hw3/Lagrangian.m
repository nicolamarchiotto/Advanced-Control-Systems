function [tauLagrangian]=Lagrangian(q,dq,ddq)
tauLagrangian(1)=(5626617230451602837*ddq(1))/720575940379279360000;
tauLagrangian(2)=(7076776310464902549*ddq(2))/1441151880758558720000 + 5690424229972191/288230376151711744;
tauLagrangian(3)=(161*ddq(3))/80000;
tauLagrangian=tauLagrangian';
end
                                       
