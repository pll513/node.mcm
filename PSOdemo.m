N = 1000;
Fitness1 = zeros(1,N);
Fitness2 = zeros(1,N);
pBest = zeros(1,N);
dpBest = zeros(1,N);
f1 = @(x)(-x)*(x<=1)+(-2+x)*(x>1&&x<=3)+(4-x)*(x>3&&x<=4)+(-4+x)*(x>4);
f2 = @(x)(x-5)*(x-5);
X = -5 + 15 * rand(1,N);
V = 30 * (rand(1,N) - 0.5);
pBest1 = X;
pBest2 = X;


for j = 1:1000
    for i = 1:N
        Fitness1(i) = f1(X(i));
        Fitness2(i) = f2(X(i));
        if f1(X(i))<f1(pBest1(i))
            pBest1(i) = X(i);
        end
        if f2(X(i))<f2(pBest2(i))
            pBest2(i) = X(i);
        end
    end
    
    gBest1Index = find(Fitness1==min(Fitness1));
    gBest1 = X(gBest1Index);
    gBest2Index = find(Fitness2==min(Fitness2));
    gBest2 = X(gBest2Index);
    
    gBest = (gBest1+gBest2)/2;
    dgBest = abs(gBest1-gBest2);
    
    dpBest = abs(pBest1-pBest2); 

    for i = 1:N
       if dpBest(i)<dgBest
           r = rand(1);
           if r<0.5
               pBest(i) = pBest1(i);
           else
               pBest(i) = pBest2(i);
           end
       else
           pBest(i) = mean([pBest1(i),pBest2(i)]);
       end
    end
    
    for i = 1:N
        r = rand(1);
        R = rand(1);
        V(i) = (0.8-0.0004*j) * V(i) + 0.5 * r * (pBest(i)-X(i)) + 0.5 * R * (gBest-X(i));
        if V(i)>15
            V(i) = 15;
        elseif V(i)<-15
            V(i) = -15;
        end    
        X(i) = X(i) + V(i);
        if X(i)>10
            X(i) = 10
        elseif X(i)<-5
            X(i) = -5;
        end
    end
end

%test
F1 = Fitness1;
F2 = Fitness2;
plot(F1,F2,'*');

pBest1
pBest2
X