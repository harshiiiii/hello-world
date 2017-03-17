clear all
clc
close all
A=200*200;   %M2
D=60;   %bottle neck zone radius
B=pi*(D)^2;
N=1000;
n=2;
alpha11=0.937e-6;
alpha12=0.787e-6;
alpha2=0.0172e-6;
Esleep=30e-6;
Eb=17e3;
m=11;
%t=1;
dm=2;   % optimal hop length
alpha1=0.33e-6;
es=1e-9;
H=960; %bits
p=[0.01:0.01:0.1];
%p=0.01;
%int(int(x)dS)=(2/3)*pi*D^3;
rs=H/((A-B)*N/A);

for i=1:length(p)    
Qx(i) = p(i)* alpha1*(n/(n-1))*rs*(D*(A-B)*((m+1)/2)+((2/3)*pi*(D)^3))+B*dm*(p(i)*rs*(es-alpha12)+(1-p(i))*Esleep);
t(i)=(dm*B*Eb)/Qx(i);
end
plot(p,t,'k--*')
hold on
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all
clc
A=200*200;   %M2
D=60;   %bottle neck zone radius
B=pi*(D)^2;
N=1000;
n=2;
alpha11=0.937e-6;
alpha12=0.787e-6;
alpha2=0.0172e-6;
Esleep=30e-6;
Eb=17e3;
m=11;
%t=1;
k=2;
dm=2;   % optimal hop length
alpha1=0.342e-6;
es=1e-9;
h=2;
H=960; %bits
p=[0.01:0.01:0.1];
%p=0.01;
%int(int(x)dS)=(2/3)*pi*D^3;
rs=H/((A-B)*N/A);

for i=1:length(p)    
Qx(i) = p(i)*alpha1*(n/(n-1))*rs*(D*(A-B)*((m+1)/2)*((1+k*(h-1))/(k*h))+((2/3)*pi*(D)^3))+B*dm*(p(i)*rs*(es-alpha12)+(1-p(i))*Esleep);
t(i)=(dm*B*Eb)/Qx(i);
end
plot(p,t,'k--o')
hold on

xlabel('Duty Cycle (p)');
ylabel('lifetime(in sec.)');
title('Comparison of DC wsn & NC-DC wsn')
legend('duty cycle wsn','dc with network coding wsn');