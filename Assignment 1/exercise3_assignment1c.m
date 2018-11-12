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
figure('name', '1c');
hold on
plot(t, w1);
plot(t, w2);
plot(t, w3);
plot(t, w4);
legend({'Fundamental Wave', 'Third Harmonic', 'Fifth Harmonic', 'Harmonic Sum'});
hold off