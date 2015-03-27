function equation = PL_graphing(N, connections)
% Following the implementation of PLplot (folder B-A),
% we change minor things to work with a collection of B-A graphs.
% N is the number of nodes per B-A graph in the collection

% Initialize variable that will hold how many nodes have each degree
frequency = single(zeros(1,N));

% Initialize variable that will hold the graphing quanitites
plotvariables = zeros(2,N);
P = [];

for T = 1: N
    % Variable will be used as a list of possible degrees a node can have
    P(1,T) = T;
    if connections(1,T) ~= 0
        frequency(1,connections(1,T)) = frequency(1,connections(1,T)) + 1;
    end
end

for c = 1:length(frequency)
    % Disregard degrees with no frequency
    if frequency(1,c) ~= 0
       [X,Y] = find(plotvariables == 0);
       plotvariables(1,min(Y)) = P(1,c);
       plotvariables(2,min(Y)) = frequency(1,c);
    end
end

% Find the last non-zero element in plotvariables
for d = 1:length(plotvariables)
    if plotvariables(1,d) == 0 & plotvariables(2,d) == 0
        break
    end
end

x = plotvariables(1,1:d-1);
y = plotvariables(2,1:d-1);
[g,f,b] = fit(x',y','power1');
H = loglog(x,y,'r+');
hold on;
plot(g);
xlim([.9 (max(connections(:)) + 10)]);
ylim([.9 length(connections)]);
legend off;
H = xlabel('Degrees');
H = ylabel('Frequency');
% Use this feature to extract variables from cfit variables
%a = g.a;
%b = g.b;
%rsquare = f.rsquare;
equation = g;


end