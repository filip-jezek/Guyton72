%% init
clear;
close all;
model_name = 'GuytonModel1972_R2018';
% set the NID input from workspace
set_param([model_name '/Manual Switch142'], 'sw', '0');
path = 'experiments\G72-'

%% protocol C
lowsalt_mins = 60*24*7*2;
stopTime = 60*24*180;

% LOWSALT WITH STH EFFECT
NID_input = [0,0.1;lowsalt_mins, 0.0208];
set_param([model_name '/Manual Switch33'], 'sw', '1');
result = sim(model_name, 'StopTime', num2str(stopTime), 'CaptureErrors', 'on', 'SaveOutput','on');
resample(result.logsout, [path 'C-30mmolpd-STH-ON'], true);

% LOWSALT WITH STH FIXED
NID_input = [0,0.1;lowsalt_mins, 0.0208];
set_param([model_name '/Manual Switch33'], 'sw', '0');
result = sim(model_name, 'StopTime', num2str(stopTime), 'CaptureErrors', 'on');
resample(result.logsout, [path 'C-30mmolpd-STH-FIXED'], true);

% LOWER SALT WITH STH EFFECT
NID_input = [0,0.1;lowsalt_mins, 0.0104];
set_param([model_name '/Manual Switch33'], 'sw', '1');
result = sim(model_name, 'StopTime', num2str(stopTime), 'CaptureErrors', 'on');
resample(result.logsout, [path 'C-15mmolpd-STH-ON'], true);

% LOWER SALT WITH STH FIXED
NID_input = [0,0.1;lowsalt_mins, 0.0104];
set_param([model_name '/Manual Switch33'], 'sw', '0');
result = sim(model_name, 'StopTime', num2str(stopTime), 'CaptureErrors', 'on');
resample(result.logsout, [path 'C-15mmolpd-STH-FIXED'], true);


%% clean after use
% set the NID input
set_param([model_name '/Manual Switch142'], 'sw', '1');
%  set the STH effect
set_param([model_name '/Manual Switch33'], 'sw', '1');