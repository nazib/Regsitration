function [cost,IsourceT,M] = AffineRegistration(Itarget,Isource,params,scale)
%AFFINEREGISTRATION Summary of this function goes here
%   Detailed explanation goes here


params=params.*scale;

M=TransformationMatrix(params);
IsourceT=ApplyAffine(Isource,M);
imshow(uint8(IsourceT.*255));
%[cost,IsourceT]=image_difference(Itarget,IsourceT,'cc');
%cost=correlation(Itarget,IsourceT);
cost=1-corr2(Itarget,IsourceT);
end

