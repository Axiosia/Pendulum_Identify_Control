clear;close all;clc;
warning off;
%初始化
x0=rand(1,4);
%最小二乘辨识法
options=optimoptions(@lsqnonlin,'Algorithm','levenberg-marquardt');      %levenberg-marquardt  trust-region-reflective
options.Display = 'iter';
options.StepTolerance = 1e-20;
options.FunctionTolerance = 1e-20;
options.OptimalityTolerance = 1e-20;
options.MaxFunctionEvaluations = 6000;%迭代次数
ID=lsqnonlin(@Fun,x0,[],[],options);
%辨识结果图
Plott(ID); 