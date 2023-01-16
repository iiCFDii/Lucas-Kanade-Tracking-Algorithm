% Name: Christopher Ciobanu
% Date: 10/10/22
% ECPE 124 Digital Image Processing
% Program 3: Canny Edge Detection
%
% This is the convolve function that performs convolution on the input
% image with a kernel
function output = convolve(image,kernel)
 [height,width,depth] = size(image);
    if depth > 1
        image = im2gray(image);    % converts rgb image to greyscale
    end   
    image = double(image);
    [ker_h, ker_w] = size(kernel);
    
    kernel = flip(kernel,1);       % flips kernl
    kernel = flip(kernel,2);
   
    % This loop performs the convolution calculations and updates output
    % image, using the kernel.
    for i=1:height
        for j=1:width
            sum = 0;
            for k=1:ker_h
                for m=1:ker_w
                    offseti=-1*floor(ker_h/2)+k-1;
                    offsetj=-1*floor(ker_w/2)+m-1;
%                     if ((i-1)>0 &&  (i+1)<=height && (j-1)>0 && (j+1)<=width) && (((i+offseti)-1)>0 &&  ((i+offseti)+1)<=height && ((j+offsetj)-1)>0 && ((j+offsetj)+1)<=width)   % Checks to make sure we are not over stepping boundaries   
                    if (((i+offseti))>0 &&  ((i+offseti))<=height && ((j+offsetj))>0 && ((j+offsetj))<=width)   % Checks to make sure we are not over stepping boundaries   
                       sum = sum + image(i+offseti,j+offsetj)*kernel(k,m); 
                    end
                end
            end
            output(i,j)=sum;
        end
    end
end

