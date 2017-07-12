clc;
clear all;

addpath('/media/nazib/Store/Image_registration/TestData');
addpath('/media/nazib/Store/Image_registration/MyModel/2D_reg');

I1=double(imread('lenag2.png'));
[m,n]=size(I1);
m=m/2;n=n/2;

[X,Y]=meshgrid(-m:1:m-1,-n:1:n-1);

ct_g=

