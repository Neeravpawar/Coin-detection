% Clear workspace and command window
clear all;
clc;

%% Define directories for input images
% Main project directory and subfolders
projectDir = "C:\Users\neerav.pawar@student.lut.fi\Downloads\Diip_project";
subfolders = ["DIIP-images-bias", "DIIP-images-dark", "DIIP-images-flat", ...
              "DIIP-images-measurement-1", "DIIP-images-measurement-2"];

% Retrieve paths for each category
BIAS_PATHS = find_images_paths(char(fullfile(projectDir, subfolders(1))));
DARK_PATHS = find_images_paths(char(fullfile(projectDir, subfolders(2))));
FLAT_PATHS = find_images_paths(char(fullfile(projectDir, subfolders(3))));
MEASUREMENT_1_PATHS = find_images_paths(char(fullfile(projectDir, subfolders(4))));
MEASUREMENT_2_PATHS = find_images_paths(char(fullfile(projectDir, subfolders(5))));

% Compute mean images for bias, dark, and flat
B_mean = compute_mean_image(BIAS_PATHS);
D_mean = compute_mean_image(DARK_PATHS);
F_mean = compute_mean_image(FLAT_PATHS);

% Process Measurement Set 1
for i = 1:length(MEASUREMENT_1_PATHS)
    % Read the raw measurement image
    R = imread(MEASUREMENT_1_PATHS{i});
    
    % Calibrate the image using bias, dark, and flat field images
    cimg = calibrate_image(R, B_mean, D_mean, F_mean);
    
    % Save the calibrated image with a descriptive filename
    outputFileName = sprintf('calibrated_measurement1_image_%02d.JPG', i);
    imwrite(cimg, outputFileName);
end

% Process Measurement Set 2
for i = 1:length(MEASUREMENT_2_PATHS)
    % Read the raw measurement image
    R = imread(MEASUREMENT_2_PATHS{i});
    
    % Calibrate the image using bias, dark, and flat field images
    cimg = calibrate_image(R, B_mean, D_mean, F_mean);
    
    % Save the calibrated image with a descriptive filename
    outputFileName = sprintf('calibrated_measurement2_image_%02d.JPG', i);
    imwrite(cimg, outputFileName);
end

% Debug: Verify directory paths
disp('Checking directory paths...');
for i = 1:length(subfolders)
    folderPath = char(fullfile(projectDir, subfolders(i)));
    if ~isfolder(folderPath)
        error('calibration:InvalidFolder', 'Folder does not exist: %s', folderPath);
    else
        fprintf('Folder exists: %s\n', folderPath);
    end
end
