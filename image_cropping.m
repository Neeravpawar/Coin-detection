function ROI = image_cropping(image)
% IMAGE_CROPPING Extracts the largest connected region from the input image and
% displays the binarized grayscale image and cropped region of interest (ROI).
%
%   ROI = IMAGE_CROPPING(image)
%   Inputs:
%       image - Input RGB or grayscale image.
%   Outputs:
%       ROI - Cropped region of interest corresponding to the largest
%             connected region in the binary image.

    %% Step 1: Convert the image to grayscale
    % If the image is RGB, convert it to grayscale for processing.
    I = rgb2gray(image);

    %% Step 2: Binarize the grayscale image
    % Threshold the grayscale image to create a binary image.
    BW = imbinarize(I);

    % Invert the binary image to make the foreground white.
    BW = 1 - BW;

    %% Step 3: Find connected regions
    % Use regionprops to find properties of connected regions.
    s = regionprops(BW, 'BoundingBox', 'Area');

    %% Step 4: Identify the largest region
    % Find the bounding box of the region with the maximum area.
    [~, largestIdx] = max([s.Area]); % Find the index of the largest area
    max_box = s(largestIdx).BoundingBox;

    %% Step 5: Crop the region of interest (ROI)
    % Extract the bounding box dimensions.
    xMin = ceil(max_box(1)); % Left coordinate
    xMax = xMin + max_box(3) - 1; % Right coordinate
    yMin = ceil(max_box(2)); % Top coordinate
    yMax = yMin + max_box(4) - 1; % Bottom coordinate

    % Crop the region from the original image.
    ROI = image(yMin:yMax, xMin:xMax, :);

    %% Step 6: Display Results
    % Display the grayscale binary image and the cropped ROI
    figure;
    subplot(1, 2, 1);
    imshow(BW);
    title('Binarized Grayscale Image');
    
    subplot(1, 2, 2);
    imshow(ROI);
    title('Cropped ROI');
end

