SURFPairArray= zeros(40,40);
p = 1;
aaa = 1;

for a = 1:4
    for b = 1:10
        q = 1;
        for c = 1:4
            for d = 1:10  
% a = 1;
% b = 1;
% c = 2;
% d = 1;

                s1=strcat('E:\图像处理与机器视觉\590\图像增强实现2-1\','590-',num2str(a),'-',num2str(b),'-','1','.bmp'); 
                I1 = imread(s1);
                s2=strcat('E:\图像处理与机器视觉\590\图像增强实现2-1\','590-',num2str(c),'-',num2str(d),'-','1','.bmp'); 
                I2 = imread(s2);

                points1 = detectSURFFeatures(I1);
                points2 = detectSURFFeatures(I2);
                [f1,vpts1] = extractFeatures(I1,points1);
                [f2,vpts2] = extractFeatures(I2,points2);
                indexPairs = matchFeatures(f1,f2) ;
%                 indexPairs = matchFeatures(f1,f2,'Method','Approximate', 'MatchThreshold', 1, 'MaxRatio', 0.5) ;
                matchedPoints1 = vpts1(indexPairs(:,1));
                matchedPoints2 = vpts2(indexPairs(:,2));
%                 figure; showMatchedFeatures(I1,I2,matchedPoints1,matchedPoints2);
%                 legend('matched points 1','matched points 2');
                
                % 计算匹配到的特征点数量
                [m,n] = size(indexPairs);
                SURFPairArray(p, q) = m;    
                
                q = q+1;
                fprintf('执行次数 %d .\n', aaa);
                aaa = aaa + 1;
            end
        end
        p = p+1;
    end
end

% num(num<3)=0;
% num(num>100)=40;
% figure
% imshow(num)

InsideTheClass = [[SURFPairArray(1:10,1:10),SURFPairArray(11:20,11:20)];[SURFPairArray(21:30,21:30),SURFPairArray(31:40,31:40)]];
InsideTheClass = InsideTheClass(InsideTheClass<60);
tb1 = tabulate(InsideTheClass(:));

OutsideTheClass1 = SURFPairArray(:,1:10);
OutsideTheClass2 = SURFPairArray(:,11:20); 
OutsideTheClass3 = SURFPairArray(:,21:30);
OutsideTheClass4 = SURFPairArray(:,31:40);

OutsideTheClass1(1:10,:) = [];
OutsideTheClass2(11:20,:) = [];
OutsideTheClass3(21:30,:) = [];
OutsideTheClass4(31:40,:) = [];

OutsideTheClass = [OutsideTheClass1, OutsideTheClass2, OutsideTheClass3, OutsideTheClass4];
OutsideTheClass = OutsideTheClass(OutsideTheClass >= 0);
tb2 = tabulate(OutsideTheClass(:));
% figure
% imshow(InsideTheClass1)

figure
% plot(tb1(:,1),tb1(:,3))
[f1,xi1] = ksdensity(InsideTheClass); 
plot(xi1,f1);
hold on
% plot(tb2(:,1),tb2(:,3))
[f2,xi2] = ksdensity(OutsideTheClass); 
plot(xi2,f2);
hold off