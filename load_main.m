clear all;
clc;

% Define the main directory and subfolders
projectDir = "C:\Users\neerav.pawar@student.lut.fi\Downloads\Diip_project";
subfolders = ["DIIP-images-bias", "DIIP-images-dark", "DIIP-images-flat", "DIIP-images-measurement-1", "DIIP-images-measurement-2"];

% Process each folder
for i = 1:length(subfolders)
    % Get the full path to the current subfolder
    folderPath = fullfile(projectDir, subfolders(i));
    
    % Get all image file paths in the folder
    imagePaths = find_images_paths(char(folderPath));
    
    % Process each image in the folder
    for j = 1:length(imagePaths)
        % Load the image using load_image function
        img = load_image(imagePaths{j});
        
        % Example: Display the image (optional)
        imshow(img);
        title(sprintf('Folder: %s, Image: %d', subfolders(i), j));
        pause(1); % Pause to view each image
    end
end
