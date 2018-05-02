%% resample

%% load data from csv or use the ReadData script
%   file = 'G72.csv';
%   data_raw_read = importdata(file,',',2);
%   time = data_raw_read.data(:,1);
%   data = data_raw_read.data(:,2:end);
%% expects time [X], data [X Y], header [Y]
  last = time(end);
  N = length(time);
  
  % up to t1 once per 1440
  t1 = 20160; 
  % up to t2 once per 360
  t2 = 30240;
  % up to t3 once per 360
  t3 = t1*2;
  % from here to end once per 10800
  
% ind1 = find(time > t1, 1);
% ind2 = find(time > t2, 1);
% ind3 = find(time > t3, 1);
% 
% si1 = (1:ind1);
% si2 = (ind1:ind2);
% si3 = (ind2:ind3);
% si4 = (ind3:N);

do1 = interp1(time, data, 1:1440:t1);
do2 = interp1(time, data, t1:360:t2);
do3 = interp1(time, data, t2:360:t3);
do4 = interp1(time, data, t3:10080:last);

timeo = [1:1440:t1, t1:360:t2, t2:360:t3, t3:10080:last];
datao = [do1; do2; do3; do4];

clf; hold on;
%plot(time(si1), data(si1, 1), '*')
plot(timeo, datao(:, 1:3), '-*')

%% write to file
csvfile = 'G72resampled-Na0_04.csv';

textHeader = strjoin(header, ',');
%write header to file
fid = fopen(csvfile,'w'); 
fprintf(fid,'%s\n',textHeader);
fclose(fid);


datapack = [timeo', datao];

%write data to end of file
dlmwrite(csvfile,datapack,'-append');

