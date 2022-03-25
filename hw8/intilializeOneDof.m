fprintf("\nInitializing oneDof\n");

oneDof.dof=1;
oneDof.q0=0;
oneDof.dq0=0;
oneDof.ddq0=0;

oneDof.I=1;
oneDof.F=1;
oneDof.m=1;
oneDof.g=9.81;
oneDof.d=1;
oneDof.G=oneDof.m*oneDof.g*oneDof.d;

fprintf("oneDof initialized\n");
