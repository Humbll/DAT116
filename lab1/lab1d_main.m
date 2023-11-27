close all
sigview(sinfiltered)
arf = sigspectrum(sinfiltered);
sumarf = sum(arf) 
[max_pow,sin_index] = max(arf);
SNR = 10*log10(max_pow / (sumarf-max_pow))
max_pow
noise_pow = sumarf-max_pow

arf_f = sigspectrum(sin_filtered);
sumarf_f = sum(arf_f);
[max_pow_f,sin_f_index] = max(arf_f);
SNR_f = 10*log10(max_pow_f / (sumarf_f-max_pow_f))
max_pow_f
noise_pow_f = sumarf_f-max_pow_f