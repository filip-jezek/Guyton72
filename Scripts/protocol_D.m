% protocol_A
stopTime = 60*24*(14+12);
times = [0, 1, 60*24*14];

NID_vals = [0.1, 0.1, 0.5];
REK_vals = [1, 1, 0.3];
NID_input = [times',NID_vals'];
REK_input = [times', REK_vals'];

result = sim(model_name, 'StopTime', num2str(stopTime), 'CaptureErrors', 'on', 'SaveOutput','on');

% Results: PA, HR, SVO, CO, TPR
plots = {'PA', 'HR',  'SVO', 'QLO'};
baseline = [100, 72.16, 0.07, 5.053];

showGraphs(result.logsout, plots, baseline, times(3));

% save the rsults
[time, data, header] = getData(result.logsout, false);
writeToFile([path 'D'], time, data, header);
