function [tauRNE]=RNE(q,dq,ddq,g0)

if ~exist('g0','var')
    g0=[0, -9.81, 0]';
end

% positions
d1 = q(1);
d2 = q(2);
d3 = q(3);

% velocities
d_d1 = dq(1);
d_d2 = dq(2);
d_d3 = dq(3);


symbolic=getRNESymbolic();

syms d1 d2 d3 d_d1 d_d2 d_d3 dd_d1 dd_d2 dd_d3 g1 g2 g3
tauRNE=eval(subs(symbolic,[d1 d2 d3 d_d1 d_d2 d_d3 dd_d1 dd_d2 dd_d3 g1 g2 g3],[q(1) q(2) q(3) dq(1) dq(2) dq(3) ddq(1) ddq(2) ddq(3) g0(1) g0(2) g0(3)]));

end