function EulerSpiralAnimation
% Function plots an animated double Euler spiral.

% Get spiral data.
spiralData = getSpiralData;

% Get user input from the command window.
choice = getUserInput(['Enter a choice from 1 to ' num2str(length(spiralData)) '\n'], 1, length(spiralData));

% Get the function handle for the selected spiral.
func = spiralData(choice).func;

% Set up the animation parameters.
t = -2.5:0.005:2.5;
numFrames = length(t);
x = zeros(1, numFrames);
y = zeros(1, numFrames);

% Create the figure for animation.
figure;
hPlot = plot(x(1), y(1), 'LineWidth', 2, 'Color', [0 0 0.7]);
axis tight manual;
axis([-8 8 -8 8]);
xlabel('X');
ylabel('Y');
title('Double Euler Spiral Animation');

% Animation loop
for frame = 1:numFrames
    % Compute the x and y coordinates for the current frame.
    for n = 2:frame
        x(n) = x(n-1) + integral(@(t) sin(0.5*pi*func(t)), t(n-1), t(n));
        y(n) = y(n-1) + integral(@(t) cos(0.5*pi*func(t)), t(n-1), t(n));
    end
    
    % Update the plot with the new coordinates.
    set(hPlot, 'XData', x(1:frame), 'YData', y(1:frame));
    
    % Pause to create the animation effect.
    pause(0.000000001);
end
end

function eulerSpiralData = getSpiralData
% Function returns structure array, having a function handle at index.
% Handle is a polynomial that has to be integrated. Function takes no input argument.
eulerSpiralData(1).func = @(t)(-0.6*t+0.2*t.^5-0.1*t.^3);
eulerSpiralData(2).func = @(t)(t.^7-t.^3-t-2);
eulerSpiralData(3).func = @(t)(t.^5-3*t.^3-t);
eulerSpiralData(4).func = @(t)(t.^7-4*t);
eulerSpiralData(5).func = @(t)(4*t.^5+t.^3-4*t);
eulerSpiralData(6).func = @(t)(t.^7-t.^5-2*t-12);
eulerSpiralData(7).func = @(t)(t.^7-t.^5-2*t.^3-1);
eulerSpiralData(8).func = @(t)(t.^3+t-2);
eulerSpiralData(9).func = @(t)(t.^3-2.335*t);
eulerSpiralData(10).func = @(t)(t.^3-4.27*t);
eulerSpiralData(11).func = @(t)(9*t.^5-18*t.^3+5*t);
eulerSpiralData(12).func = @(t)(t.^2);
eulerSpiralData(13).func = @(t)(t.^5+0.6*t-4*t.^3);
eulerSpiralData(14).func = @(t)(-t.^5-0.6*t+3*t.^3);
eulerSpiralData(15).func = @(t)(-t.^7+0.1*t-3*t);
eulerSpiralData(16).func = @(t)(t.^3-2*t.^5+0.3*t.^9-t);
eulerSpiralData(17).func = @(t)(t.^3-0.2*t.^5+1.5*t);
eulerSpiralData(18).func = @(t)(t.^3-0.1*t.^7+1.5*t);
end

function choice = getUserInput(promptStr, minNum, maxNum)
% Return the user input and check the range of input.
choice = input(promptStr);
if isempty(choice) || ~isnumeric(choice)
    error('Enter a number');
elseif (choice < minNum) || (choice > maxNum)
    error(['Enter a number between 1 to ' num2str(maxNum)]);
elseif isfloat(choice)
    % If choice is a floating-point value, then truncate the fractional part.
    choice = choice - mod(choice,1);
end
end
