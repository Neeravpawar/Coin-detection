function img = load_image(path)
% LOAD_IMAGE Loads an image from the specified path and converts it to double precision.
%
%   img = LOAD_IMAGE(path) reads the image at the specified file path
%   and returns it in double precision format.
%
%   Input:
%       path - File path as a char, string, or cell containing the path.
%   Output:
%       img - The loaded image in double precision.

    % Convert cell to char if the input is a cell array
    if iscell(path)
        path = cell2mat(path);
    end

    % Validate the input path
    if ~ischar(path) && ~isstring(path)
        error('load_image:InvalidInput', 'Input path must be a char or string.');
    end

    % Load and convert the image to double precision
    img = im2double(imread(char(path)));
end
