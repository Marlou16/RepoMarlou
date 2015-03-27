function LD = link_density(G, varargin)
%LINK_DENSITY Computes the link density of a undirected, unweighted graph.
%   When only the graph G is given, the number of nodes and links are
%   calculated after which the link density is retrieved.
%   When calling link_density(G, L, N), the link density can be calculated
%   directly.

if (length(varargin) == 2)
    LD = varargin{1} / ( 0.5 * varargin{2} * (varargin{2}-1));  
else
    N = size(G,1);
    L = 0;
    for i = 1 : N
        for j = i+1 : N
            L = L + G(i,j);
        end
    end

    LD = L / (0.5 * N * (N-1));
end

end

