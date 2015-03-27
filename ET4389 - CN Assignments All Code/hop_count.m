function [ EH Hmax ] = hop_count(G)
%HOP_COUNT Calculates that average hopcount and diamater of graph G

distanceMatrix = all_shortest_paths(sparse(G));
N = size(G, 1);

% a different way to calculate this is as follows
% EH = sum(sum(distanceMatrix)) / (N * (N-1));
% Because in the double sum of the distanceMatrix,
% both directions are summed, we get rid of the 0.5 in the denominator.
EH = sum(sum(distanceMatrix)) / (N*(N-1));

% The first max calculates the max hopcount per node,
% the second the max hopcount (thus diameter) over all nodes.
Hmax = max(max(distanceMatrix));

end

