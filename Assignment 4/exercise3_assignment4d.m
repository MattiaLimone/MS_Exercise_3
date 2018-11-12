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

A = 1;
t= 0:0.1:10*pi;
% Simple sine wave to show good
%x = A*sin(t );
[x, fs] = audioread('music.wav');
y = distortion(-0.7234,x);
z = distortion(0.8532,x);



subplot(3,1,1);plot(x);title('Original Sound');
subplot(3,1,2);plot(y);title('Distortion effect');
subplot(3,1,3);plot(z);title('More distortion effect');


