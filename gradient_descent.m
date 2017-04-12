function [param,all_param]=gradient_descent(init_param,target,source,scale,iter)

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
    
    if isnan(cost) || cost<=0.3
         break;
    end
    i
end
param=init_param;
plot(all_cost);
end
%}
all_param=[];
gamma=1;
all_cost=[];

for i=1:iter
r=deg2rad(init_param(3));
%warping
M=TransformationMatrix(init_param);
source_w=ApplyAffine(source,M);
target_w=ApplyAffine(target,M);

%mean of images
mu_t=mean(mean(target_w));
mu_s=mean(mean(source_w));

source_n=source_w-repmat(mu_s,size(source));
source_n=source_n(:)';
target_n=target_w-repmat(mu_t,size(target));
target_n=target_n(:)';

%gradient images
[dxt,dyt]=gradient(target_w);
[dxs,dys]=gradient(source_w);

delta_source_w=[dxs(:) dys(:)];
delta_target_w=[dxt(:) dys(:)];

%jecobian
delta_w=[1 0 -sin(r)-cos(r);
         0 1  cos(r)-sin(r);];

%gradient of cross-correlation
delta_j=-(source_n*delta_target_w*delta_w...
    +target_n*delta_source_w*delta_w);

init_param(1:3)=init_param(1:3)-delta_j*gamma;


[c,I,~]=AffineRegistration(target,source,init_param,scale);
all_cost=[all_cost;c];
all_param=[all_param;[c init_param]];
disp(fprintf('Iteration= %d cost=%f Tx=%f Ty=%f R=%f',i,c,init_param(1),init_param(2),init_param(3)));
% figure(1);
% imshow(uint8(I.*255));

% if c<=0.5044
%     break;
%end
end
plot(all_cost);
param=init_param;















