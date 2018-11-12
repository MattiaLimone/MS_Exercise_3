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

[x, fs] = audioread('music.wav');
subplot(2,1,1);plot(x);title('Original Sound');
delay = 30;
range = 15;
sweep_freq =-0.5;
for i = 1:length(x)-delay-range
    sinusoid = round(range*sin(2*pi*i*sweep_freq/fs));
    %total delay which depends on an outside oscillator (sinusoid)
    y(i) = x(i) +x(i+delay+round(range*sin(2*pi*i*sweep_freq/fs)));
end

subplot(2,1,2);plot(y); title('Flanger effect');


