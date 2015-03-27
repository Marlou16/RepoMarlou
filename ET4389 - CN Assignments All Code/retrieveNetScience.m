% This script retrieves all necessary network metrics for the
% NetScience Network, where no degree distribution need to be plot.
% More comment on the steps, see retrieveNetwork7
clc; clear;

[G, N, L] = read_matrix('NetScience.txt');
[ED, VarD] = degree_calculations(G, 0);
LD = link_density(G, L, N);
rhoD =  pearson(G);
Call = clustering_coefficients(sparse(G));
Cgraph = sum(Call) / N;
[EH, Hmax] = hop_count(G); 
d = eigs(G);
lambda1 = d(1);
mu = algebraicConnectivity(G);
