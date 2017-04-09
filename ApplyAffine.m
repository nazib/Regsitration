function [ AI] = ApplyAffine(Is,Matrix)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

[m,n]=size(Is);

%Creating image co-ordinate with 0 at the center of the image 
minX=-(m/2-1);
maxX=m/2;
minY=-(n/2-1);
maxY=n/2;


[X,Y]=meshgrid(minX:maxX,minY:maxY);

% Co-ordinate matrix of source image 
Ti=[X(:)';Y(:)';ones(1,m*n)]; 

%Transformed X, Y
Tm=Matrix*Ti;
Xm=Tm(1,:);
Ym=Tm(2,:);

Xm=reshape(Xm,m,n);
Ym=reshape(Ym,m,n);

%Interpolation
AI=interp2(X,Y,Is,Xm,Ym, 'cubic', 0);
end

