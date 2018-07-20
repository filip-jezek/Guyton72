function [time, data, headers] = getData(ds, t0, selectedHeaders, showG)

if nargin < 3
    t0 = 0;
    selectedHeaders = {};
end



if showG
   figure();clf;hold on;
end

N = ds.numElements;
header{1} = 'Time';

t0s = find(ds.get(1).Values.Time >= t0);
if length(t0s) > 1
    it0 = max(t0s(1)-1, 1);
else
    it0 = 1;
end

X(:, 1) = ds.get(1).Values.Time-t0;

if ~isempty(selectedHeaders) 
    selectedHeadersPos = [];
else
    selectedHeadersPos = 2:N;
end
for i = 2:N
    header{i} = ds.get(i-1).Name;
    if ~isempty(selectedHeaders) && any(strcmp(selectedHeaders,header{i})) 
        % if we select some headers only and they are not in the set, then
        selectedHeadersPos = [selectedHeadersPos, i];
    end
    X(:, i) = ds.get(i-1).Values.Data;
    if showG
        plot(ds.get(i-1).Values.Time, ds.get(i-1).Values.Data);
        title(ds.get(i-1).Name);
    end
end


    
time = X(it0:end, 1);
data = X(it0:end, selectedHeadersPos);
headers = header([1, selectedHeadersPos]);