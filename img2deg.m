function [ImgAngle, AverageOfMidLineY, MidLine,FingerWidth] = img2deg(Input)
% 输入图片
% 输出与手指有关的参数：
% ImgAngle, 图片角度
% AverageOfMidLineY, 中线Y值平均值
% MidLine, 中线参数
% FingerWidth 手指半宽度

EdgeImage = edge(Input,'Prewitt');
% figure
% imshowpair(EdgeImage,Input,'montage')

% 取边缘中线
[height,weigh] = size(EdgeImage);
MidLineStart = 40;
MidLineEnd = weigh - 150;
MidLineX = MidLineStart;

MidLineArray = zeros(3,weigh-190);

for i = 1  : MidLineEnd-MidLineStart
    MidLineYUp = floor(weigh/2);
    MidLineYDown = floor(weigh/2);
%     条件循环
    while EdgeImage(MidLineYUp,MidLineX) == 0
        MidLineYUp = MidLineYUp - 1;
        if MidLineYUp == 0
%             跳出循环
        break
        end
    end  
    while EdgeImage(MidLineYDown,MidLineX) == 0
        MidLineYDown = MidLineYDown+1;
        if MidLineYDown == height;
%             跳出循        
        break
        end
    end 
    MidLineX = MidLineX + 1;
    MidLineY = floor((MidLineYUp + MidLineYDown) / 2);
    FingerWidth = floor((MidLineYDown - MidLineYUp) / 2);
%   数据矩阵，该中心点坐标为MidLineX, MidLineY
    MidLineArray(1,i) = MidLineX;
    MidLineArray(2,i) = MidLineY;
    MidLineArray(3,i) = FingerWidth;
end

% 拟合直线
MidLine = polyfit(MidLineArray(1,:),MidLineArray(2,:),1);
y1 = polyval(MidLine,MidLineArray(1,:));
% figure
% plot(MidLineArray(1,:),MidLineArray(2,:),'o')
% hold on
% figure
% imshow(EdgeImage);
% hold on
% plot(MidLineArray(1,:),y1)
% hold off

% 求出斜率角度
ImgAngle = rad2deg(atan(MidLine(1,1)));
FingerWidth = floor(mean(MidLineArray(3,:))) - 20;
AverageOfMidLineY = mean(y1);


