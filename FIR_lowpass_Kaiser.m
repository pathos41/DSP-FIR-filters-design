clear;
clc;
Rs=0.01;    %Peak approximation error
f=[0.4,0.6];    %Band-edge frequencies
a=[0.975,0];    %Amplitudes
dev=Rs*ones(1,length(a));
[M, Wc, beta, ftype]=kaiserord(f,a,dev);    %Get the filter order
h=fir1(M,Wc,ftype,kaiser(M+1,beta));    %The filter coefficients
fvtool(h);
%omega=linspace(0,pi,512);
%mag=freqz(h,1,omega);
%plot(omega/pi,20*log10(abs(mag)));
%grid on;