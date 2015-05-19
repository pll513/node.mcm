function delayA = dA(t1,t2,t3,t4)

C = t1+t2+t3+t4+4;
qa = 4694;

%东西左转
lam = t2/C;
q = 661;

dA1 = calDelayA(q,C,lam,qa);

%东西直行
lam = t1/C;
q = 1560;

dA2 = calDelayA(q,C,lam,qa);

%东西右转
lam = t1/C;
q = 170;

dA3 = calDelayA(q,C,lam,qa);

%南北左转
lam = t4/C;
q = 625;

dA4 = calDelayA(q,C,lam,qa);

%南北直行
lam = t3/C;
q = 802;

dA5 = calDelayA(q,C,lam,qa);

%南北右转
lam = t3/C;
q = 876;

dA6 = calDelayA(q,C,lam,qa);

delayA = dA1 + dA2 + dA3 + dA4 + dA5 + dA6;
