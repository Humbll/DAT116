
%%
C = 10*10^-9;  
p1 = (0.22+3.05i)*10^4; 
p2 = (0.22-.05i)*10^4; 
p3 = (0.55+1.89i)*10^4; 
p4 = (0.55-1.89i)*10^4; 
% p1 = (0.6858)*10^4;  single pole


R = abs((1/C) * (1 / sqrt(p1 * p2)));
A = abs(3 + (p1 + p2) / sqrt(p1 * p2));

disp(A);
disp(R);

R2 = abs((1/C) * (1 / sqrt(p3 * p4)));
A2 = abs(3 + (p3 + p4) / sqrt(p3 * p4));
disp(A2);
disp(R2);

fs = 20e3;
Wp = 5*10^3;
Ws = 10.5*10^3;
Rp = 2;
Rs = 35;
% f = logspace(3, 5, 1000) ;

%% butter
[n,Wn] = buttord(Wp/fs,Ws/fs,Rp,Rs, 's')
[z,p,k] = butter(n,Wn);

%% cheby 1
[n1,a] = cheb1ord(Wp/fs,Ws/fs,Rp, Rs, 's') ;
[z1,p1,k1]   = cheby1(n1,Rp,Wp/fs);

%% cheby 2
[n2,a2]  = cheb2ord(Wp/fs,Ws/fs,Rp, Rs, 's') ;
[z2,p2,k2]   = cheby2(n2,Rp,Wp/fs);

% [b3,a3] = ellip(5,Rp,Rs,Wp/(fs/2),'s')


sys = zpk(z1,p1,k1)
% pzmap(sys)
splane(z1,p1)

w = logspace(0, log10(fs/2), 1000);
figure;
freqs(10*log(k1*z1), poly(p1), w);
title('Chebyshev Type I Filter Frequency Response');
xlabel('Frequency (Hz)');
ylabel('Magnitude (dB)');
grid on;


