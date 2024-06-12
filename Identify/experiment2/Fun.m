function out=Fun(ID)
DA=load('4.2-4 converted.mat');
D1=DA.x_p;
D2=DA.theta;
%model
[t,y] = ode45(@(t,y) experiment2(t,y,ID(1),ID(2),ID(3),ID(4)),[0 7.462], [0;0;0;0]);
y1=interp1(t,y(:,1),(0:0.002:7.462)',"spline");
y2=interp1(t,y(:,3),(0:0.002:7.462)',"spline");
%适应度函数
out=sqrt((y1-D1).^2+(y2-D2).^2);