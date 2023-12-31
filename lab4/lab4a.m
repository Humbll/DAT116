
%%
C = 10*10^-9;  
p1 = (-0.22+3.05i)*10^4; 
p2 = (-0.22-3.05i)*10^4; 
p3 = (-0.55+1.89i)*10^4; 
p4 = (-0.55-1.89i)*10^4; 
% p5 = (0.6858)*10^4;  single pole


R = ((1/C) * (1 / sqrt(p1 * p2)));
A = abs(3 + (p1 + p2) / sqrt(p1 * p2));

disp(A);
disp(R);

R2 = ((1/C) * (1 / sqrt(p3 * p4)));
A2 = abs(3 + (p3 + p4) / sqrt(p3 * p4));
disp(A2);
disp(R2);
    
%%
fs = 21e3;
fn = fs/2
Wp = 2*pi*5.2*10^3;
Ws = 2*pi*10.10080*10^3;
Rp = 2;
Rs = 35;
f = logspace(3, 5, 1000) ;

%% butter
[n,Wn] = buttord(Wp,Ws,Rp, Rs, 's') ;
[z,p,k] = butter(n,Wn,'s');
title('Pole-zero response Butterworth');
splane(z/1000,p/1000)
%% cheby 1
[n1,a] = cheb1ord(Wp,Ws,Rp, Rs, 's') ;
[z1,p1,k1]  = cheby1(n1,Rp,Wp,'s');
title('Pole-zero response Cheby');
splane(z1/1000,p1/1000)
%% cheby 2
[n2,a2]  = cheb2ord(Wp,Ws,Rp, Rs, 's') ;
[z2,p2,k2]   = cheby2(n2,Rp,Wp,'s');
title('Pole-zero response Cheby');
splane(z2/1000,p2/1000)
%% ellip
[n3,a3] = ellipord(Wp,Ws,Rp,Rs,'s');
[z3,p3,k3]  = ellip(n3,Rp,Rs,Wp,'s')
title('Pole-zero response ellip')
splane(z3/1000,p3/1000)
%%
hold on
sys = zpk(z1,p1,k1)
[Num, Den]=tfdata(sys)
[top,down] = zp2tf(z1,p1,k1);


w = logspace(3, 6, 1000);  % Adjusted frequency range from 1 Hz to 100 kHz
[h1, w1] = freqs(top, down, w);
plot(w1/(2*pi), mag2db(abs(h1)));
set(gca, 'XScale', 'log'); 
grid on;
xlabel('Frequency (Hz)');
ylabel('Magnitude (dB)');
title('Frequency Response');
%%
C = 10*10^-9;  
p1 = (-0.8273 + 1.2964i)*10^4; 
p2 = (-0.8273 - 1.2964i)*10^4; 
p3 = (-0.3427 + 3.1299i)*10^4; 
p4 = (-0.3427 - 3.1299i)*10^4; 


R = ((1/C) * (1 / sqrt(p1 * p2)));
A = abs(3 + (p1 + p2) / sqrt(p1 * p2));

disp(A);
disp(R);

R2 = ((1/C) * (1 / sqrt(p3 * p4)));
A2 = abs(3 + (p3 + p4) / sqrt(p3 * p4));
disp(A2);
disp(R2);
    
%%


mag = abs(h);
phase = angle(h);
phasedeg = phase*180/pi;

subplot(2,1,1)
loglog(w,mag2db(mag))
grid on
xlabel('Frequency (rad/s)')
ylabel('Magnitude')

subplot(2,1,2)
semilogx(w,phasedeg)
grid on
xlabel('Frequency (rad/s)')
ylabel('Phase (degrees)')
% 
% 
% % title('Chebyshev Type 2 Filter Frequency Response');
% % xlabel('Frequency (Hz)');
% % ylabel('Magnitude (dB)');
% % grid on;
