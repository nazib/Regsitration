function [I]=image_normalize(image)


minI=min(min(image));
maxI=max(max(image));

I=(image-minI)./(maxI-minI);


end