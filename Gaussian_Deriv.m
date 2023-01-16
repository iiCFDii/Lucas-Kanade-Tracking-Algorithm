% Name: Christopher Ciobanu
% Date: 10/10/22
% ECPE 124 Digital Image Processing
% Program 3: Canny Edge Detection
%
% This is the Gaussian derivative function that calcualtes the Gaussian based on sigma

function [Gderiv,w] = Gaussian_Deriv(Sigma)
    
    a=round(2.5*Sigma - 0.5);
    w=2*a+1;
    sum=0;
    for i=1:w
       Gderiv(i)=-1*(i-1-a)*exp((-1*(i-1-a)*(i-1-a))/(2*Sigma*Sigma));
       sum=sum-i*Gderiv(i);
    end
    
    Gderiv=Gderiv/sum;    
      
end