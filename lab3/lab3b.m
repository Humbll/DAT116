



% lutix4 = lutix(4)
% lutdata4 = lutdata(4)
% lutadata15 = lutdata(15)
% lutix15 = lutix(15)


% function lutixprint = quant(a) 
%     for i = 3:1:14
%         figure
%         hold on
%         plot(lutdata(i),lutix(i))
%         sigspectrum(sinout)
%     end
% end
% 


for i = 1:1:10
sim lab3bsim.slx
amplitude = i
[freqs] = sigspectrum(sinout)

end









