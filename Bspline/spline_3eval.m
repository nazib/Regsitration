function[s]=spline_3eval(n,knots,f_val,z,x)

s=0;


for i=n-1:-1:1 
    if(x-knots(i)>=0)
        break;return;
    end
end
    h=knots(i+1)-knots(i);
    temp=z(i)/2+(x-knots(i))*(z(i+1)-z(i))/(6*h);
    temp=-(h/6)*(z(i+1)+2*z(i))+(f_val(i+1)-f_val(i))/h+((x-knots(i))*temp);
    s=f_val(i)+(x-knots(i))*temp; 
end
        