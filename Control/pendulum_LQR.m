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

a1=-kg*km/rmp*ng*kg*kt/(rm*rmp);
a2=ng*kg*kt/(rm*rmp)*nm;
q=k*a2;
p=k*a1;

m11=(M+m)/q;
m12=(-m*l)/q;
m21=(-m*l)/q;
m22=(I+m*l^2)/q;
c11=(k1-p)/q;
c12=0;
c21=0;
c22=k2/q;
r=-k*b;
g11=r;
g21=-m*g*l/q;
detM=m11*m22-m21*m12;
A22=-m22/detM*c11;
A23=m12/detM*g21;
A24=m12/detM*c22;
A42=m21/detM*c11;
A43=-m11/detM*g21;
A44=-m11/detM*c22;
B21=m22/detM;
B41=-m12/detM;

A=[0,1,0,0;0,A22,A23,A24;0,0,0,1;0,A42,A43,A44];
B=[0;B21;0;B41];
C=[1,0,0,0;0,0,1,0];
D=[0;0];
Q1=[10,0,0,0];Q2=[0,5,0,0];
Q3=[0,0,1,0];Q4=[0,0,0,1];
Q=[Q1;Q2;Q3;Q4];
R=0.01;
K=lqr(A,B,Q,R)
Ac = (A-B*K);
Bc = B;
Cc = C;
Dc = D;

states = {'x' 'x_dot' 'phi' 'phi_dot'};
inputs = {'r'};
outputs = {'x'; 'phi'};

sys_cl = ss(Ac,Bc,Cc,Dc,'statename',states,'inputname',inputs,'outputname',outputs);

t = 0:0.01:10;
r =1*ones(size(t));

[y,t,x]=lsim(sys_cl,r,t);
[AX,H1,H2] = plotyy(t,y(:,1),t,y(:,2),'plot');
set(get(AX(1),'Ylabel'),'String','position')
set(get(AX(2),'Ylabel'),'String','angle')
