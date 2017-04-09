function [cost]=correlation(im_t,im_s)

mean1=mean(im_t(:));
mean2=mean(im_s(:));
 
m_imt=repmat(mean1,size(im_t));
m_ims=repmat(mean2,size(im_s));

%% Correlation Coefficient calculation
difft=im_t-m_imt;
diffs=im_s-m_ims;
norm=sum(sum(difft.*diffs));
dnom=sqrt(sum(sum(difft.^2))*sum(sum(diffs.^2)));
cost=norm/dnom;
end
