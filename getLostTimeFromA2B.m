%tA 1,2,3��λ������
%i ��i��λ
%phi A��B����λ��
%T2 B��������
%dt ����A��B��ʱ��
%t1 ��һ��λ����
%t2 �ڶ���λ����
%DA ����A·�ڵ�����ʱ��
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
        



    
