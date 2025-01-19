% Clear workspace and command window
clear all;
clc;

% Directories for Measurement 1 and 2
MEASUREMENT_1_DIR = "C:\Users\neerav.pawar@student.lut.fi\Downloads\Diip_project\DIIP-images-measurement-1"; % Update path
MEASUREMENT_2_DIR = "C:\Users\neerav.pawar@student.lut.fi\Downloads\Diip_project\DIIP-images-measurement-2"; % Update path

% Output directories for normalized images
OUTPUT_DIR_1 = "C:\Users\neerav.pawar@student.lut.fi\Downloads\Diip_project\1";
OUTPUT_DIR_2 = "C:\Users\neerav.pawar@student.lut.fi\Downloads\Diip_project\2";

% Create output directories if they don't exist
if ~isfolder(OUTPUT_DIR_1)
    mkdir(OUTPUT_DIR_1);
end
if ~isfolder(OUTPUT_DIR_2)
    mkdir(OUTPUT_DIR_2);
end

% Retrieve image paths
MEASUREMENT_1_PATHS = find_images_paths(MEASUREMENT_1_DIR);
MEASUREMENT_2_PATHS = find_images_paths(MEASUREMENT_2_DIR);

% Process Measurement Set 1
disp('Processing Measurement 1...');
for i = 1:length(MEASUREMENT_1_PATHS)
    % Load the image
    img = im2double(imread(MEASUREMENT_1_PATHS{i}));

    % Apply illuminant and normalize illumination
    normalizedImg = illumination_normalization(img);

    % Save the result in folder 1
    outputFileName = fullfile(OUTPUT_DIR_1, sprintf('measurement1_normalized_%02d.JPG', i));
    imwrite(normalizedImg, outputFileName);
end

% Process Measurement Set 2
disp('Processing Measurement 2...');
for i = 1:length(MEASUREMENT_2_PATHS)
    % Load the image
    img = im2double(imread(MEASUREMENT_2_PATHS{i}));

    % Apply illuminant and normalize illumination
    normalizedImg = illumination_normalization(img);

    % Save the result in folder 2
    outputFileName = fullfile(OUTPUT_DIR_2, sprintf('measurement2_normalized_%02d.JPG', i));
    imwrite(normalizedImg, outputFileName);
end

disp('Processing complete.');
