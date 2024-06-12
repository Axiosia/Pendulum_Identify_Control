function out=Fun(ID)
DA=load('freeswing.mat');
D=DA.theta;
%model
[t,y] = ode45(@(t,y) experiment1(t,y,ID(1),ID(2),ID(3)), [0 4.948], [0.3285;0]);
y1=interp1(t,y(:,1),(0:0.002:4.948)',"spline");
out=abs(y1-D);