% Name: Christopher Ciobanu
% Date: 10/19/22
% ECPE 124 Digital Image Processing
% Program 5: Lucas Kanade Tracking

%This is the Compute2x2GradietnMatrix function which computes the v value 
function Z = Compute2x2GradietnMatrix(Gx,Gy,j,i,window)
    [height,width] = size(Gx);
    ixx=0;
    iyy=0;
    ixiy=0;
    w=floor(window/2);
    for offseti=-w:w %sum Gx and Gy over window
        for offsetj=-w:w
            if (((offseti+i)>0) &&  ((offseti+i)<=height) && ((offsetj+j)>0) && ((offsetj+j)<=width))      % Checks to make sure we are not over stepping boundaries       Gx_inter=Interpolate(Gx,i+offseti,j+offsetj)
                Gy_inter = Interpolate(Gy,i+offseti,j+offsetj);
                Gx_inter = Interpolate(Gx,i+offseti,j+offsetj);
                ixx = ixx + Gx_inter^2;
                iyy = iyy + Gy_inter^2;
                ixiy = ixiy + Gx_inter*Gy_inter;
            end
        end
    end
    Z =[ixx ixiy;ixiy iyy];


end