clear;
clc;
Ap=0.3;
As=50;  %Attenuation
Rp=1-10.^(-0.05*Ap);
Rs=10.^(-0.05*As);  %Peak approximation errors
f=[0.53,0.67];  %Band-edge frequencies
a=[0,1];    %Amplitude
dev=[Rs,Rp];
[M,Wc,beta,ftype] = kaiserord(f,a,dev); 
M=mod(M,2)+M;   %Order M has to be even
h = fir1(M,Wc,ftype,kaiser(M+1,beta));  %The filter coefficients
fvtool(h);
%omega=linspace(0,pi,512);
%mag=freqz(h,1,omega);
%plot(omega/pi,20*log10(abs(mag)));
%grid on;