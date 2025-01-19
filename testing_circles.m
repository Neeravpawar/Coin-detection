close all
img = im2double(imread("C:\Users\neerav.pawar@student.lut.fi\Downloads\Diip_project\1\measurement1_normalized_03.JPG"));
BW = rgb2gray(img);
% h = fspecial('disk',1000);
% imfilter(BW,h,'replicate');
% BW = imgaussfilt(BW,10);
figure
imshow(BW)
% I = imbinarize(BW);
se = strel('disk',10);
closeBW = imopen(BW,se);
closeBW = imclose(closeBW,se);
cimg = imcomplement(closeBW);
bimg = ((cimg > 0.4) & (cimg < 0.9));
closeBW = imopen(bimg,se);
closeBW = imclose(closeBW,se);
figure
imshow(closeBW), hold on
[centers, radii]=imfindcircles(closeBW, [100,300],'Sensitivity',0.96)
viscircles(centers, radii,'EdgeColor','b');