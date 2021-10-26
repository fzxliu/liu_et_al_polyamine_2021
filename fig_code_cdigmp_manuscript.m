%% Making Figure 2
% import biofilm data manually as cv
cv(cv<0)=NaN;
cv(cv==0)=NaN;

%%
% ydata re-formatting, depends on the 96-well plate setup
% for example:
% ydata = [cv(:,1:3) cv(:,7) cv(:,4) cv(:,8) cv(:,5) cv(:,9) cv(:,6) ...
%     cv(:,10) cv(:,11) cv(:,12)];

[r, c] = size(ydata);

xdata = repmat(1:c, r, 1);
error=nanstd(ydata); %ignore NaN values
lower=nanmean(ydata)-error;
upper=nanmean(ydata)+error;

%%
scatter(xdata(:), ydata(:), 10, 'k','o','filled', 'jitter','on', 'jitterAmount', 0.2);

hold on;

plot([xdata(1,:)-0.2; xdata(1,:) + 0.2],...
    repmat(nanmean(ydata, 1), 2, 1), 'r-', 'LineWidth', 1.5);

plot([xdata(1,:);xdata(1,:)], [lower; upper], 'k-');

ylim([0 max(ydata(:)+0.05)]);

%%
wt_mean=nanmean(ydata(:,3));
plot([0 10],[wt_mean wt_mean], '--b', 'LineWidth',2)
hold off;

%% Making Figure 3a

% import data manually
cv_3a(cv_3a<0)=NaN;
cv_3a(cv_3a==0)=NaN;

%%
% ydata re-formatting, depends on the 96-well plate setup
% for Figure 3a, it is:
x3a_ctrl = [1:3 5 7 9 11];
x3a_put = [4 6 8 10 12];
ydata_3a = cv_3a;

[r, c] = size(ydata_3a);

xdata_3a = repmat(1:c, r, 1);

error=nanstd(ydata_3a); %ignore NaN values
lower=nanmean(ydata_3a)-error;
upper=nanmean(ydata_3a)+error;

%%
scatter(xdata_3a(:, x3a_ctrl), ydata_3a(:, 1:7), 7, ...
    'k','o','filled', 'jitter','on', 'jitterAmount', 0.2); hold on;
scatter(xdata_3a(:, x3a_put), ydata_3a(:, 8:12), 7, ...
    'b','^','filled', 'jitter','on', 'jitterAmount', 0.2);

plot([xdata_3a(1, x3a_ctrl)-0.2; xdata_3a(1, x3a_ctrl) + 0.2],...
    repmat(nanmean(ydata_3a(:, 1:7), 1), 2, 1), 'r-', 'LineWidth', 1.5);
plot([xdata_3a(1, x3a_put)-0.2; xdata_3a(1, x3a_put) + 0.2],...
    repmat(nanmean(ydata_3a(:, 8:12), 1), 2, 1), 'r-', 'LineWidth', 1.5);

plot([xdata_3a(1, x3a_ctrl); xdata_3a(1, x3a_ctrl)], ...
    [lower(:, 1:7); upper(:, 1:7)], 'k-');
plot([xdata_3a(1, x3a_put); xdata_3a(1, x3a_put)], ...
    [lower(:, 8:12); upper(:, 8:12)], 'k-');

xlim([0 13]);
ylim([0 max(ydata_3a(:)+0.1)]);

%% Making Figure 3b
% import data manually
cv_3b(cv_3b<0)=NaN;
cv_3b(cv_3b==0)=NaN;

%%
% ydata re-formatting, depends on the 96-well plate setup
% for Figure 3a, it is:
x3b_ctrl = [1:3 5];
x3b_arg = [4 6];
ydata_3b = cv_3b;

[r, c] = size(ydata_3b);

xdata_3b = repmat(1:c, r, 1);

error=nanstd(ydata_3b); %ignore NaN values
lower=nanmean(ydata_3b)-error;
upper=nanmean(ydata_3b)+error;

%%
scatter(xdata_3b(:, x3b_ctrl), ydata_3b(:, x3b_ctrl), 7, ...
    'k','o','filled', 'jitter','on', 'jitterAmount', 0.2); hold on;
scatter(xdata_3b(:, x3b_arg), ydata_3b(:, x3b_arg), 7, ...
    [0, 0.619, 0.451],'^','filled', 'jitter','on', 'jitterAmount', 0.2);

plot([xdata_3b(1,:)-0.2; xdata_3b(1,:) + 0.2],...
    repmat(nanmean(ydata_3b, 1), 2, 1), 'r-', 'LineWidth', 1.5);
plot([xdata_3b(1,:);xdata_3b(1,:)], [lower; upper], 'k-');

xlim([0 7]);
ylim([0 max(ydata_3b(:)+0.1)]);

