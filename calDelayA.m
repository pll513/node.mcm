function x = calDelayA(q,C,lam,qa)
mu=0.75;
L=(q/3600)/(mu-q/3600);
x = (mu-q/3600)*3600/q*(q*(1-lam)*(L/(mu*lam))-0.5*lam*C)*q/qa;

if x<0
    x=0;
end