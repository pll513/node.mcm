function delayA = dB(t1,t2,t3,t4)

C = t1+t2+t3+t4+4;
qa = 5045;

%������ת
lam = t2/C;
q = 1252;

dB1 = (0.5-q/3600)*3600/q*(q*(1-lam)*C/3600-0.5*lam*C)*q/qa;

%����ֱ��
lam = t1/C;
q = 1458;

dB2 = (0.5-q/3600)*3600/q*(q*(1-lam)*C/3600-0.5*lam*C)*q/qa;

%������ת
lam = t1/C;
q = 905;

dB3 = (0.5-q/3600)*3600/q*(q*(1-lam)*C/3600-0.5*lam*C)*q/qa;

%�ϱ���ת
lam = t4/C;
q = 301;

dB4 = (0.5-q/3600)*3600/q*(q*(1-lam)*C/3600-0.5*lam*C)*q/qa;

%�ϱ�ֱ��
lam = t3/C;
q = 955;

dB5 = (0.5-q/3600)*3600/q*(q*(1-lam)*C/3600-0.5*lam*C)*q/qa;

%�ϱ���ת
lam = t3/C;
q = 174;

dB6 = (0.5-q/3600)*3600/q*(q*(1-lam)*C/3600-0.5*lam*C)*q/qa;

delayA = dB1 + dB2 + dB3 + dB4 + dB5 + dB6;
