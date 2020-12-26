s="Adaline";
x=load('memekanseri.txt');
p1=x(:,2);
p2=x(:,3);
t=x(:,11);
plot(p1(t==2),p2(t==2),'ro')
hold on
plot(p1(t==4),p2(t==4),'gd')
title(s)
xlabel('p1')
ylabel('p2')

axis([0 6 0 6])
lamda=0.1;
w1=0.2;
w2=0.5;
b=0.3;
n=0;
N=length(t);
M=500;
for m=1:M
    n=1+mod(n,N);
    net=w1*p1(n)+w2*p2(n)+b;
    a=hardlim(net);
    if(a==t(n))
    else
        dw1=lamda*p1(n);
        dw2=lamda*p2(n);
        if(a>t(n))
        w1=w1-dw1;
        w2=w2-dw2;
        b=b-lamda*(a-t(n));
        else
            w1=w1+2*lamda*p1(n);
            w2=w2+2*lamda*p2(n);
            b=b+2*lamda*(a-t(n));
        end
    end
end
X1=[0 6];
X2=(b-w1*X1)/w2;
plot(X1,X2)
            