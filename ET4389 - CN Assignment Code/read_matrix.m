function [G, N, L] = read_matrix(filename)

edgeMatrix = load(filename);
L = size(edgeMatrix, 1);    % L is the number of links..

% Finding the number of vertices is
% finding the vertice with the largest index.
N = 1;                      % N is the number of nodes.
for i = 1 : L
    if (edgeMatrix(i,1) > N)
        N = edgeMatrix(i,1);
    end
    if (edgeMatrix(i,2) > N)
        N = edgeMatrix(i,2);
    end
end

% Now we can create the connectivity matrix,
% Given that all edges are of weight one and undirected.
G = zeros(N);
for i = 1 : L
    G(edgeMatrix(i,1), edgeMatrix(i,2)) = 1;
    G(edgeMatrix(i,2), edgeMatrix(i,1)) = 1;
end

end

