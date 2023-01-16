% Name: Christopher Ciobanu
% Date: 10/19/22
% ECPE 124 Digital Image Processing
% Program 5: Lucas Kanade Tracking

%This is the Compute2x1ErrorVector function which calculates the error vector
function err = Compute2x1ErrorVector(I,J,Gx,Gy,j,i,window,u) 
    [height,width] = size(Gx);
     w=floor(window/2); 
     err(1)=0; 
     err(2)=0; 
     for offseti=-w:w %visit window pixels
         for offsetj=-w:w
             if (((offseti+i)>0) &&  ((offseti+i)<=height) && ((offsetj+j)>0) && ((offsetj+j)<=width) && ((i+u(2)+offseti)>0) &&  ((i+u(2)+offseti)<=height) && ((j+u(1)+offsetj)>0) && ((j+u(1)+offsetj)<=width) )      % Checks to make sure we are not over stepping boundaries       Gx_inter=Interpolate(Gx,i+offseti,j+offsetj)
                 Gx_inter = Interpolate(Gx,i+offseti,j+offsetj);                  
                 Gy_inter = Interpolate(Gy,i+offseti,j+offsetj);
                 I_inter = Interpolate(I, i+offseti,j+offsetj);
                 J_inter = Interpolate(J,i+u(2)+offseti,j+u(1)+offsetj);
                 err(1) = err(1) + Gx_inter*(I_inter - J_inter);
                 err(2) = err(2) + Gy_inter*(I_inter - J_inter);
             end
         end
     end
    
end