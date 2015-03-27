figure(1);
hold on;

cluster_calculations_ER(100,379,0.0128);
cluster_calculations_BA(100,379,3);
cluster_calculations_N7(100);

legend('ER', 'BA', 'N7');
title('relative largest clusters sizes removing random nodes');
xlabel('percentage of removed nodes');
ylabel('size of largest connected component');

hold off;