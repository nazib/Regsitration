clc;
clear all;
addpath('/media/nazib/Store/Image_registration/TestData');

addpath('/media/nazib/Store/Image_registration/MyModel/2D_reg'); %for 2D registration

Itarget=imread('lenag2.png');
%Isource=rgb2gray(imresize(imread('source.jpg'),size(Itarget)));
Isource=imread('lenag3.png');
Itarget=double(Itarget);
Isource=double(Isource);

%Normalization
Itarget=image_normalize(Itarget);
Isource=image_normalize(Isource);

%Blurring
Isource_s=imfilter(Isource,fspecial('gaussian',[10 10],2.5));
Itarget_s=imfilter(Itarget,fspecial('gaussian',[10 10],2.5));

%% Apply Affine registration
param=[0 0 0 100 100 0 0];
scale=[1 1 1 0.01 0.01 0 0];

%[cost,ims,m]=AffineRegistration(im_s,im_t,param);
%[x]=lsqnonlin(@(x)AffineRegistration(Itarget_s,Isource_s,x,scale),param,[],[],optimset('Display','iter','MaxIter',1000));
[x,all]=gradient_descent(param,Itarget_s,Isource_s,scale,500);
%[x]=kanade_alignment(param,Itarget,Isource,scale,100);
m=min(all(:,1));
idx=find(all(:,1)==m);
x=all(idx,2:end);
x=x.*scale;
M=TransformationMatrix(x);
[reg_I]=ApplyAffine(Isource,M);
        
figure(3);
subplot(1,3,1);imagesc(Itarget);
title('Target Image');
subplot(1,3,2);imagesc(Isource);
title('Source Image');
subplot(1,3,3);imagesc(reg_I);
title('Affine Transformed Image');





   




