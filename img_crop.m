% Clear workspace and command window
clear all;
clc;

% Load an image (update the path to your image file)
imagePath = "C:\Users\neerav.pawar@student.lut.fi\Downloads\Diip_project\calibrated_measurement2_image_05.JPG"; % Replace with the actual path
image = imread(imagePath);

% Call the image_cropping function
ROI = image_cropping(image);

% Display the original image and cropped ROI
figure;
subplot(1, 2, 1);
imshow(image);
title('Original Image');

subplot(1, 2, 1);
imshow(BW);
title('Binarized Grayscale Image');

subplot(1, 2, 2);
imshow(ROI);
title('Cropped ROI');
