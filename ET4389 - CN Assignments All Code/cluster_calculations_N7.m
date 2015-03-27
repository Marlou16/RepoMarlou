function [frequencies avClusterSizes] = cluster_calculations_N7(M)

for m = 1 : M
    
    [G, N, ~] = read_matrix('7.txt');
    deleteSeq = randperm(N);

    removePerRound = floor(N / 100);
    totalRemoved = 0;

    [~, sizes] = components(sparse(G));
    frequencies(1) = 0;
    clusterSizes(m,1) = max(sizes);

    i = 2;
    while( (clusterSizes(m,i-1) > 1) && (totalRemoved <= N) )
       for j = 1 : removePerRound
           G(deleteSeq(totalRemoved+j),:) = 0;
           G(:,deleteSeq(totalRemoved+j)) = 0;
       end

       totalRemoved = totalRemoved + removePerRound; 

       frequencies(i) = (totalRemoved / N) * 100;
       [~, sizes] = components(sparse(G));
       clusterSizes(m,i) = max(sizes);
       i = i + 1;
    end
    
end

if (M > 1)
    avClusterSizes = sum(clusterSizes);
    avClusterSizes = avClusterSizes./M;
else
    avClusterSizes = clusterSizes;
end


plot(frequencies, avClusterSizes, '-.g');

end