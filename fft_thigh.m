clear all;
close all;
clc
THACC=dlmread('MT_00130431_011-001_2ndsquat_TH_CDM_AngularAcceleratation.txt');
% Assign delimited read text file, name of THACC. 
% Calculate starting point of 2nd squat
% SAcrum THigh and SHank motion data start at sample 19264. 
x=THACC(:,1);   % All values column 1, sample #
x=(x-19263);    % 2nd Squat_011-001.txt sample counter starts at 19264 
y=THACC(:,8);   % Column 8. Thigh angular acceleration in degrees/s/s
Fs = 100;       % Sampling frequency 100Hz
L=437;          % Length of signal 437 samples over 4.37 seconds, 
                % duration of the second squat.

Yaxis = fft(y); 
% Compute the Fast Fourier Transform (FFT) of the signal, 
% angular acceleration of the thigh during back squat.

P2 = abs(Yaxis/L);  
% The negative amplitudes of the signal 
% are made always positive, hence the absolute value or magnitude.
% Plot P1 the single sided spectrum based on P2, and the even
% valued length L.
                    
P1 = P2(1:L/2+1);   
% P2 being the double sided amplitude spectrum, 
% take one more element than half. 
% For odd numbers the result is half, (rounded down) plus 1.
% This ensures the DC component is retained.

P1(2:end-1) = 2*P1(2:end-1); 
% Two sided spectrum has energy split between negative and positive 
% frequencies on the frequency axis (X-axis).
% To convert frequency axis to single sided spectrum, discard the 
% negative half, and multiple every point on the remaining positive 
% side by two, to retain signal power. 
                                
f = Fs*(0:(L/2))/L; % Define frequency domain f, 
                    % based on Nyquist rate, (50Hz).
                    % Equals half of the sampling frequency
                    
plot(f,P1, 'r')     % P1 single sided spectrum in frequency domain.
                                    % Plot magnitude P1 against frequency f.
title('Single-Sided Amplitude Spectrum of X(t):-thigh ang-accel 437 samples')
xlabel('f (Hz)')
ylabel('|P1(f)|')
%axis tight



