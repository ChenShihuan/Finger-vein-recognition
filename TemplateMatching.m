TemMatchArray= zeros(40,40);
p = 1;
aaa = 1;

for a = 1:4
    for b = 1:10
        q = 1;
        for c = 1:4
            for d = 1:10  
% a = 1;
% b = 1;
% c = 4;
% d = 3;

                s1=strcat('.\590\gabor1\','590-',num2str(a),'-',num2str(b),'-','1','.bmp'); 
                I1 = imread(s1);
                s2=strcat('.\590\gabor1\','590-',num2str(c),'-',num2str(d),'-','1','.bmp'); 
                I2 = imread(s2);
            
                InputImg = gpuArray(I1);
                TemImg = gpuArray(I2);

                [hInput, wInput] = size(InputImg);
                [hTem, wTem] = size(TemImg);

                hTem = min(hTem, hInput);
                wTem = min(wTem, wInput);

                TemImg = TemImg(1: hTem, 1: wTem);

    %             imshow(TemImg);

                corr = normxcorr2(TemImg,InputImg);
            
%             figure, surf(corr), shading flat
%             [ypeak, xpeak] = find(c==max(corr(:)));
% 
%             yoffSet = ypeak-size(TemImg,1);
%             xoffSet = xpeak-size(TemImg,2);
% 
%             figure
%             imshow(InputImg);
%             imrect(gca, [xoffSet+1, yoffSet+1, size(TemImg,2), size(TemImg,1)]);

                % 计算匹配到的特征点数量
%                 TemMatchArray(p, q) = max(c(:));    
                X = gather(corr);
                TemMatchArray(p, q) = max(X(:));    
                
                q = q+1;
                fprintf('执行次数 %d .\n', aaa);
                aaa = aaa + 1;
            end
        end
        p = p+1;
    end
end

InsideTheClass = [[TemMatchArray(1:10,1:10),TemMatchArray(11:20,11:20)];[TemMatchArray(21:30,21:30),TemMatchArray(31:40,31:40)]];
InsideTheClass = InsideTheClass(InsideTheClass<1);
tb1 = tabulate(InsideTheClass(:));

OutsideTheClass1 = TemMatchArray(:,1:10);
OutsideTheClass2 = TemMatchArray(:,11:20); 
OutsideTheClass3 = TemMatchArray(:,21:30);
OutsideTheClass4 = TemMatchArray(:,31:40);

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


% I = imread("590-1-5-3.jpg");
% % I = gpuArray(rgb2gray(I));
% I = rgb2gray(I);
% T = imread("590-1-5-2.jpg");
% % T = gpuArray(rgb2gray(T));
% T = rgb2gray(T);

% tMatcher = vision.TemplateMatcher('OutputValue', 'Best match location', 'BestMatchNeighborhoodOutputPort', true, 'ROIInputPort', true, 'ROIValidityOutputPort', true);
% [h, w] = size(T);
% ROI = [0, 0, w, h];
% [location,numberOfValues,numValid,ROIvalid] = tMatcher(I,T,ROI);
