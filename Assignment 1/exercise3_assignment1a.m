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
dt = 50/fs;                                  % Seconds per sample
StopTime = 1;                                % Seconds before stop
t = (0:dt:StopTime-dt)';                     % Period of sound
F = 100;                                     % Sine wave frequency (hertz)
phase = 90;                                  % Phase in degree
phase_in_rad = deg2rad(phase);               % Phase in radiant
y = A * sin(2 * pi * F * t + phase_in_rad);  % Sine wave created
sound(y);                                    % Reproducing sound
plot(y), xlabel('Time'), ylabel('Sine wave');% Plotting the wave


% A = the amplitude, the peak deviation of the function from zero.
% F = the ordinary frequency, the number of oscillations (cycles) 
% that occur each second of time.
% ? = 2*pi *F, the angular frequency, the rate of change of the function 
% argument in units of radians per second
% phase  = the phase, specifies (in radians) where in its cycle the oscillation is at t = 0.
% When phase is non-zero, the entire waveform appears to be shifted in time 
% by the amount phase/? seconds. A negative value represents a delay, 
% and a positive value represents an advance.