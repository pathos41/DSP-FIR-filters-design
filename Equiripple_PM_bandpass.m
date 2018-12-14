clear;
clc;
Fs1=0.2;
Fp1=0.3;
Fp2=0.6;
Fs2=0.7;    %Band-edge frequencies
f=[Fs1,Fp1,Fp2,Fs2];
a=[0,1,0];  %Amplitude
Rp=0.1;
Rs=0.01;    %Peak approximation errors
dev=[Rs,Rp,Rs]; 
[M,fo,ao,w] = firpmord(f,a,dev);    %Get the order of the filter
h = firpm(M,fo,ao,w);   %The filter coefficients
fvtool(h);
%w=linspace(0,pi,1000);
%mag=freqz(h,1,w);
%plot(w/pi,20*log10(abs(mag)));
%xlabel('Normalized frequency');
%ylabel('Gain, dB');