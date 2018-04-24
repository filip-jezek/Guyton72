%% save data to csv ang get some plotting fun
showG = false;
csvfile = 'G72.csv';

%% init
ds = Simulink.SimulationData.Dataset(logsout);
N = ds.numElements;
%% get the data into my struct
header{1} = 'Time';
X(:, 1) = ds.get(1).Values.Time;
for i = 2:N
    header{i} = ds.get(i-1).Name;
%     disp(header{i});
    X(:, i) = ds.get(i-1).Values.Data;
    if showG
        figure
        plot(ds.get(i-1).Values.Time, ds.get(i-1).Values.Data);
        title(ds.get(i-1).Name);
    end
end

%%
t1 = 20160;
t2 = 30240;
t3 = 40
s1 = 
clf;
hold on;
plot(X)

%%
textHeader = strjoin(header, ',');
%write header to file
fid = fopen(csvfile,'w'); 
fprintf(fid,'%s\n',textHeader);
fclose(fid);
%write data to end of file
dlmwrite(csvfile,X,'-append');

