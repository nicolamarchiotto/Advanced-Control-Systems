function [opSpaceModel]=getOpSpaceModelSym()
% var declatarion

x = sym('x',[6 1]);
dx = sym('dx',[6 1]);
ddx = sym('ddx',[6 1]);

q = sym('q',[3 1]);
dq = sym('dq',[3 1]);
ddq = sym('ddq',[3 1]);

u = sym('u',[6 1]);
ue = sym('ue',[6 1]);

h = sym('h',[6 1]);
he = sym('he',[6 1]);

Ba=getBa();
Cadx=getCadx();
ga=getGa();
opSpaceModel=Ba*ddx-Cadx+ga+ue;
end