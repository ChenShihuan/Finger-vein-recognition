function pdf(error)
%CREATEFIGURE5(data1)
%  DATA1:  histogram data

%  由 MATLAB 于 26-Mar-2019 21:00:20 自动生成

% 创建 figure
figure1 = figure;

% 创建 axes
axes1 = axes('Parent',figure1);
hold(axes1,'on');

% 设置其余坐标区属性
set(axes1,'FontSize',12,'TickDir','out');

hist(error,10);
title('Histogram of Horizontal Position Errors');
ylabel('The Number of Positioning Errors');
% subplot(3,1,3);
% hist(error_z,10);
% title('Histogram of Vertical Position Errors');
hold off;
xlabel('Position error(cm)');
