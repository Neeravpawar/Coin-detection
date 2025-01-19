function meanImage = compute_mean_image(imagePaths)
% COMPUTE_MEAN_IMAGE Computes the mean image from a set of images.
%
%   meanImage = COMPUTE_MEAN_IMAGE(imagePaths)
%   takes a cell array of image paths and returns the mean image.

    % Read and sum all images
    sumImage = 0;
    for i = 1:length(imagePaths)
        img = im2double(imread(imagePaths{i}));
        sumImage = sumImage + img;
    end

    % Calculate the mean image
    meanImage = sumImage / length(imagePaths);
end
