function [ degreesBA, fit ] = BA_calculations(M, N, m)
   
degreesBA = zeros(M,N);

% Because SFNG works with a seed, we create the smallest seed possible,
% namely a line graph of 3 nodes.
seed = line_graph(m);

for i = 1 : M
    BA = SFNG(N, m, seed);
    degreesBA(i, :) = sum(BA);
end

fit = PL_graphing(N, degreesBA);

end