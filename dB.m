function delayA = dB(t1,t2,t3,t4)

C = t1+t2+t3+t4+4;
qa = 5045;

%������ת
lam = t2/C;
q = 1252;

dB1 = calDelayA(q,C,lam,qa);

%����ֱ��
lam = t1/C;
q = 1458;

dB2 = calDelayA(q,C,lam,qa);

%������ת
lam = t1/C;
q = 905;

dB3 = calDelayA(q,C,lam,qa);

%�ϱ���ת
lam = t4/C;
q = 301;

dB4 = calDelayA(q,C,lam,qa);

%�ϱ�ֱ��
lam = t3/C;
q = 955;

dB5 = calDelayA(q,C,lam,qa);

%�ϱ���ת
lam = t3/C;
q = 174;

dB6 = calDelayA(q,C,lam,qa);

delayA = dB1 + dB2 + dB3 + dB4 + dB5 + dB6;
