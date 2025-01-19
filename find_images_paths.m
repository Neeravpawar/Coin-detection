function paths = find_images_paths(directory)
% FIND_IMAGES_PATHS Retrieves paths of all images in the directory recursively.
%
%   paths = FIND_IMAGES_PATHS(directory) uses the imageSet function to gather
%   paths for all image files in the given directory and its subdirectories.
%
%   Input:
%       directory - Folder path (char or string) to search for images.
%   Output:
%       paths - A cell array of image paths.

    % Ensure directory is a char
    directory = char(directory);

    % Check if the directory exists
    if ~isfolder(directory)
        error('find_images_paths:InvalidFolder', 'The directory does not exist: %s', directory);
    end

    % Use imageSet to gather image paths
    try
        img = imageSet(directory, 'recursive');
        if img.Count == 0
            error('find_images_paths:NoImages', 'No images found in directory: %s', directory);
        end
        paths = img.ImageLocation;
    catch ME
        rethrow(ME); % Re-throw the error for debugging
    end
end
