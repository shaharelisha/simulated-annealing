function varargout = simulatedAnnealingPointPlotter(varargin)
% custom output function which plots the points for each iteration of the
% simulated annealing algorithm on a graph

optimValues = varargin{2};
flag = varargin{3};

x = optimValues.x;
fval = optimValues.fval;

varargout{1} = false;
varargout{2} = x;
varargout{3} = false;

switch flag
    case 'init'
        % draws a graph representing the function my_function
        figure('Name','Simulated Annealing Visualisation', ...
                'NumberTitle','off');

        x_range=[-3:.1:3];
        y_range=[-3:.1:3];

        [xx,yy] = meshgrid(x_range,y_range);
        z = my_function(xx, yy);
        surfc(xx, yy, z)
        view([-45 30])
        title('Simulated Annealing Visualisation');
        xlabel('X');
        ylabel('Y');
        zlabel('Z');
        colormap Pink
        hold on
        % adds the initial point to the graph
        scatter3(x(1),x(2), fval, 'blue', 'filled');
    case 'iter'
        % Adds a blue point on the graph based on the current iteration's
        % values of x (x(1)), y (x(2)), and z (fval).
        scatter3(x(1),x(2), fval, 'blue', 'filled');
        drawnow;
    case 'done'
        bestx = optimValues.bestx;
        bestfval = optimValues.bestfval;
        % Adds a red point on the graph, representing the best point found,
        % based on the best values found of x (bestx(1)), y (bestx(2)), 
        % and z (bestfval).
        scatter3(bestx(1),bestx(2),bestfval, 'red', 'filled')
        drawnow;
end
