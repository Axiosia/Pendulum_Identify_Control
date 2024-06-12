function Plott(ID)

DA=load('freeswing.mat');
D=DA.theta;
u=DA.t_data;
%模型
[t,y] = ode45(@(t,y) experiment1(t,y,ID(1),ID(2),ID(3)), [0 4.948], [0.3285;0]);
y1=interp1(t,y(:,1),(0:0.002:4.948)',"spline");
out=y1;
%拟合度与误差（均方根误差与归一化最大误差）
fit=100*(1-goodnessOfFit(out,D,'NRMSE'))
e1=sqrt(sum((D-out).^2)/length(D))*100
e2=max(abs(D-out))/(max(out)-min(out))*100
%作图
figure(1);
set(gcf,'position',[100 50 500 250]);
plot(u,D,'color',[0 0.45 0.74],'linewidth',1,'linestyle','--');
hold on;
plot(u,out,'color',[1 0 0],'linewidth',1);
grid on;
set(gca,'FontSize',12,'Fontname','Times New Roman');
xlabel('time(s)','FontSize',12,'Fontname','Times New Roman');
ylabel('angle','FontSize',12,'Fontname','Times New Roman');
