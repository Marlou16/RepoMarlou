function seed = line_graph(m)
% Creates a simple (undirected) line graph of 'm' nodes which can be used 
% as a seed for the B-A graph that needs a seed of size 'm'

seed = zeros(m,m);

seed(1,2) = 1;          % starting point
seed(m,m-1) = 1;        % ending point

for i = 2 : m-1
   seed(i, i-1) = 1;    % from start of the line
   seed(i, i+1) = 1;    % toward end of the line
end

end