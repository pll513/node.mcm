N = 100;
c1 = 0.1;
c2 = 0.1;
Fitness1 = zeros(1,N);
Fitness2 = zeros(1,N);
pBest = zeros(2,N);
dpBest = zeros(1,N);
f1 = @(x,y)(x*x+y*y)^.125;
f2 = @(x,y)((x-.5)^2+(y-.5)^2)^.25;
X = [-5 + 15 * rand(1,N);-5 + 15 * rand(1,N)];
V = [30 * (rand(1,N) - 0.5);30 * (rand(1,N) - 0.5)];
pBest1 = X;
pBest2 = X;


for j = 1:100
    for i = 1:N
        Fitness1(i) = f1(X(1,i),X(2,i));
        Fitness2(i) = f2(X(1,i),X(2,i));
        if Fitness1(i)<f1(pBest1(1,i),pBest1(2,i))
            pBest1(:,i) = X(:,i);
        end
        if Fitness2(i)<f2(pBest2(1,i),pBest2(2,i))
            pBest2(:,i) = X(:,i);
        end
    end
    
    gBest1Index = find(Fitness1==min(Fitness1));
    gBest1 = X(:,gBest1Index(:,1));
    gBest2Index = find(Fitness2==min(Fitness2));
    gBest2 = X(:,gBest2Index(:,1));
    
    gBest = (gBest1+gBest2)/2;
    dgBest = sqrt((gBest1(1)-gBest2(1))^2+(gBest1(2)-gBest2(2))^2);
    
    for i = 1:N
        dpBest(i) = sqrt((pBest1(1,i)-pBest2(1,i))^2+(pBest1(2,i)-pBest2(2,i))^2);
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
           pBest(:,i) = mean([pBest1(:,i),pBest2(:,i)]);
       end
    end
    
    for i = 1:N
        r = rand(1,1);
        R = rand(1,1);
        V(:,i) = (0.4+0.005*j) * V(:,i) + c1 * r .* (pBest(:,i)-X(:,i)) + c1 * R .* (gBest-X(:,i));
        for k = 1:2
            if V(k,i)>15
                V(k,i) = 15;
            elseif V(k,i)<-15
                V(k,i) = -15;
            end    
        end
        X(:,i) = X(:,i) + V(:,i);
        for k = 1:2
            if X(k,i)>10
                X(k,i) = 10;
            elseif X(k,i)<-5
                X(k,i) = -5;
            end
        end
    end
end

%test
F1 = Fitness1;
F2 = Fitness2;
plot(F1,F2,'*');
axis([0,1,0,1]);
