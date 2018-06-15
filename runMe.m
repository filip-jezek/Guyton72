%% init
clear;
close all;
model_name = 'GuytonModel1972_R2015a';
% set the NID input from workspace
set_param([model_name '/Manual Switch142'], 'sw', '0');
set_param([model_name '/From Workspace'], 'commented', 'off');
% set the REK input from workspace
set_param([model_name '/Manual Switch143'], 'sw', '0');
set_param([model_name '/From Workspace1'], 'commented', 'off');

path = 'experiments\G72-'

% default input
NID_input = [0, 0.1];
REK_input = [0, 1];

% PROTOCOL A
% protocol_A

% RUN THE PROTOCOL C
% protocol_C

% RUN THE PROTOCOL D
protocol_D;

%% clean after use
% set the NID input
set_param([model_name '/Manual Switch142'], 'sw', '1');
set_param([model_name '/From Workspace'], 'commented', 'on');
% set the REK input
set_param([model_name '/Manual Switch143'], 'sw', '1');
set_param([model_name '/From Workspace1'], 'commented', 'on');
%  set the STH effect
set_param([model_name '/Manual Switch33'], 'sw', '1');