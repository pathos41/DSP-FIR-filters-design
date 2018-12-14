clear;
clc;
wp=0.4*pi;
ws=0.6*pi;  %Band-edge frequencies
Ap=0.5;
As=55;  %Attenuation
N=ceil(12*pi/(ws-wp));    %Determine the length of the filter
M=N-1;  %Order of the filter
w=blackman(N)'; %Blackman window
wc=(wp+ws)/2;   %Cut-off frequency
k=0:M;
hd=(wc/pi)*sinc(wc*(k-0.5*M)/pi);   %Ideal impulse response
h=hd.*w;    %The filter coefficients
fvtool(h);
%omega=linspace(0,pi,512);
%mag=freqz(h,1,omega);
%plot(omega/pi,20*log10(abs(mag)))
%grid on;
