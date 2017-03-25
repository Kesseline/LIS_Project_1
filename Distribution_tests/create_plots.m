% Create various plots in order to find similarity of y-data with certain
% distributions

load('../data/train.mat');
% Shift data to obtain positive values only
ys = y  + max(-min(y) + 50, 50);

dists = {'normal', 'exponential', 'extreme value', 'half normal' ...
    'lognormal', 'logistic', 'loglogistic', 'rayleigh', 'weibull'};


for i = 1:9
    subplot(3,3,i);
    probplot(dists{i},ys);
    title(dists{i});
    set(gca, 'XTick', [], 'YTick', []);
end

print('distribution_plots', '-depsc');
