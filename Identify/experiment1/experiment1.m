function out = experiment1(t,y,m,l,k2)
I=4/3*m*l^2;
g=9.806;
out =[y(2);-(k2*y(2)+m*g*l*sin(y(1)))/(I+m*l^2)];