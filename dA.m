function delayA = dA(t1,t2,t3,t4)

C = t1+t2+t3+t4+4;
qa = 4694;

%������ת
lam = t2/C;
q = 661;

dA1 = calDelayA(q,C,lam,qa);

%����ֱ��
lam = t1/C;
q = 1560;

dA2 = calDelayA(q,C,lam,qa);

%������ת
lam = t1/C;
q = 170;

dA3 = calDelayA(q,C,lam,qa);

%�ϱ���ת
lam = t4/C;
q = 625;

dA4 = calDelayA(q,C,lam,qa);

%�ϱ�ֱ��
lam = t3/C;
q = 802;

dA5 = calDelayA(q,C,lam,qa);

%�ϱ���ת
lam = t3/C;
q = 876;

dA6 = calDelayA(q,C,lam,qa);

delayA = dA1 + dA2 + dA3 + dA4 + dA5 + dA6;
