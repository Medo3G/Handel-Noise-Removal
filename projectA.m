clc ;
clf;
clear all ;

%[A]
load handel; %load the signal
%sound(y,Fs) %play the signal
T = 1/Fs;   %get periodic time
t = [0:1/Fs:(length(y)-1)/Fs]; %vector of time
figure(1) 
plot (t,y); %plot the signal against time

%[B]
L = length(y);% Number of samples
K = [0:L-1];  % Index k for the DFT X[k]
% Sample the signal and compute the DFT
Xk = T*fft(y,L);	
fk =K/(L*T); 
% Use fftshift() function on the DFT result to bring the zero -
% frequency to the middle . Also adjust vector fk for it.
Xk = fftshift (Xk);
fk = fk - 0.5 * Fs ;
% Graph the results (Magnitude)
figure(2)
stem (fk , abs(Xk),'r','*') 

%[C]
%downsampling by a factor of 2 without an anti-aliasing filter
d1 = downsample (y,2);
Fs1 =Fs/2; %adjusting the sampling rate
sound(d1, Fs1);

%[D]
%using an anti-aliasing filter then downsampling by a factor of 2
[num,den] = cheby1(5,1,0.45); %a simple Chenyshev filter
yfilt = filter(num, den, y) ; %processing through the anti-aliasing filter
d2 = downsample (yfilt,2);
Fs2 = Fs/2;  %adjusting the sampling rate
sound(d2, Fs2);

%[E]
%downsampling by a factor of 4 without an anti-aliasing filter
d3 = downsample (y,4);
Fs3 =Fs/4; %adjusting the sampling rate
sound(d3, Fs3);
%using an anti-aliasing filter then downsampling by a factor of 4
[num2,den2] = cheby1(5,1,0.23); %a simple Chenyshev filter
yfilt2 = filter(num2, den2, y) ; %processing through the anti-aliasing filter
d4 = downsample (yfilt2,4);
Fs4 = Fs/4;  %adjusting the sampling rate
sound(d4, Fs4);