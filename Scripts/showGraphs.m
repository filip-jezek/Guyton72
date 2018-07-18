function showGraphs(ds, plots, baseline, t0)

lp = length(plots);
figure;
clf;
for i = 1:lp
    datacurve = ds.getElement(plots{i});
    if isempty(datacurve)
        warning(['Element ' plots{i} ' not found in the model outputs']);
        continue;
    end
    vals = ds.getElement(plots{i}).Values;
    
    subplot(lp, 1, i);
%    t = (vals.Time - t0)/24/60;
    t = vals.Time;
    valid = t > t0;
    plot(t(valid), vals.Data(valid)/baseline(i)*100, '-b');
    title(plots(i));
    ylabel(['% change from baseline (' num2str(baseline(i)) ')']);
    xlabel('time [d]');
end
