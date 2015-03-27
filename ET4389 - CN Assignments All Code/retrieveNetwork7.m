% This script retrieves all necessary network metrics for network "7",
% for the ET4389 Complex Networks Assignment.
clc; clear;

% G is the adjacency matrix for the network, not sparse.
[G, N, L] = read_matrix('7.txt');

% Retrieving the average degree and gedree variance
[ED, VarD] = degree_calculations(G, 1);


% link density
p = link_density(G, L, N);

% for the assortativity, the matlab-networks-toolbox-master is used.
rhoD =  pearson(G);

% for the clustering coefficient, the matlab_bgl toolbox is used.
Call = clustering_coefficients(sparse(G));
Cgraph = sum(Call) / N;

% Average hop count and Diamater (maximum hop count)
% This function uses the matlab_bgl toolbox.
[EH, Hmax] = hop_count(G); 

% Spectral Radius
d = eigs(G);
lambda1 = d(1);

% for the algebraic connectivity,
% the matlab-networks-toolbox-master is used.
mu = algebraicConnectivity(G);