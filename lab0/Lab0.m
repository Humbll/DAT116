%%%%%%%%%%%%%%LAB0%%%%%%%%%5

a = 1:10;
b = (1:10).^2;


figure
hold on
plot(a,b)
title('a and b')
xlabel('a values')
ylabel('b values') 
saveas(gcf, 'plots/plot.png');





    
arf = sigspectrum(out.foobarb)
arfsum = sum(arf)
arflength = length(arf)
averagearf = arfsum/arflength 
[maxarf,index] = max(arf)
snrarf= maxarf/averagearf

