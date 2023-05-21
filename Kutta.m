% Define the differential equation
function_input = input('Enter the function v(t, y): ', 's');
v = strrep(strrep(strrep(strrep(strrep(function_input, '^', '.^'), 'e', 'exp'), 'sin', 'sin'), 'cos', 'cos'), 'exp', 'exp');
f = str2func(['@(t, y) ', function_input]);

% Define the initial condition and step size
t0 = input('Enter the value of t0: ');
y0 = input('Enter the value of y0: ');
h = input('Enter the value of h: ');

% Define the number of steps to take
n = input('Enter the number of steps: ');

% Initialize arrays to store the solution
t = zeros(n+1,1);
y = zeros(n+1,1);
t(1) = t0;
y(1) = y0;

% Implement the RK4 method
for i = 1:n
    k1 = h * f(t(i), y(i));
    k2 = h * f(t(i) + h/2, y(i) + k1/2);
    k3 = h * f(t(i) + h/2, y(i) + k2/2);
    k4 = h * f(t(i) + h, y(i) + k3);
    y(i+1) = y(i) + 1/6 * (k1 + 2*k2 + 2*k3 + k4);
    t(i+1) = t(i) + h;
end

% Plot the solution
plot(t,y,'-o')
tlabel('t')
ylabel('y')
title("Rung-kutta's method")
