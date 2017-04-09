function [param]=gradient_descent(init_param,target,source,scale,iter)

%{
cost=AffineRegistration(target,source,init_param,scale);
step=1;
gradients=[];
gamma=0.001;
all_cost=[];


for i=1:iter

    
    %for tx
    init_param(1)=init_param(1)+step;
    gradients(1)=(AffineRegistration(target,source,init_param,scale)-cost)/step;
    
    %for ty
    init_param(2)=init_param(2)+step;
    gradients(2)=(AffineRegistration(target,source,init_param,scale)-cost)/step;
    
    %for R
    init_param(3)=init_param(3)+step;
    gradients(3)=(AffineRegistration(target,source,init_param,scale)-cost)/step;
    
    %for Sx
    init_param(4)=init_param(4)+step;
    gradients(4)=(AffineRegistration(target,source,init_param,scale)-cost)/step;
    
    %for Sy
    init_param(5)=init_param(5)+step;
    gradients(5)=(AffineRegistration(target,source,init_param,scale)-cost)/step;
    
    %for Hx
    init_param(6)=init_param(6)+step;
    gradients(6)=(AffineRegistration(target,source,init_param,scale)-cost)/step;
    
    %for Hy
    init_param(7)=init_param(7)+step;
    gradients(7)=(AffineRegistration(target,source,init_param,scale)-cost)/step;
    
    %normalizing gradients
    gradients=(gradients-min(gradients))./(max(gradients)-min(gradients));
    norm_cost=sqrt(mean(gradients));

    %Upadating
    
    init_param=(init_param-gamma*gradients);
    
    
    cost=AffineRegistration(target,source,init_param,scale);
    all_cost=[all_cost;cost];
    
    if isnan(cost)
         break;
    end
    
end
param=init_param;
plot(all_cost);
end

%}

[dx,dy]=gradient(source);
detaI=sqrt(dx.^2+dy.^2);
theta=deg2rad(init_param(3));

jecobian=[1 0 -sin(theta)-cos(theta);
          0 1  cos(theta)-sin(theta);
          0 0           1];
differ=abs(source-target);

end









