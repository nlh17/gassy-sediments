%read_plot 01-30-24

clear all;
close all;
myFolder = '240130152103';
filePattern = fullfile(myFolder, '*.mat');
filenames = dir(filePattern);

for idx = 1:length(filenames)
   baseFileName = filenames(idx).name;
   x = importdata(baseFileName);
   for ii = 1:length(x)
       ch1(idx,ii) = x(ii,1);
       ch2(idx,ii) = x(ii,2);
%        ch3(idx,ii) = x(ii,3);
   end
end

ch1 = reshape(ch1,1,[]);
ch2 = reshape(ch2,1,[]);
% ch3 = reshape(ch3,1,[]);

Fs = 102400; %102400 Hz = 102.4 kHz
% Fs = 15000;
T = 1/Fs;
L = length(ch1);
% L = 256;
t = (0:L-1)*T;
f = Fs*(0:(L/2))/L;
sensitivity = -165.6;
ch1 = ch1.*(10^(sensitivity/20)).*(10^6);
ch2 = ch2.*(10^(sensitivity/20)).*(10^6);

plot(t,ch1);
xlabel('Time (s)'); ylabel('Pressure (Pa)');
title('HTI 94-SSQ 606007: squeeze, Fs = 102.4kHz');

