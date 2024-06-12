load("simresult.mat")
V=out.V;
dtheta=out.dtheta;
dx=out.dx;
flag=out.flag;
input=out.input;
t=out.t;
x=out.x;
theta=out.theta;

figure(1);
set(gcf,'position',[100 50 500 250]);
plot(t,x,'color',[0 0.45 0.74],'linewidth',1,'linestyle','-');
hold on;
plot(t,theta,'color',[1 0 0],'linewidth',1);
grid on;
axis([0 8 -4 1.4]);
set(gca,'FontSize',12,'Fontname','Times New Roman');
xlabel('time(s)','FontSize',12,'Fontname','Times New Roman');
ylabel('displacement;angle','FontSize',12,'Fontname','Times New Roman');
legend('$x$','$\theta$','Interpreter','latex');

figure(2);
set(gcf,'position',[100 50 500 250]);
plot(t,dx,'color',[0 0.45 0.74],'linewidth',1,'linestyle','-');
hold on;
plot(t,dtheta,'color',[1 0 0],'linewidth',1);
grid on;

set(gca,'FontSize',12,'Fontname','Times New Roman');
xlabel('time(s)','FontSize',12,'Fontname','Times New Roman');
ylabel('velocity;angular velocity','FontSize',12,'Fontname','Times New Roman');
legend('$\dot{x}$','$\dot\theta$','Interpreter','latex');

figure(3);
set(gcf,'position',[100 50 500 250]);
plot(t,flag,'color',[0 0.45 0.74],'linewidth',1,'linestyle','-');
grid on;
axis([0 8 -0.2 1.2]);
set(gca,'FontSize',12,'Fontname','Times New Roman');
xlabel('time(s)','FontSize',12,'Fontname','Times New Roman');
ylabel('signal','FontSize',12,'Fontname','Times New Roman');
