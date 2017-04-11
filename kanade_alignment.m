function [param]=kanade_alignment(init_param,target,source,scale,iter)


for i=1:iter


T=TransformationMatrix(init_param);
I_w=ApplyAffine(source,T);
differ_I=target-I_w;
[dx,dy]=gradient(source);
delta_Ix=ApplyAffine(dx,T);
delta_Iy=ApplyAffine(dy,T);

delta_I=[delta_Ix(:) delta_Iy(:)];


r=init_param(3);
jecobian=[1 0 -sin(r)-cos(r);
          0 1   cos(r)-sin(r)];


steep_I=delta_I*jecobian;
hassian=sum(steep_I'*steep_I);

delta_param=sum(steep_I'*[differ_I(:)])./hassian;
init_param(1:3)=init_param(1:3)+delta_param;
i
end
param=init_param;


end