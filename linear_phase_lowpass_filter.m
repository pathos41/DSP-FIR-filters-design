clear;
clc;
M=63;   %Order of the filter
J=(M-1)/2;  %Type 2
Wp=0.5*pi;
Ws=0.6*pi;  %Band-edge frequencies
Np=100;
Ns=100; %Number of points
weightp=1;
weights=1;  %Weights of passband and stopband respectively
WpN=linspace(0,Wp,Np);
WsN=linspace(Ws,pi-0.05,Ns);
Wm=[WpN,WsN]';
d=[ones(1,Np) ,zeros(1,Ns)]';
W=diag([weightp*ones(1,Np),weights*ones(1,Ns)]);
a=0:J;
C=cos(Wm*a);
Q=diag(cos(Wm*0.5));
g=(W*Q*C)\(W*d);
g=g';
h=(g(J:-1:2)+g(J+1:-1:3))/4;
h=[g(J+1)/4,h,g(1)*0.5+g(2)/4];
h=[h,fliplr(h)];    %Symmetric
fvtool(h);
%W=linspace(0,pi-0.1,512);
%H=freqz(h,1,W);
%plot(W/pi,20*log10(abs(H)));
%xlabel('Normalized Frequency');
%ylabel('Gain[dB]');
%ylim([-80,0]);