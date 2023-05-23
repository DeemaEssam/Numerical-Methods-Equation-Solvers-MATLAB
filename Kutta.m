% User input for the function v
function_input = input('Enter the function v(t, y): ', 's');
% Replace special functions and symbols for mathematical expressions
v = strrep(strrep(strrep(strrep(strrep(function_input, '^', '**'), 'e', 'exp'), 'sin', 'sin'), 'cos', 'cos'), 'exp', 'exp');

% User input for other parameters
t0 = input('Enter the value of t: ');
y0 = input('Enter the value of y0: ');
h = input('Enter the step size: ');
n = input('Enter the number of steps: ');

% Call the runge_kutta_method function to obtain the t and y values
[t, y] = runge_kutta_method(v, t0, y0, h, n);

% Print the results in a table
fprintf('  t\t\t  y\n');
for i = 1:length(t)
    fprintf('%0.4f\t%0.4f\n', t(i), y(i));
end

% Plot the solution
plot(t, y, '-o')
xlabel('t')
ylabel('y')
title("Runge-Kutta's method")

function [t, y] = runge_kutta_method(v, t0, y0, h, n)
    t = [t0];
    y = [y0];

    for i = 1:n
        ti = t(i);
        yi = y(i);
        ti_plus_1 = ti + h;

        % Define the function v(t, y) using anonymous function
        v_func = @(t, y) eval(v);

        % Calculate the four intermediate values (k1, k2, k3, k4)
        k1 = h * v_func(ti, yi);
        k2 = h * v_func(ti + h/2, yi + k1/2);
        k3 = h * v_func(ti + h/2, yi + k2/2);
        k4 = h * v_func(ti + h, yi + k3);

        % Calculate the new y-value using the weighted average of the intermediate values
        yi_plus_1 = yi + (k1 + 2*k2 + 2*k3 + k4) / 6;

        % Append the new t and y values to the lists
        t = [t, ti_plus_1];
        y = [y, yi_plus_1];
    end
end
