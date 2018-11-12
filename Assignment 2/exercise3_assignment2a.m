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

A = 10;                                       % Amplitude
fs = 44100;                                  % Sampling frequency (samples per second)
%dt = 1/fs;                                   % Seconds per sample
%StopTime = 0.25;                             % Seconds before stop
t = (0:1/fs:0.04);                     % Period of sound
F = 50;                                     % Sine wave frequency (hertz)
phase = 90;                                  % Phase in degree
phase_in_rad = deg2rad(phase);               % Phase in radiant

% Original signal
y1 = A *sin(2 * pi * F * t );
% Harmonics
y2 = round(A/3) *sin(2 * pi * round(A/3)* F * t);
y3 = (A/5) *sin(2 * pi * (A/2)* F * t);
% Frequency analysis
w1 = y1;
w2 = y2;
w3 = y3;
w4 = y1 + y2 + y3;

% Plot
figure('name', '2a.1');
hold on
plot(t, w1);
plot(t, w2);
plot(t, w3);
plot(t, w4);
legend({'Fundamental Wave', 'Third Harmonic', 'Fifth Harmonic', 'Harmonic Sum'});
hold off

%FFT
f1 = fft(w1)/numel(w1);
f1 = fftshift(f1);
f2 = fft(w2)/numel(w2);
f2 = fftshift(f2);
f3 = fft(w3)/numel(w3);
f3 = fftshift(f3);
f4 = fft(w4)/numel(w4);
f4 = fftshift(f4);

% Plot
figure('name', '2a.1');
subplot(4,1,1);plot(t, f1);title('Fundamental Wave');
subplot(4,1,2);plot(t, f2);title('Third Harmonic');
subplot(4,1,3);plot(t, f3);title('Fifth Harmonic');
subplot(4,1,4);plot(t, f4);title('Harmonic Sum');

%Amplitude is the size of the vibration, and this determines how loud 
%the sound is.  
%We have already seen that larger vibrations make a louder sound.

%Frequency is the speed of the vibration, and this determines the pitch of 
%the sound.  
%It is only useful or meaningful for musical sounds, where there is a 
%strongly regular waveform.

%Frequency Sampling is the times per second we sample the signal it must
%always be higher than 40kHz to give anti-aliasing filter enough space to
%work