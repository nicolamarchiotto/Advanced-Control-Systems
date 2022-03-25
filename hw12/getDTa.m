function dTa=getDTa(phi,theta,psi,dphi,dtheta,dpsi)
dTa=[0,0,0,0  ,0             ,    0;
     0,0,0,0  ,0             ,    0;
     0,0,0,0  ,0             ,    0;
     0,0,0,0  ,-cos(phi)*dphi,    -sin(phi)*sin(theta)*dphi + cos(phi)*cos(theta)*dtheta;
     0,0,0,0  ,-sin(phi)*dphi,    cos(phi)*sin(theta)*dphi  + sin(phi)*cos(theta)*dtheta;
     0,0,0,0  ,             0,    -sin(theta)*dtheta                                      ];