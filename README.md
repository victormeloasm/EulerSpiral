# Euler Spiral

This repository provides an implementation of the Euler spiral, also known as the Clothoid curve, in MATLAB. The Euler spiral is a curve with a varying curvature that has numerous applications in mathematics, physics, computer graphics, and robotics.

## What is the Euler Spiral?

The Euler spiral is a curve defined by the parametric equations:

```
x(t) = integral from 0 to t of cos(0.5 * pi * u^2) du
y(t) = integral from 0 to t of sin(0.5 * pi * u^2) du
```

where `t` is the parameter that ranges from 0 to a specified value. The curve starts at the origin (0,0) and ends at a point determined by the chosen parameter value.

## How to Use

To use the Euler spiral implementation in MATLAB, follow these steps:

1. Download the `euler_spiral.m` file from this repository.
2. In your MATLAB environment, navigate to the directory where you saved the `euler_spiral.m` file.
3. Run the `EulerSpiral` function in MATLAB.
4. Follow the on-screen instructions to choose a spiral function from the provided options.
5. The script will generate the spiral curve and plot it in the MATLAB figure window.

## Examples

Here are a few examples demonstrating the usage of the Euler spiral in MATLAB:

```matlab
% Example 1: Generate and plot the Euler spiral
EulerSpiral;

% Example 2: Modify the spiral parameters
t = -5:0.01:5; % Define the parameter range
x = integral(@(u) cos(0.5*pi*u.^2), 0, t); % Compute x-coordinates
y = integral(@(u) sin(0.5*pi*u.^2), 0, t); % Compute y-coordinates
plot(x, y, 'LineWidth', 2); % Plot the spiral curve

% Example 3: Customize the plot appearance
plot(x, y, 'LineWidth', 2, 'Color', 'r', 'LineStyle', '--');
xlabel('X');
ylabel('Y');
title('Euler Spiral');
grid on;
axis equal;

% Example 4: Generate a specific Euler spiral function
spiralFunc = @(t) (-0.6*t + 0.2*t.^5 - 0.1*t.^3); % Define a custom spiral function
t = -2.5:0.005:2.5; % Define the parameter range
len = length(t);
x = zeros(1, len);
y = zeros(1, len);

for n = 2:len
    x(n) = x(n-1) + integral(@(u) cos(0.5*pi*spiralFunc(u)), t(n-1), t(n));
    y(n) = y(n-1) + integral(@(u) sin(0.5*pi*spiralFunc(u)), t(n-1), t(n));
end

plot(x, y, 'LineWidth', 2);
xlabel('X');
ylabel('Y');
title('Custom Euler Spiral');
grid on;
axis equal;
```

## Contributions

Contributions to this Euler spiral implementation are welcome! If you would like to contribute, please follow these guidelines:

1. Fork the repository and create a new branch for your contributions.
2. Make your changes and submit a pull request.
3. Ensure that your code adheres to the MATLAB coding style guidelines.
4. Provide a clear description of your changes and their purpose.

We appreciate any feedback, bug reports, or feature requests you may have. Please feel free to open an issue on the repository
