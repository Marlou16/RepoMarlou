function [ ED, VarD ] = degree_calculations(G, plot)
% DEGREE_CALCULATIONS returns the average degree and degree variance
%   Given that G is a undirected, unweighted graph.

N = size(G,1);

degreeVector = sum(G);
ED = sum(degreeVector) / N;
VarD = var(degreeVector);

% If ( plot == 1), it is needed to plot the degree distribution,
% both in normal and loglog scale.
% If from the plots there can be concluded that a Power Law distribution
% occurs, this script needs to be expanded to calculate gamma.
if (plot == 1) 
    
    %     eventually not used.
    %     plotNodeDegreeDistrib(G,'plotType', 'loglog');

    % histogram plot
    figure(1);
    [nelements, centers] = hist(degreeVector, 0:max(degreeVector));
    bar(centers,nelements);
    title('degree distribution of network "7"');
    axis([0 35 0 80]);
    xlabel('degree (d)');
    ylabel('number of nodes with degree (d)');

    % loglog plot
    figure(2);
    loglog(centers, nelements);
    title('degree distribution on the loglog scale');
    xlabel('degree (d)');
    ylabel('number of nodes with degree (d)');
    
end

end



