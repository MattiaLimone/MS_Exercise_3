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

A = 1;                                       % Amplitude
fs = 44100;                                  % Sampling frequency (samples per second)
dt = 1/fs;                                  % Seconds per sample
StopTime = 0.25;                                % Seconds before stop
t = (0:dt:StopTime-dt)';                     % Period of sound
F = 100;                                     % Sine wave frequency (hertz)
phase = 90;                                  % Phase in degree
phase_in_rad = deg2rad(phase);               % Phase in radiant
%Adding random noise
y = A * sin(2 * pi * F * t + phase_in_rad);  % Sine wave created
y = y + randn(size(y));                      % Adding Noise Type1
sound(y);                                    % Reproducing sound
figure('name', '1b.1');
plot(y), xlabel('Time'), ylabel('Sine wave');% Plotting the wave
%Pause
pause(3)
%Add white Gaussian noise to signal
y = A * sin(2 * pi * F * t + phase_in_rad);  % Sine wave created
SNR=15;                                      % Signal to Noise Ratio
z=awgn(y,SNR,'measured');                    % Adding Noise Type2
sound(z);                                    % Reproducing sound
figure('name', '1b.2');
plot(z), xlabel('Time'), ylabel('Sine wave');% Plotting the wave
