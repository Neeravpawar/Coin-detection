clear all;
clc;

% Define directories for bias, dark, and flat images
BIAS_DIR = "C:\Users\neerav.pawar@student.lut.fi\Downloads\Diip_project\DIIP-images-bias";
DARK_DIR = "C:\Users\neerav.pawar@student.lut.fi\Downloads\Diip_project\DIIP-images-dark";
FLAT_DIR = "C:\Users\neerav.pawar@student.lut.fi\Downloads\Diip_project\DIIP-images-flat";

% Retrieve image paths
BIAS_PATHS = find_images_paths(BIAS_DIR);
DARK_PATHS = find_images_paths(DARK_DIR);
FLAT_PATHS = find_images_paths(FLAT_DIR);

% Compute mean images
disp('Computing mean images...');
B_mean = compute_mean_image(BIAS_PATHS); % Mean bias image
D_mean = compute_mean_image(DARK_PATHS); % Mean dark image
F_mean = compute_mean_image(FLAT_PATHS); % Mean flat field image

% Save the computed mean images as files
disp('Saving mean images...');
imwrite(B_mean, 'B_mean.JPG');
imwrite(D_mean, 'D_mean.JPG');
imwrite(F_mean, 'F_mean.JPG');

disp('Mean images created and saved successfully.');
