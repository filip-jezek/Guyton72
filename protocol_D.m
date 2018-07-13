% protocol_A
stopTime = 60*24*(10*360+12);
times = [0, 60*24*14, 60*24*(10*360)];

NID_vals = [0.1, 0.1, 0.5];
REK_vals = [1, 0.3, 0.3];
NID_input = [times',NID_vals'];
REK_input = [times', REK_vals'];

result = sim(model_name, 'StopTime', num2str(stopTime), 'CaptureErrors', 'on', 'SaveOutput','on');

% Results: PA, HR, SVO, CO, TPR
plots = {'PA', 'HR',  'SVO', 'QLO'};
baseline = [154, 71.72, 0.06878, 4.933];
% baseline = [100, 72.16, 0.07, 5.053];

showGraphs(result.logsout, plots, baseline, times(3));

% save the rsults
[time, data, header] = getData(result.logsout, false);
writeToFile([path 'D'], time, data, header);
