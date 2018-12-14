clear;
clc;
Fp=0.5;
Fs=0.6;     %Band-edge frequencies
ds=0.0017;
dp=ds;  %Peak approximation errors
f=[Fp,Fs];
a=[1,0];    %Amplitude
dev=[dp,ds];
[M,fo,ao,w] = firpmord(f,a,dev);    %Get the order of the filter
h = firpm(M,fo,ao,w);   %The filter coefficients
fvtool(h);
%w=linspace(0,pi,1000);
%mag=freqz(h,1,w);
%plot(w/pi,20*log10(abs(mag)));
%xlabel('Normalized frequency');
%ylabel('Gain, dB');
%ylim([-80,20]);