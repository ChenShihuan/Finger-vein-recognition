a = 1;
b = 1;
% for a = 1:4
%     for b = 1:10
s1=strcat('E:\图像处理与机器视觉\590\二值化1\','590-',num2str(a),'-',num2str(b),'-','1','.bmp'); 
Input = imread(s1);
% Input = ~Input;
Input = uint8(Input);
Input(Input>0)=255;
figure
imshow(Input);

% gaborArray = gabor([6 3],[0 90]);
% [mag,phase] = imgaborfilt(Input,gaborArray);
% figure
% subplot(2,2,1);
% for p = 1:4
%     subplot(2,2,p)
%     imshow(mag(:,:,p),[]);
%     theta = gaborArray(p).Orientation;
%     lambda = gaborArray(p).Wavelength;
%     title(sprintf('Orientation=%d, Wavelength=%d',theta,lambda));
% end
gaborArray = gabor([3],[0 90]);
[mag,phase] = imgaborfilt(Input,gaborArray(1));
[mag2,phase] = imgaborfilt(mag,gaborArray(2));
figure
imshow(mag(:,:),[]);
figure
imshow(mag2(:,:),[]);
%  imshowpair(mag,Input,'montage')

%     end
% end