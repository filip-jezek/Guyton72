% protocol_A
stopTime = 383040;
times = [0, 20160, 30240];

NID_vals = [0.125, 0.0208, 0.1875];
NID_input = [times',NID_vals'];

set_param([model_name '/Manual Switch33'], 'sw', '1');
result = sim(model_name, 'StopTime', num2str(stopTime), 'CaptureErrors', 'on', 'SaveOutput','on');
resample(result.logsout, [path 'A-180-30-270-STH-NORMAL'], true);

set_param([model_name '/Manual Switch33'], 'sw', '0');
result = sim(model_name, 'StopTime', num2str(stopTime), 'CaptureErrors', 'on', 'SaveOutput','on');
resample(result.logsout, [path 'A-180-30-270-STH-FIXED'], true);

NID_vals = [0.125, 0.04, 0.1875];
NID_input = [times',NID_vals'];

set_param([model_name '/Manual Switch33'], 'sw', '1');
result = sim(model_name, 'StopTime', num2str(stopTime), 'CaptureErrors', 'on', 'SaveOutput','on');
resample(result.logsout, [path 'A-180-58-270-STH-NORMAL'], true);

set_param([model_name '/Manual Switch33'], 'sw', '0');
result = sim(model_name, 'StopTime', num2str(stopTime), 'CaptureErrors', 'on', 'SaveOutput','on');
resample(result.logsout, [path 'A-180-58-270-STH-FIXED'], true);

% clean
%  set the STH effect
set_param([model_name '/Manual Switch33'], 'sw', '1');