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

A = 0.3;                                     % Amplitude
fs = 44100;                                  % Sampling frequency (samples per second)
dt = 1/fs;                                   % Seconds per sample
StopTime = 0.25;                             % Seconds before stop
t = (0:dt:StopTime-dt)';                     % Period of sound
F = 50;                                      % Sine wave frequency (hertz)
phase = 90;                                  % Phase in degree
phase_in_rad = deg2rad(phase);               % Phase in radiant
y = A * sin(2 * pi * F * t + phase_in_rad);  % Sine wave created
y1 = square(2*pi*F*t);                       % Square Wave
y2 = sawtooth(2*pi*F*t);                     % Sawtooth Wave
y3 = sawtooth(cos(2*pi*F*t));                % Concave Wave

figure('name', '1d');
subplot(4,1,1); plot(t,y)
subplot(4,1,2);plot(t,y1)
subplot(4,1,3);plot(t,y2)
subplot(4,1,4);plot(t,y3)