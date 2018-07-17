function [time, data, header] = getData(ds, showG)

if showG
   figure();clf;hold on;
end

N = ds.numElements;
header{1} = 'Time';
X(:, 1) = ds.get(1).Values.Time;
for i = 2:N
    header{i} = ds.get(i-1).Name;

    X(:, i) = ds.get(i-1).Values.Data;
    if showG
        plot(ds.get(i-1).Values.Time, ds.get(i-1).Values.Data);
        title(ds.get(i-1).Name);
    end
end

time = X(:, 1);
data = X(:, 2:end);