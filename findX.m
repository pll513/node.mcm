clear all;clc
dApA;
X1 = X;
dBpB;
X2 = X;
clear X;
X = zeros(8,10000);
C1 = 1;
C2 = 5;

for i = 1:100
   for j = 1:100
      X(1:4,(i-1)*100+j) = X1(:,i);
      X(5:8,(i-1)*100+j) = X2(:,j);
   end
end


dab = getLostTimeFromA2B(2,8,sum(X(1:4,1))+4,60,X(5,1),X(6,1),calDelayA(304,sum(X(5:8,1))+4,X(5,1)/(sum(X(5:8,1))+4),520))+...
    getLostTimeFromA2B(3,8,sum(X(1:4,1))+4,60,X(5,1),X(6,1),calDelayA(84,sum(X(5:8,1))+4,X(5,1)/(sum(X(5:8,1))+4),520))+...
    getLostTimeFromA2B(1,8,sum(X(1:4,1))+4,60,X(5,1),X(6,1),calDelayA(132,sum(X(5:8,1))+4,X(5,1)/(sum(X(5:8,1))+4),520));
dba = getLostTimeFromA2B(2,8,sum(X(5:8,1))+4,60,X(1,1),X(2,1),calDelayA(1394,sum(X(1:4,1))+4,X(1,1)/(sum(X(1:4,1))+4),2495))+...
    getLostTimeFromA2B(3,8,sum(X(5:8,1))+4,60,X(1,1),X(2,1),calDelayA(576,sum(X(1:4,1))+4,X(1,1)/(sum(X(1:4,1))+4),2495))+...
    getLostTimeFromA2B(1,8,sum(X(5:8,1))+4,60,X(1,1),X(2,1),calDelayA(525,sum(X(1:4,1))+4,X(1,1)/(sum(X(1:4,1))+4),2495));
min = C1 * dab + C2 * dba;
X0 = X(:,1);
for i = 1:10000
    dab = getLostTimeFromA2B(2,8,sum(X(1:4,i))+4,60,X(5,i),X(6,i),calDelayA(304,sum(X(5:8,i))+4,X(5,i)/(sum(X(5:8,i))+4),520))+...
    getLostTimeFromA2B(3,8,sum(X(1:4,i))+4,60,X(5,i),X(6,i),calDelayA(84,sum(X(5:8,i))+4,X(5,i)/(sum(X(5:8,i))+4),520))+...
    getLostTimeFromA2B(1,8,sum(X(1:4,i))+4,60,X(5,i),X(6,i),calDelayA(132,sum(X(5:8,i))+4,X(5,i)/(sum(X(5:8,1))+4),520));
    dba = getLostTimeFromA2B(2,8,sum(X(5:8,i))+4,60,X(1,i),X(2,i),calDelayA(1394,sum(X(1:4,i))+4,X(1,i)/(sum(X(1:4,i))+4),2495))+...
    getLostTimeFromA2B(3,8,sum(X(5:8,i))+4,60,X(1,i),X(2,i),calDelayA(576,sum(X(1:4,i))+4,X(1,i)/(sum(X(1:4,i))+4),2495))+...
    getLostTimeFromA2B(1,8,sum(X(5:8,i))+4,60,X(1,i),X(2,i),calDelayA(525,sum(X(1:4,i))+4,X(1,i)/(sum(X(1:4,i))+4),2495));
    dabba = C1 * dab + C2 * dba;
    if dabba < min
        min = dabba;
        X0 = X(:,i);
    end
end

X0

