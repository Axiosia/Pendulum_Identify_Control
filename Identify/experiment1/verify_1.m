clear;clc;close all;
load('freeswing.mat');
load("result_of_experiment1.mat")
D=theta;
u=t_data;
m=ID(1);
l=ID(2);
k2=ID(3);
%根据辨识参数求输出
[t,y] = ode45(@(t,y) experiment1(t,y,m,l,k2), [0 4.948], [0.3285;0]);
y1=interp1(t,y(:,1),(0:0.002:4.948)',"spline");
out=y1;
%辨识拟合度与误差
fit1=100*(1-goodnessOfFit(out,D,'NRMSE'))
e11=sqrt(sum((D-out).^2)/length(D))*100
e12=max(abs(D-out))/(max(out)-min(out))*100
%作图
figure(1);
set(gcf,'position',[100 50 500 250]);
plot(u,D,'color',[0 0.45 0.74],'linewidth',1,'linestyle','--');
hold on;
plot(u,out,'color',[1 0 0],'linewidth',1);
grid on;
axis([0 5 -0.35 0.55])
set(gca,'FontSize',12,'Fontname','Times New Roman');
xlabel('time(s)','FontSize',12,'Fontname','Times New Roman');
ylabel('angle','FontSize',12,'Fontname','Times New Roman');
legend('\fontname{宋体}\fontsize{12}原始数据','\fontname{宋体}\fontsize{12}辨识结果','location','northwest','FontSize',12);
