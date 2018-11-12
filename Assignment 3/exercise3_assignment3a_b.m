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


close all; clear all;


fs = 100;       % sampling frequency
f = 60;          % signal frequency
t = 2;          % time duration
n = [0:1/fs:t]; % sample vector

x = 2*sin(2*pi*f*n); % single tone signal
z = awgn(x,5);  % noisy signal
z_mags = abs(fft(z));
width = length(z);
sigma = 3;
kernel = gaussian_kernel(width,sigma);
kernel2 = gaussian_kernel(width,sigma)*-1;
x_filter = conv(z,kernel,'same');
x_filter2 = conv(z,kernel2,'same');

subplot(4,1,1); plot(n,z); title('Noisy Signal');
xlabel('Samples');
ylabel('Amplitude');
subplot(4,1,2); plot(z_mags); title('Magnitude Spectrum')
xlabel('DFT Bins');
ylabel('Magnitude');
subplot(4,1,3); plot(x_filter); title('LowPass Filter')
xlabel('Samples');
ylabel('Amplitude');
subplot(4,1,4); plot(x_filter2); title('HighPass Filter')
xlabel('Samples');
ylabel('Amplitude');


