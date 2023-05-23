function taylorMethod()
    clc
    clear all

    % Prompt the user to enter the equation
    function_input = input('Enter the function v(x, y): ', 's');
    v = strrep(strrep(strrep(strrep(strrep(function_input, '^', '.^'), 'e', 'exp'), 'sin', 'sin'), 'cos', 'cos'), 'exp', 'exp');
    f = str2func(['@(x, y) ', function_input]);

    % Define the interval
    start = input('Enter the starting point for X: '); % starting point
    end_val = input('Enter the ending point for X: '); % ending point

    % Define the number of iterations
    num_iterations = input('Enter the number of iterations:'); % number of iterations

    % Calculate the step size
    step_size = (end_val - start) / num_iterations;

    % Discretize the interval
    x_vals = start:step_size:end_val;
    y_vals = zeros(size(x_vals));

    % Set the initial condition
    y_vals(1) = 0;

    % Solve the differential equation using Taylor's method
    fprintf('x        y \n');
    for i = 1:num_iterations
        f_val = f(x_vals(i), y_vals(i));
        diff_f = (f(x_vals(i) + step_size, y_vals(i)) - f_val) / step_size;
        y_vals(i+1) = y_vals(i) + step_size * f_val + (step_size^2/2) * diff_f;
        fprintf('%5.4f  %11.8f\n', x_vals(i), y_vals(i+1));
    end

    % Plot the results
    plot(x_vals, y_vals, '-o')
    xlabel('x')
    ylabel('y')
    title("Taylor's Method")
end
