function dimg = apply_filter(img)
% APPLY_FILTER Adjusts the image using a predefined illuminant filter.
%
%   dimg = APPLY_FILTER(img) applies a correction to the input image
%   by dividing it with a scaled illuminant background.
%
%   Input:
%       img - Input image to be filtered (RGB image).
%   Output:
%       dimg - Filtered image after applying the illuminant correction.

    %% Load and prepare the illuminant
    % Read the illuminant image and convert it to double precision
    illuminant = im2double(imread('SceneIlluminantLarge.png'));

    % Get dimensions of the input image
    [M, N, ~] = size(img);

    % Crop the illuminant to match the size of the input image
    background = illuminant(1:M, 1:N, :);

    %% Apply the filter
    % Divide the input image by the scaled illuminant background
    scalingFactor = 1.3;  % Scaling factor for the illuminant
    dimg = img ./ (scalingFactor * background);
end