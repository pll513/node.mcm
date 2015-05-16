%tA 1,2,3相位的数组
%i 第i相位
%phi A和B的相位差
%T2 B处的周期
%dt 车从A到B的时间
%t1 第一相位周期
%t2 第二相位周期
%DA 车在A路口的延误时间
function lostTime = getLostTimeFromA2B(i,phi,T2,dt,t1,t2,DA)

t = i - phi + T2 * (dt/T2 - floor(dt/T2));
if t>T2
    t = t - T2;
end

if i==1||i==3
   if t>t1
       lostTime = T2 - t + DA;
   else
       lostTime = DA;
   end
elseif i==2
    if t<t1
        lostTime = t1 - t + DA;
    elseif t<t1+t2
        lostTime = DA;
    else
        lostTime = t1 + T2 - t + DA;
    end
end
        



    
