% Name: Christopher Ciobanu
% Date: 10/19/22
% ECPE 124 Digital Image Processing
% Program 5: Lucas Kanade Tracking

%This is the Solve2x2LinearSystem function which performs the delta u
%calcualtion
function deltau = Solve2x2LinearSystem(Z,err)

    det = Z(1,1)*Z(2,2)-Z(1,2)*Z(2,1);
    udelta(1)=(Z(2,2)*err(1) - Z(1,2)*err(2))/det; 
    udelta(2)=(Z(1,1)*err(2) - Z(1,2)*err(1))/det; 
    deltau = udelta;
end