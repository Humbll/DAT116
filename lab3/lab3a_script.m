lut4 = lutix(4)
lutd4 = lutdata(4);

lut15 = lutix(15);
lutd15 = lutdata(15);

plot(lut4, lutd4), hold on

figure()
plot(lut15, lutd15), hold on

sigspectrum(simout)

%%
bits = 14;
min_bits = 3;
SNR = zeros(1,bits-min_bits);

for b=min_bits:bits
    i = 2^b;
    sim lab3a.slx
    [freqs] = sigspectrum(simout, 'noplot');
    pow_sig = max(freqs);
    pow_noise = sum(freqs)-pow_sig;
    SNR(b-min_bits+1) = 10*log(pow_sig/pow_noise);
end

plot(min_bits:bits, SNR)

%%

amp = 1;
sim lab3b.slx
[freqs] = sigspectrum(simout, 'noplot');
pow_sig = max(freqs)

min_pow = -20;
max_pow = 3;
SNR = zeros(1, 2*(max_pow-min_pow)+1);

for i = 1:(1+2*(max_pow-min_pow))
    cur_pow = min_pow+(i-1)/2;
    amp = db2mag(cur_pow);
    sim lab3b.slx
    [freqs] = sigspectrum(simout, 'noplot');
    pow_sig = max(freqs);
    pow_noise = sum(freqs)-pow_sig;
    SNR(i) = pow2db(pow_sig/pow_noise);
end

x = min_pow:0.5:max_pow;
plot(x, SNR)

%%
N = 10;
%sim lab3c.slx
%sigview(simout)

min_pow = -20;
max_pow = 3;

x = min_pow:0.5:max_pow;
SNR = zeros(1, 2*(max_pow-min_pow)+1);

for a = 1:5
    figure()
    for i = 1:2
        ex_r2r = r2r(N, 0.02*i);
        for j = 1:(1+2*(max_pow-min_pow))
            cur_pow = min_pow+(j-1)/2;
            amp = db2mag(cur_pow);
            sim lab3c.slx
            [freqs] = sigspectrum(simout, 'noplot');
            pow_sig = max(freqs);
            pow_noise = sum(freqs)-pow_sig;
            SNR(j) = pow2db(pow_sig/pow_noise);
        end
        plot(x, SNR), hold on
    end
end

%%
close all
N = 10; f = 5; amp = 1;
sim lab3d.slx

sigview(simout);
freqs = sigspectrum(simout);
SNR = get_SNR(freqs)

f = f*10;
sim lab3d.slx
sigview(simout);
freqs = sigspectrum(simout);
SNR = get_SNR(freqs)
figure()

min_pow = -40;
max_pow = 3;
SNR = zeros(1, max_pow-min_pow+1);
pow_sig_v = zeros(1, max_pow-min_pow+1);
pow_noise_v = zeros(1, max_pow-min_pow+1);

for i = 1:(1+max_pow-min_pow)
    cur_pow = min_pow+(i-1);
    amp = db2mag(cur_pow);
    sim lab3d.slx
    [freqs] = sigspectrum(simout, 'noplot');
    pow_sig = max(freqs);
    pow_noise = sum(freqs)-pow_sig;
    pow_sig_v(i) = pow2db(pow_sig);
    pow_noise_v(i) = pow2db(pow_noise);
    SNR(i) = pow2db(pow_sig/pow_noise);
end
x = min_pow:max_pow;
plot(x, pow_sig_v), hold on
plot(x, pow_noise_v), hold off
figure()
plot(x, SNR)

function [SNR] = get_SNR(freqs)
    pow_sig = max(freqs);
    pow_noise = sum(freqs)-pow_sig;
    SNR = pow2db(pow_sig/pow_noise);
end

