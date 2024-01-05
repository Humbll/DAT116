
close all

%  % sigview(out.inputsin);
% % sigview(out.sin1);
% 
% hold on 
% sigspectrum(out.sin);
% sigspectrum(out.sin1);
sigspectrum(out.sin, out.sin1);
sigview(out.sin, out.sin1);
x = 1 / (10/(1024*32))


