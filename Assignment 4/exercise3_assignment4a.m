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
fs = 100;                                  % Sampling frequency (samples per second)
dt = 1/fs;                                   % Seconds per sample
StopTime = 0.05;                             % Seconds before stop
t = (0:1/fs:1)';                       % Period of sound
F = 60;                                     % Sine wave frequency (hertz)

% Original signal
signal = A *sin(2 * pi * F * t );
delayKernel = [0 1 0]; % 1 must not be the center element.
delayedSignal = conv(signal, delayKernel);
%% Test delay
sound(signal)
sound(delayedSignal)
%% Plotting
hold on
plot(signal)
plot(delayedSignal)
hold off