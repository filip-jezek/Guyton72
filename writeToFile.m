function writeToFile(experiment_name, time, data, header)
%% write to file
csvfile = [experiment_name '.csv'];

textHeader = strjoin(header, ',');
%write header to file
fid = fopen(csvfile,'w'); 
fprintf(fid,'%s\n',textHeader);
fclose(fid);

datapack = [time, data];

%write data to end of file
dlmwrite(csvfile,datapack,'-append');