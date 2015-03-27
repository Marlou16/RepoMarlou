function [ degreesER ] = ER_calculations (M, N ,p)

degreesER = zeros(M,N);

% Do here all the calculations per generated ER graph
% The generated graph will not be saved, calculated results are.
for i = 1 : M
    ERG = erdos_reyni(N, p);
    degreesER(i,:) = sum(ERG);
end

% Plot the histogram of the degree distributions,
% given all nodes of the generated ER graphs.
figure(1);
[nelements, centers] = hist(degreesER(:)', 0:max(degreesER));
bar(centers,nelements);
title('degree distribution of generated ER graphs');
xlabel('degree (d)');
ylabel('number of nodes with degree (d)');

end