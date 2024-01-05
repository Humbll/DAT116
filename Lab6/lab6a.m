

sigview(out.sin)
arf = sigspectrum(out.sin);
sumarf = sum(arf);
[maxpow,~] = max(arf);
SNR = 10*log10(maxpow/(sumarf-maxpow));
noisepow = sumarf-maxpow;
    

%%

sigview(out.sinover)
arf = sigspectrum(out.sinover);
sumarf = sum(arf(1:1024));
[maxpow,sin_index] = max(arf);
SNRover = 10*log10(maxpow/(sumarf-maxpow));
noisepowover = sumarf-maxpow;
