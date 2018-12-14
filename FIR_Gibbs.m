clear;
clc;
Wp=0.55*pi; 
Ws=0.45*pi;     %Band-edge frequencies
Ap=1; 
As=25;  %Attenuation
N=ceil(8*pi/(Wp-Ws));   %Determine the length of the filter
N=mod(N+1,2)+N; %N is odd
M=N-1;  %Order of the filter
w=hamming(N);   %Hamming window
Wc=(Wp+Ws)/2;   %Cut-off frequency
k=0:M;
hd=-(Wc/pi)*sinc(Wc*(k-0.5*M)/pi); %Ideal impulse response
h=hd'.*w;   %The filter coefficients
omega=linspace(0,pi,512);
mag=freqz(h,1,omega);
magdb=abs(mag);
plot(omega/pi,magdb);
grid on;

W=Ws-Wp;
M1=8;
k2=-M1:M1;  %Length of the rectangular window
Wc=(Wp+Ws)/2;   %Cut-off frequency
hd=sinc(W*k2/2).*(sin(Wc*k2)./(k2.*pi));    %Gradually-changed transition region
hd(M1+1)=Wc/pi;
omega2=linspace(0,pi,512);
mag2=freqz(hd,1,omega2);
magdb2=abs(mag2);
hold on;
plot(omega2/pi,magdb2,'r');
xlabel('Normalized Frequency');
ylabel('Magnitude');