clear;
clc;
Wp=0.67*pi;
Ws=0.53*pi;     %Band-edge frequencies
Ap=0.3;
As=50;      %Attenuation
N=ceil(8*pi/(Wp-Ws));   %Determine the length of the filter
N=mod(N+1,2)+N;  %N is odd
M=N-1;  %Order of the filter
fprintf('N=%.0f\n',N); 
w=hamming(N)';  %Hamming window
Wc=(Wp+Ws)/2;    %Cut-off frequency
k=0:M;
hd=-(Wc/pi)*sinc(Wc*(k-0.5*M)/pi);   %Ideal impulse response     
hd(0.5*M+1)=hd(0.5*M+1)+1; 
h=hd.*w;    %The filter coefficients
fvtool(h);
%omega=linspace(0,pi,512);  %0-¦ÐÈ¡512¸öµã
%mag=freqz(h,1,omega);
%magdb=20*log10(abs(mag));
%plot(omega/pi,magdb);
%grid on;