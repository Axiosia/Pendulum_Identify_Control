clear;close all;clc;
DA=load('4.2-4 converted.mat');
load("result_of_experiment2.mat")
D1=DA.x_p;
D2=DA.theta;
u=DA.t_data;
m=ID(1);
k1=ID(2);
a=ID(3);
b=ID(4);
%模型
[t,y] = ode45(@(t,y) experiment2(t,y,m,k1,a,b),0:0.002:7.462, [0;0;0;0]);
y1=interp1(t,y(:,1),(0:0.002:7.462)',"spline");
y2=interp1(t,y(:,3),(0:0.002:7.462)',"spline");
out1=y1;
out2=y2;
%拟合度与误差
%小车位移
fit1=100*(1-goodnessOfFit(out1,D1,'NRMSE'))
e11=sqrt(sum((D1-out1).^2)/length(D1))*100
e12=max(abs(D1-out1))/(max(out1)-min(out1))*100
%摆杆转角
fit2=100*(1-goodnessOfFit(out2,D2,'NRMSE'))
e21=sqrt(sum((D2-out2).^2)/length(D2))*100
e22=max(abs(D2-out2))/(max(out2)-min(out2))*100
%作图
%小车位移辨识结果
figure(1);
set(gcf,'position',[100 50 500 250]);
plot(u,D1,'color',[0 0.45 0.74],'linewidth',1,'linestyle','--');
hold on;
plot(u,out1,'color',[1 0 0],'linewidth',1);
grid on;
set(gca,'FontSize',12,'Fontname','Times New Roman');
xlabel('time(s)','FontSize',12,'Fontname','Times New Roman');
ylabel('displacement','FontSize',12,'Fontname','Times New Roman');
legend('\fontname{宋体}\fontsize{12}原始数据','\fontname{宋体}\fontsize{12}辨识结果','location','northwest','FontSize',12);
%摆杆转角辨识结果
figure(2);
set(gcf,'position',[100 50 500 250]);
plot(u,D2,'color',[0 0.45 0.74],'linewidth',1,'linestyle','--');
hold on;
plot(u,out2,'color',[1 0 0],'linewidth',1);
grid on;
set(gca,'FontSize',12,'Fontname','Times New Roman');
xlabel('time(s)','FontSize',12,'Fontname','Times New Roman');
ylabel('angle','FontSize',12,'Fontname','Times New Roman');
legend('\fontname{宋体}\fontsize{12}原始数据','\fontname{宋体}\fontsize{12}辨识结果','location','northwest','FontSize',12);