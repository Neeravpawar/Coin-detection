% Clear workspace and command window
clear all;
clc;

% Path to the illuminized image
imagePath = "C:\Users\neerav.pawar@student.lut.fi\Downloads\Diip_project\1\measurement1_normalized_05.JPG";

% Load the illuminized image
illuminizedImage = im2double(imread(imagePath));

% Apply background removal
cleanedImage = delete_background(illuminizedImage, false);

% Display the results
figure;
subplot(1, 2, 1);
imshow(illuminizedImage);
title('Illuminized Image');

subplot(1, 2, 2);
imshow(cleanedImage);
title('Background Removed');
