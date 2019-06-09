clc ;
clf;
clear all ;
load handel_mix.mat  %load the signal
load Filter.mat %load the filters
load Filter2.mat
load Filter3.mat

t = [0:1/Fs:(length(y_m)-1)/Fs]; %vector of time
figure(1) 
plot (t,y_m); %plot the signal against time

T = 1/Fs;
L = length(y_m); % Number of samples
K = [0 :L-1]; % Index k for the DFT X[k]
% Sample the signal and compute the DFT
Xk = T*fft(y_m,L);
fk =K/(L*T); 
% Use fftshift() function on the DFT result to bring the zero -
% frequency to the middle . Also adjust vector fk for it.
Xk = fftshift (Xk);
fk = fk - 0.5 * Fs ;
% Graph the results (Magnitude)
figure(2)
stem (fk , abs(Xk),'r','*') 

%filter the signal using the fdatool filters
signal1 = filter (Filter, y_m);
signal2 = filter (Filter2, signal1);
signal = filter (Filter3, signal2);

T2 = 1/Fs;
L2 = length(signal); % Number of samples
K2 = [0 :L2-1]; % Index k for the DFT X[k]
% Sample the signal and compute the DFT
Xk2 = T2*fft(signal,L2);
fk2 =K2/(L2*T2); 
% Use fftshift() function on the DFT result to bring the zero -
% frequency to the middle . Also adjust vector fk for it.
Xk2 = fftshift (Xk2);
fk2 = fk2 - 0.5 * Fs ;
% Graph the results (Magnitude)
figure(3)
stem (fk , abs(Xk2),'r','*') 
sound(signal,Fs)
