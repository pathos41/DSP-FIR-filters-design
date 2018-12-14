clear;
clc;
M=63;   %Order of the filter
Fp=0.5;
Fs=0.6; %Band-edge frequencies
h = firls(M,[0,Fp,Fs,1],[1,1,0,0]); %The filter coefficients
fvtool(h);
%w=linspace(0,pi,1000);
%mag=freqz(h,1,w);
%plot(w/pi,20*log10(abs(mag)));
%xlabel('Normalized frequency');
%ylabel('Gain, dB');
%ylim([-80,0]);