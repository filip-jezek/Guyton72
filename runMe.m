%% init
clear;
close all;
model_name = 'GuytonModel1972_R2018';
% set the NID input from workspace
set_param([model_name '/Manual Switch142'], 'sw', '0');
path = 'experiments\G72-'

% default input
NID_input = [0, 0.1];

% PROTOCOL A
protocol_A

% RUN THE PROTOCOL C
% protocol_C

%% clean after use
% set the NID input
set_param([model_name '/Manual Switch142'], 'sw', '1');
%  set the STH effect
set_param([model_name '/Manual Switch33'], 'sw', '1');