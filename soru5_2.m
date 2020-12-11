% Veri setinin %10 nu test için kullanýn.
 x=[5 5 3 6 4 8 1 2 2; 4 1 2 5 1 8 7 4 4; 10 6 7 10 3 8 1 5 3; 5 2 1 3 2 10 2 3 2; 10 6 5 2 6 10 6 5 10; 1 3 1 4 7 9 5 10 5; 10 10 8 8 5 9 5 1 9; 6 1 10 4 5 8 1 5 6]; 
t=[0 1 0 0 0 1 1 1 ];
 w=[0.1 0.1];
b=0.1;
alpha=0.2;
err=2;
dw1=0;
dw2=0;
db=0;
epoch=0;

while(err>1.05)
    err=0;
    for i=1:4
        yin(i)=b+x(1,i)*w(1)+x(2,i)*w(2);
        dw1=alpha*(t(i)-yin(i)*x(1,i));
        dw2=alpha*(t(i)-yin(i)*x(2,i));
        db=alpha*(t(i)-yin(i));
        for j=1:2
            w(j)=w(j)+(t(i)-yin(i))*x(j,i)*alpha;
        end
        b=b+(t(i)-yin(i))*alpha;
        print=[x(1,i),x(2,i) yin(i) t(i) dw1 dw2 db w(1) w(2) b];
    end
    err;
    pause
end
epoch=epoch+1;
plot(x(1,1) , x(2,1),'or','MarkerSize',20,'MarkerFaceColor',[0 0 1]);  hold on;
plot(x(1,2) , x(2,2),'or','MarkerSize',20,'MarkerFaceColor',[0 0 1]);  hold on;
plot(x(1,3) , x(2,3),'or','MarkerSize',20,'MarkerFaceColor',[0 0 1]);  hold on;
plot(x(1,4) , x(2,4),'or','MarkerSize',20,'MarkerFaceColor',[1 0 0]);  hold on;

m=-(w(1)/w(2));
c=-b/w(2);
x1=linspace(-2,2,100);
x2=m*x1+c;
plot(x2,x1,'r');
axis([-2 2 -2 2]);
for i=1:4
yin(i)=b+x(1,i)*w(1)+x(2,i)*w(2);
err=err+(t(i) -yin(i))^2;
end