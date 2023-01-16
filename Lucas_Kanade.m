% Name: Christopher Ciobanu
% Date: 10/19/22
% ECPE 124 Digital Image Processing
% Program 5: Lucas Kanade Tracking

%This is the Lucas Kanade function which performs lucan kanade tracking
function topfeatures = Lucas_Kanade(I, J, topfeatures, window)
    flength = size(topfeatures);
    sigma = 0.6;
    
    [G,w] = Gaussian(sigma);
    [Gderiv,w] = Gaussian_Deriv(sigma);

    image_h_in = convolve(I,G');
    Gx = convolve(image_h_in,Gderiv);

    image_v_in = convolve(I,G);
    Gy = convolve(image_v_in,Gderiv');

    for i=1:flength(1)      %for each featurepoint in topfeatures do
        iter = 0;
        u(1)=0;
        u(2)=0;%displacement vector initialized to zero
        udelta(1)=0; %incremental displacement vector initialized to zero
        udelta(2)=0; %incremental displacement vector initialized to zero
        [Z] = Compute2x2GradietnMatrix(Gx,Gy,topfeatures(i,1), topfeatures(i,2),window);
        while(1)%iterations to update deltau
            [err] = Compute2x1ErrorVector(I,J,Gx,Gy,topfeatures(i,1), topfeatures(i,2),window,u);
            [udelta] = Solve2x2LinearSystem(Z,err);
            %update u
            u(1)=u(1)+udelta(1); %Horizontal
            u(2)=u(2)+udelta(2); %Vertical
            %break while if udelta is small or iter exceeds threshold
            if(iter > 10) %typically 10 iters
                break
            end
            if(udelta(1) <=0.2 && udelta(2) <=0.2)
                break
            end
            iter = iter + 1;
        end       
         %Update featurepoint in topfeatures 
          topfeatures(i,1) = topfeatures(i,1) + u(1);
          topfeatures(i,2) = topfeatures(i,2) + u(2);

         %be sure to add correct displacement to correct indexes 
    end
end

 
 
 
