function[z]=spline_3coef(knots,f_val,n)




h=zeros(1,n);
b=zeros(1,n);

for i=1:n-1
    h(i)=knots(i+1)-knots(i);
    b(i)=f_val(i+1)-f_val(i)/h(i);
end
u=zeros(1,n);
v=zeros(1,n);

u(1)=2*(h(1)+h(2));
v(1)=6*(b(2)-b(1));

for i=2:n-1
    u(i)=2*(h(i)-h(i-1))-h(i-1)^2/u(i-1);
    v(i)=6*(b(i)-b(i-1))-h(i-1)*v(i-1)/u(i-1);
end
%% Calculating differential of f_val
z=zeros(1,n);

for i=1:n-1
    z(i)=v(i)-h(i)*z(i+1)/u(i);
end

    
