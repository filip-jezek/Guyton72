%% save data to csv ang get some plotting fun
showG = false;
csvfile = 'G72.csv';

%% init
% ds = Simulink.SimulationData.Dataset(logsout);
file = 'g72 low salt non-oscillating.mat';
% file = 'g72 lower salt oscillating.mat';
% file = 'g72 lower salt oscillating.mat';
raw_read = load(file);
ds = raw_read.ds;
% ds = raw_read;

%% get the data into my struct
N = ds.numElements;
header{1} = 'Time';
X(:, 1) = ds.get(1).Values.Time;
for i = 2:N
    header{i} = ds.get(i-1).Name;

    X(:, i) = ds.get(i-1).Values.Data;
    if showG
        figure
        plot(ds.get(i-1).Values.Time, ds.get(i-1).Values.Data);
        title(ds.get(i-1).Name);
    end
end

time = X(:, 1);
data = X(:, 2:end);

%% WRite data
textHeader = strjoin(header, ',');
%write header to file
fid = fopen(csvfile,'w'); 
fprintf(fid,'%s\n',textHeader);
fclose(fid);
%write data to end of file
dlmwrite(csvfile,X,'-append');

