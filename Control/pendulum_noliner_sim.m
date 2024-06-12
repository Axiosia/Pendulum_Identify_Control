function [sys,x0,str,ts] = pendulum(t,x,u,flag)  
switch flag
case 0
    [sys,x0,str,ts]=mdlInitializeSizes;
case 1
    sys=mdlDerivatives(t,x,u);
case 3
    sys=mdlOutputs(t,x,u);
case {2,4,9}
    sys=[];
otherwise
    error(['Unhandled flag = ',num2str(flag)]);
end

function [sys,x0,str,ts]=mdlInitializeSizes
sizes = simsizes;
sizes.NumContStates  = 4;
sizes.NumDiscStates  = 0;
sizes.NumOutputs     = 4;
sizes.NumInputs      = 1;
sizes.DirFeedthrough = 0;
sizes.NumSampleTimes = 1;
sys = simsizes(sizes);
x0  = [0,0,-0.2,0];
str = [];
ts  = [-1 0];


function sys=mdlDerivatives(t,x,u)

k2=0.0003;
l=0.1861;
m=0.24;
k1=4.2095;
k=0.3944;
b=-0.6318;
M=0.57;
ng=1;
nm=1;
kg=3.71;
kt=0.00767;
km=0.00767;
rm=2.6;
rmp=0.00635;
g=9.806;
I=4/3*m*l^2;
V=u+k*b;
F1=ng*kg*kt/(rm*rmp)*(-kg*km*x(2)/rmp+nm*V);
F=k*(F1+b);
m11=M+m;
m12=-m*l*cos(x(3));
m21=-m*l*cos(x(3));
m22=I+m*l^2;
c12=m*l*sin(x(3))*x(4);
g21=-m*g*l*sin(x(3));
detM=m11*m22-m21*m12;

y1=m22/detM*(F-c12*x(4)-k1*x(2))-m21/detM*(-k2*x(4)-g21);
y2=-m12/detM*(F-c12*x(4)-k1*x(2))+m11/detM*(-k2*x(4)-g21);

sys(1)=x(2); 
sys(2)=y1;
sys(3)=x(4);
sys(4)=y2;

function sys=mdlOutputs(t,x,u)
sys(1)=x(1);   
sys(2)=x(2);
sys(3)=x(3);   
sys(4)=x(4);