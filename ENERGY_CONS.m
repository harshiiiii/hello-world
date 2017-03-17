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
Eb=25e3;
m=7;
t=[3e6:4.8e6:5e7];
dm=2;   % optimal hop length
alpha1=0.33e-6;
es=1e-9;
H=960; %bits
p=[0.01:0.01:0.1];
rs=H/((A-B)*N/A);
x=20;

for i=1:length(p) 
    
Ed(i) = (((m+1)/2)*N*p(i)*rs*t(i)*((A-B)/A)*(alpha1*(n/(n-1))*(D/dm))+ N*p(i)*(B/A)*rs*t(i)*es + p(i)*(N/A)*rs*t(i)*((2/3)*pi*D^3)*(alpha1*(n/(n-1))*(x/dm)-alpha12)+(1-p(i))*t(i)*N*(B/A)*Esleep)/N;
end

plot(p,Ed,'k--*')

xlabel('Duty Cycle (p)')
ylabel('Econsumption per node (uj)')

title('Per node Econsumption for Gas & Oil WSN')
