function delayA = dA(t1,t2,t3,t4)

C = t1+t2+t3+t4+4;
qa = 4694;

%东西左转
lam = t2/C;
q = 661;

dA1 = (0.5-q/3600)*3600/q*(q*(1-lam)*C/3600-0.5*lam*C)*q/qa;

%东西直行
lam = t1/C;
q = 1560;

dA2 = (0.5-q/3600)*3600/q*(q*(1-lam)*C/3600-0.5*lam*C)*q/qa;

%东西右转
lam = t1/C;
q = 170;

dA3 = (0.5-q/3600)*3600/q*(q*(1-lam)*C/3600-0.5*lam*C)*q/qa;

%南北左转
lam = t4/C;
q = 625;

dA4 = (0.5-q/3600)*3600/q*(q*(1-lam)*C/3600-0.5*lam*C)*q/qa;

%南北直行
lam = t3/C;
q = 802;

dA5 = (0.5-q/3600)*3600/q*(q*(1-lam)*C/3600-0.5*lam*C)*q/qa;

%南北右转
lam = t3/C;
q = 876;

dA6 = (0.5-q/3600)*3600/q*(q*(1-lam)*C/3600-0.5*lam*C)*q/qa;

delayA = dA1 + dA2 + dA3 + dA4 + dA5 + dA6;
