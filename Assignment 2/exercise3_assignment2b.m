% Author: Mattia Limone
% Change the current folder to m file one
if(~isdeployed)
	cd(fileparts(which(mfilename)));
end
clc;	% Clear command window.
clear;	% Delete all variables.
close all;	% Close all figure windows except those created by imtool.
imtool close all;	% Close all figure windows created by imtool.
workspace;	% Make sure the workspace panel is showing.

A = 10;                                % Amplitude
fs = 44100;                            % Sampling frequency (Use 1/4*fs)
t = (0:1/fs:0.04);                     % Period of sound
F = 50;                                % Sine wave frequency (hertz)
% Original signal
y1 = A *sin(2 * pi * F/4 * t );
% Harmonics
y2 = round(A/3) *sin(2 * pi * round(A/3)* F/4 * t);
y3 = (A/5) *sin(2 * pi * (A/2)* F/4 * t);
% Chosen Wave
w = y1 + y2 + y3;

%Changin to Frequency Domain
fftw = fft(w)./numel(w);
fftw = fftshift(fftw);
plot(t,fftw);

%http://www1.cs.columbia.edu/~hgs/audio/44.1.html
%The answer is yes because of anti-aliasing filter sampling frequency
%higher than 40kHz must be used