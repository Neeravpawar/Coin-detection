function [coinCenters, coinRadii] = detect_coin_circles(rawImage, minRadius, maxRadius, debug)
% DETECT_COINS_FROM_RAW Detects coins from a raw image using Hough Transform.
%
%   [coinCenters, coinRadii] = DETECT_COINS_FROM_RAW(rawImage, minRadius, maxRadius, debug)
%
%   Inputs:
%       rawImage   - Input raw RGB image.
%       minRadius  - Minimum radius of coins to detect (in pixels).
%       maxRadius  - Maximum radius of coins to detect (in pixels).
%       debug      - (Optional) Boolean to enable debug visualization.
%
%   Outputs:
%       coinCenters - Nx2 matrix of [x, y] coordinates of detected coin centers.
%       coinRadii   - Nx1 vector of radii for each detected coin.

    % Set default for debug if not provided
    if ~exist('debug', 'var')
        debug = false;
    end

    % Step 1: Convert to grayscale
    grayImage = rgb2gray(rawImage);

    % Step 2: Apply binary thresholding
    thresholdLevel = graythresh(grayImage); % Otsu's method for thresholding
    binaryImage = imbinarize(grayImage, thresholdLevel);

    % Step 3: Invert the binary image to make coins white (foreground)
    binaryImage = ~binaryImage;

    % Step 4: Clean the binary image
    % Remove small objects and fill holes
    cleanedBinaryImage = imfill(bwareaopen(binaryImage, 500), 'holes'); % Adjust 500 as needed

    % Step 5: Detect circles using Hough Transform
    [coinCenters, coinRadii] = imfindcircles(cleanedBinaryImage, [minRadius maxRadius], ...
        'ObjectPolarity', 'bright', 'Sensitivity', 0.95);

    % Debug visualization (optional)
    if debug
        figure;
        subplot(1, 3, 1);
        imshow(grayImage);
        title('Grayscale Image');

        subplot(1, 3, 2);
        imshow(cleanedBinaryImage);
        title('Cleaned Binary Image');

        subplot(1, 3, 3);
        imshow(rawImage);
        hold on;
        viscircles(coinCenters, coinRadii, 'EdgeColor', 'b', 'LineWidth', 1);
        title('Detected Coins');
        hold off;
    end
end

