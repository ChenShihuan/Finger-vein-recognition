function FingerImg = input2FingerImg(Input)
% 输入图片，输出截取的手指图像

Input = rgb2gray(Input);
% figure
% imshow(Input)

% 求中线和旋转角度
[ImgAngle,~,~,~] = img2deg(Input);

% 旋转图片
RotatingImg = imrotate(Input,ImgAngle,'bilinear','crop');
% figure
% imshow(RotatingImg);

% 再次求中线
[~, AverageOfMidLineY, ~, FingerWidth] = img2deg(RotatingImg);

FingerImg = RotatingImg(AverageOfMidLineY - FingerWidth : AverageOfMidLineY + FingerWidth,:);
% figure
% imshow(FingerImg);
