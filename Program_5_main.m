% Name: Christopher Ciobanu
% Date: 10/19/22
% ECPE 124 Digital Image Processing
% Program 5: Lucas Kanade Tracking
% How to Use Testing Script: Hit Run at the Top of Matlab and select which image
% sequence to perform tracking on: flower garden or statue sequence. Then
% select the window value. 

x1 = "1: Section 1 Statue Sequence";
x2 = "2: Section 2 Flower Garden Sequence";
x7 = "7: Exit Program";
selection= true;

% This is the Main while loop that runs the selection menu
while selection
    % Prints Selection menu
    disp(x1)
    disp(x2)
    disp(x7)
    
    % Switch statement that allows for different selections
    n = input('Enter section you would like to Test:');
    
    if (n ~=7 )
        window = input('Enter the Window Value(11,15,or 17):');
        if (window ~= 11 || window ~= 15 || window ~= 17)
            window = 11;
        end
    end
    switch n
        case 1 % This case performs normal watershed segmentation on an image
            [FileName,FilePath]=uigetfile('*');          % Reads in File  
            image1 = imread(strcat(FilePath,FileName));  % Reads in File
            [height, width, depth] = size(image1);
            sigma = 0.6;
            featurePoints = 21;
            book=zeros(height, width, depth, 31);

            figure
            imshow(image1)
            title('Original Image')
            
            topfeatures = ginput(featurePoints);
            
            imshow(image1)
            title('Selected Features')
            hold on
            
            for i = 1:featurePoints
                 line([(topfeatures(feat,1) + 3) (topfeatures(feat,1) - 3)],[(topfeatures(feat,2) + 3) (topfeatures(feat,2) - 3)],'color','red'); 
                 hold on
                 line([(topfeatures(feat,1) + 3) (topfeatures(feat,1) - 3)],[(topfeatures(feat,2) - 3) (topfeatures(feat,2) + 3)],'color','red');
                 hold on                 
            end
            
            for x=1:31
                FileName=strcat(FilePath, "img0",string(x+587),".bmp");
                book(:,:,:,x)=imread(FileName);
            end
            
            for lt = 1:30     
                 topfeatures = (Lucas_Kanade(book(:,:,:,lt),book(:,:,:,lt+1),topfeatures,window));
                 imshow(uint8(book(:,:,:,lt)));
                 title('Movie of Feature Points')
                 for feat = 1:featurePoints
                        line([(topfeatures(feat,1) + 3) (topfeatures(feat,1) - 3)],[(topfeatures(feat,2) + 3) (topfeatures(feat,2) - 3)],'color','red'); 
                        hold on
                        line([(topfeatures(feat,1) + 3) (topfeatures(feat,1) - 3)],[(topfeatures(feat,2) - 3) (topfeatures(feat,2) + 3)],'color','red');
                        hold on                 
                 end
                 pause(0.3)
            end

            
            
        case 2 % This case performs Marker Based WaterShed
            [FileName,FilePath]=uigetfile('*');          % Reads in File  
            image1 = imread(strcat(FilePath,FileName));  % Reads in File
            sigma = 0.6;
            featurePoints = 21;
            [height, width, depth] = size(image1);
            book=zeros(height, width, depth, 29);

            figure
            imshow(image1)
            title('Original Image')
            
            topfeatures = ginput(featurePoints);
            
            imshow(image1)
            title('Selected Features')
            hold on
            
            for i = 1:featurePoints
                   line([(topfeatures(feat,1) + 3) (topfeatures(feat,1) - 3)],[(topfeatures(feat,2) + 3) (topfeatures(feat,2) - 3)],'color','red'); 
                   hold on
                   line([(topfeatures(feat,1) + 3) (topfeatures(feat,1) - 3)],[(topfeatures(feat,2) - 3) (topfeatures(feat,2) + 3)],'color','red');
                   hold on    
            end
            
            for x=1:29
                FileName=strcat(FilePath, "img0",string(x+29),".pgm");
                book(:,:,:,x)=imread(FileName);
            end
            
            for lt = 1:28     
                 topfeatures = (Lucas_Kanade(book(:,:,:,lt),book(:,:,:,lt+1),topfeatures,window));
                 imshow(uint8(book(:,:,:,lt)));
                 title('Movie of Feature Points')
                 for feat = 1:featurePoints
                        line([topfeatures(feat,1) + 3 topfeatures(feat,1) - 3],[topfeatures(feat,2) + 3 topfeatures(feat,2) - 3],'color','red'); 
                        hold on
                        line([topfeatures(feat,1) + 3 topfeatures(feat,1) - 3],[topfeatures(feat,2) - 3 topfeatures(feat,2) + 3],'color','red');
                        hold on                 
                 end
                 pause(0.3)
            end
            
        case 7 % This case exits the program
            disp("Exiting Program...")
            selection = false;
            disp("GoodBye")
        otherwise
            disp("Please Select a Valid Character 1,2, or 7")
    end
end


