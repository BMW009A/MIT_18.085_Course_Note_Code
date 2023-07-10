% Define the range of x1 and x2
x1 = linspace(-10, 10, 100);
x2 = linspace(-10, 10, 100);

% Create a meshgrid from x1 and x2
[X1, X2] = meshgrid(x1, x2);

% Compute the function values for each point in the meshgrid
Z = X1.^2 + 9*X1.*X2 + X2.^2;

% Create the 3D plot
figure;
surf(X1, X2, Z, 'EdgeColor', 'none');
hold on;

% Plot the point at (0, 0, 0)
scatter3(0, 0, 0, 'ko', 'LineWidth', 2);

title('$f(x_1, x_2) = x_1^2 + 9x_1x_2 + x_2^2$', 'Interpreter', 'latex');
xlabel('$x_1$', 'Interpreter', 'latex');
ylabel('$x_2$', 'Interpreter', 'latex');
zlabel('$f(x_1, x_2)$', 'Interpreter', 'latex');
