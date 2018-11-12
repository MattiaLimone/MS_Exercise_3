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


[myRecording , fs] = audioread('sound.wav');
N=5;

for i=1:N
    if i == 1
    h(i,:) = [N zeros(1,5000)];
    else
    h(i,:) = [N/((N)*(i/2)) zeros(1,5000)];
    end
end

%h1 =[6 zeros(1,5000)];
%h2 =[1 zeros(1,5000)];
%h3 =[0.5 zeros(1,5000)];
%h4 =[0.2 zeros(1,5000)];
hh=[h(1,:) h(2,:)];
for i= 3:N
    hh=[hh h(i,:)];
end
%h=[h1 h2];
%hh=[h h3];
%hp=[hh h4];


z=conv(myRecording,hh);
subplot(2,1,1);plot(myRecording);
subplot(2,1,2);plot(z);
sound(z);