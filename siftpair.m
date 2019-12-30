% sift比对

num= zeros(40,40);
p = 1;
aaa = 1;

for a = 1:4
    for b = 1:10
        q = 1;
        for c = 1:4
            for d = 1:10                        
                s1=strcat('E:\图像处理与机器视觉\590\图像增强实现2-1\','590-',num2str(a),'-',num2str(b),'-','1','.bmp'); 
                i1 = imread(s1);
                s2=strcat('E:\图像处理与机器视觉\590\图像增强实现2-1\','590-',num2str(c),'-',num2str(d),'-','1','.bmp'); 
                i2 = imread(s2);
                num(p, q) = match(s1,s2);    
                q = q+1;
                fprintf('执行次数 %d .\n', aaa);
                aaa = aaa + 1;
            end
        end
        p = p+1;
    end
end


% 

% num(num<3)=0;
% num(num>100)=40;
% figure
% imshow(num)

InsideTheClass = [[num(1:10,1:10),num(11:20,11:20)];[num(21:30,21:30),num(31:40,31:40)]];
InsideTheClass = InsideTheClass(InsideTheClass<60);
tb1 = tabulate(InsideTheClass(:));

OutsideTheClass1 = num(:,1:10);
OutsideTheClass2 = num(:,11:20); 
OutsideTheClass3 = num(:,21:30);
OutsideTheClass4 = num(:,31:40);

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

figure
plot(tb1(:,1),tb1(:,3))
hold on
plot(tb2(:,1),tb2(:,3))
hold off


















