% protocol_D - salt loading experiment according to the NASA report

% when the steady state is reached
ss = 1e4; 
% ss = 2e4; 
% times = [initial, steady state, REK, NID, final]
times = [0, ss, ss + 2*60, ss + 60*96];
stopTime = ss + 60*192;

NID_vals = [0.1, 0.1, 0.1, 0.5];
REK_vals = [1, 1, 0.3, 0.3];
NID_input = [times',NID_vals'];
REK_input = [times', REK_vals'];

result = sim(model_name, 'StopTime', num2str(stopTime), 'CaptureErrors', 'on', 'SaveOutput','on');

% get the names of all elements
% getElementNames(result.logsout)
% Results: PA, HR, SVO, CO, TPR
plots = {'REK', 'NID', 'VEC', 'VB', 'QLO', 'PA', 'HR', 'ANC', 'VUD', 'AU'};
%baseline = [154, 71.72, 0.06878, 4.933];
%baseline = [100.32, 72.16, 0.0678, 4.89];
baseline = 100*ones(1, length(plots));

showGraphs(result.logsout, plots, baseline, 0);

% save the rsults
[time, data, header] = getData(result.logsout, ss, plots, false);
writeToFile([path 'D'], time, data, header);
