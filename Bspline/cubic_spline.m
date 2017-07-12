clc;
clear all;
n=9;
up=0;
down=1.6875;
h=(down-up)/n;

knots=zeros(1,n);
f_val=zeros(1,n);

for i=1:n
    knots(i)=up+i*h;
    f_val(i)=sin(knots(i));
end
z=spline_3coef(knots,f_val,n);

e=zeros(1,4*n);
nx=zeros(1,4*n);

for i=1:4*n
    x(i)=up+i*h/4;
    nx(i)=spline_3eval(n,knots,f_val,z,x(i));
    e(i)=abs(sin(x(i))-nx(i));
end

plot([1:4*n],sin(x),'r-',[1:4*n],nx,'b-');
