
hold on 
sigview(out.sin);

% 
% sigview(out.inputsin);
%  sigview(out.sin);
% %sigspectrum(out.sin, out.inputsin);
% unfarf = sigspectrum(out.inputsin);
% arf = sigspectrum(out.sin);


sumarf = sum(arf(1:128));
[maxpow,sin_index] = max(arf);
SNRperfect = 10*log10(maxpow/(sumarf-maxpow));

sumarf = sum(arf);
[maxpow,sin_index] = max(arf);
SNR = 10*log10(maxpow/(sumarf-maxpow));
noisepow = sumarf-maxpow;
% 
% %%
%  plot(1:7, SNR(1:7))
% % % 


