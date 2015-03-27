function [frequencies avClusterSizes] = cluster_calculations_BA(M, N, z)

for z = 1 : M
    
    z
    G = SFNG(N,3, line_graph(3));
    deleteSeq = randperm(N);

    removePerRound = floor(N / 100);
    totalRemoved = 0;

    [~, sizes] = components(sparse(G));
    frequencies(1) = 0;
    clusterSizes(z,1) = max(sizes);

    i = 2;
    while( (clusterSizes(z,i-1) > 1) && (totalRemoved <= N) )
       for j = 1 : removePerRound
           G(deleteSeq(totalRemoved+j),:) = 0;
           G(:,deleteSeq(totalRemoved+j)) = 0;
       end

       totalRemoved = totalRemoved + removePerRound; 

       frequencies(i) = (totalRemoved / N) * 100;
       [~, sizes] = components(sparse(G));
       clusterSizes(z,i) = max(sizes);
       i = i + 1;
    end
    
end

if (M > 1)
    avClusterSizes = sum(clusterSizes);
    avClusterSizes = avClusterSizes./M;
else
    avClusterSizes = clusterSizes;
end


plot(frequencies, avClusterSizes, '--b');

end