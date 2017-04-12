function [ matrix ] = TransformationMatrix( params )
%TRANSFORMATIONMATRIX Summary of this function goes here
%   Detailed explanation goes here


%translation
Tx=params(1);
Ty=params(2);

%Theta/Rotation
r=rad2deg(params(3));
%r=params(3);
%scale
sx=params(4);
sy=params(5);

%sheer
hx=params(6);
hy=params(7);

%translation matrix
T=[1    0   Tx;
   0    1   Ty;
   0    0   1];

%Rotation Matrix
R=[cos(r)   sin(r)  0;
  -sin(r)   cos(r)  0;
     0         0    1];

% Scale
S=[sx   0   0;
    0   sy  0;
    0   0   1];

%sheer
H=[1    hx     0;
   hy    1     0;
   0     0     1];


matrix=zeros(3,3);
matrix(1,1)=sx*cos(r);
matrix(1,2)=sin(r);
matrix(1,3)=Tx;
matrix(2,1)=-sin(r);
matrix(2,2)=sy*cos(r);
matrix(2,3)=Ty;
matrix(3,3)=1;
end

