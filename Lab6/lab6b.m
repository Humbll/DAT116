


sigview(out.sin)
arf = sigspectrum(out.sin)
sumarf = sum(arf(1:128));
[maxpow,sin_index] = max(arf);
SNR = 10*log10(maxpow/(sumarf-maxpow));
noisepow = sumarf-maxpow;


% sigview(out.sinover)
% arf = sigspectrum(out.sinover)
% sumarf = sum(arf(1:128));
% [maxpow,sin_index] = max(arf);
% SNRover = 10*log10(maxpow/(sumarf-maxpow));
% noisepowover = sumarf-maxpow;
% 
% 


% arf1 = sum(arf(1))
% arf10 =sum(arf(10))
% arf100 =sum(arf(11:100))
% arf1000 =sum(arf(101:512))