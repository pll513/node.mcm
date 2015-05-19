%dApA.m
N = 1000;
c1 = 0.5;
c2 = 0.5;
Fitness1 = zeros(1,N);
Fitness2 = zeros(1,N);
pBest = zeros(4,N);
dpBest = zeros(1,N);
%f1 = @(t1,t2,t3,t4)(t1+t2+t3+t4)^.5;
%f2 = @(t1,t2,t3,t4)-(t1^2+t2^2+t3^2+t4^2)^(.125);
X = [15 + 45 * rand(1,N);15 + 45 * rand(1,N);15 + 45 * rand(1,N);15 + 45 * rand(1,N)];
V = [1* (rand(1,N) - 0.5);1 * (rand(1,N) - 0.5);1 * (rand(1,N) - 0.5);1 * (rand(1,N) - 0.5)];
pBest1 = X;
pBest2 = X;

pA0 = pA(56,23,35,26);
dA0 = dA(56,23,35,26);

for j = 1:100
    for i = 1:N
        Fitness1(i) = dA(X(1,i),X(2,i),X(3,i),X(4,i))/dA0;
        Fitness2(i) = -pA(X(1,i),X(2,i),X(3,i),X(4,i))/pA0;
        if Fitness1(i)<dA(pBest1(1,i),pBest1(2,i),pBest1(3,i),pBest1(4,i))/dA0
            pBest1(:,i) = X(:,i);
        end
        if Fitness2(i)<pA(pBest2(1,i),pBest2(2,i),pBest2(3,i),pBest2(4,i))/pA0
            pBest2(:,i) = X(:,i);
        end
    end
    
    gBest1Index = find(Fitness1==min(Fitness1));
    gBest1 = X(:,gBest1Index(:,1));
    gBest2Index = find(Fitness2==min(Fitness2));
    gBest2 = X(:,gBest2Index(:,1));
    
    gBest = (gBest1+gBest2)/2;
    dgBest = sqrt((gBest1(1)-gBest2(1))^2+(gBest1(2)-gBest2(2))^2+(gBest1(3)-gBest2(3))^2+(gBest1(4)-gBest2(4))^2);
    
    for i = 1:N
        dpBest(i) = sqrt((pBest1(1,i)-pBest2(1,i))^2+(pBest1(2,i)-pBest2(2,i))^2+(pBest1(3,i)-pBest2(3,i))^2+(pBest1(4,i)-pBest2(4,i))^2);
    end

    for i = 1:N
       if dpBest(i)<dgBest
           r = rand(1);
           if r<0.5
               pBest(:,i) = pBest1(:,i);
           else
               pBest(:,i) = pBest2(:,i);
           end
       else
           pBest(:,i) = (pBest1(:,i)+pBest2(:,i))/2;
       end
    end
    
    for i = 1:N
        r = rand(1);
        R = rand(1);
        V(:,i) = (0.5) * V(:,i) + c1 * r * (pBest(:,i)-X(:,i)) + c1 * R * (gBest-X(:,i));
        for k = 1:4
            if V(k,i)>1
                V(k,i) = 1;
            elseif V(k,i)<-1
                V(k,i) = -1;
            end    
        end
        X(:,i) = X(:,i) + V(:,i);
        for k = 1:4
            if X(k,i)>60
                X(k,i) = 60;
            elseif X(k,i)<15
                X(k,i) = 15;
            end
        end
    end
end

%test
F1 = Fitness1;
F2 = Fitness2;
plot(F1,F2,'*');
   