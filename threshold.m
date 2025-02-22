img = im2double(imread("C:\Users\neerav.pawar@student.lut.fi\Downloads\Diip_project\2\measurement2_normalized_03.JPG"));
m = mean(img(:));
g = graythresh(img);
I = imbinarize(img,g);

Grayscale_Image = rgb2gray(img);
Binary_Image = ((Grayscale_Image > 1) | (Grayscale_Image < g));

subplot(1,2,1); imshow(img);
title("RGB Image");
subplot(1,2,2); imshow(Binary_Image);
title("Binary Image");

se = strel('disk',18);
closeBW = imclose(Binary_Image,se);
closeBW = imopen(closeBW,se);

figure
imshow(closeBW)