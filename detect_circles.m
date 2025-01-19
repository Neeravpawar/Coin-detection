function [centers, radii] = detect_circles(binaryImage, minRadius, maxRadius, debug)
% DETECT_CIRCLES Detects circles in a cleaned binary image.
%
%   [centers, radii] = DETECT_CIRCLES(binaryImage, minRadius, maxRadius, debug)
%
%   Inputs:
%       binaryImage - Cleaned binary image (logical array).
%       minRadius   - Minimum radius of circles to detect (pixels).
%       maxRadius   - Maximum radius of circles to detect (pixels).
%       debug       - (Optional) Boolean to display debugging visualization.
%
%   Outputs:
%       centers     - Nx2 array of [x, y] coordinates of circle centers.
%       radii       - Nx1 array of radii for each detected circle.

    % Set default value for debug if not provided
    if ~exist('debug', 'var')
        debug = false;
    end

    % Detect circles using the Hough Transform
    [centers, radii] = imfindcircles(binaryImage, [minRadius maxRadius], ...
        'ObjectPolarity', 'bright', 'Sensitivity', 0.95);

    % Debug visualization (optional)
    if debug
        figure;
        imshow(binaryImage);
        hold on;
        viscircles(centers, radii, 'EdgeColor', 'b', 'LineWidth', 1);
        title('Detected Circles');
        hold off;
    end
end
