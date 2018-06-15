function showGraphs(ds, plots, baseline, t0)

lp = length(plots);
figure;
clf;
for i = 1:lp
    vals = ds.getElement(plots{i}).Values;
    subplot(lp, 1, i);
    t = (vals.Time - t0)/24/60;
    plot(t, vals.Data/baseline(i)*100, '-b');
    title(plots(i));
    ylabel(['% change from baseline (' num2str(baseline(i)) ')']);
    xlabel('time [d]');
end
