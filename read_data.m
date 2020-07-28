function [data, metadata] = read_data(path, mode)
%READ_DATA loads satellite data given the path. If mode is set to std
%(standard) data are loaded without metadata (georeferencing, satellite
%information, timestamp). If the mode is set to geo the data are loaded
%with metadata.
%-path: string with relative link to the image
%-mode: string with the functioning mode
%The mapping toolbox must be installed for geo mode.

if nargin < 2
    disp('Invalid arguments error: path and mode must be specified');
    return;
end

if mode == "std"
    data = im2double(imread(path));
    metadata = 0;
elseif mode == "geo"
    [data, metadata] = geotiffread(path);
elseif mode == "std2"
    data = imread(path);
    metadata = 0;
else
    data = zeros(256, 256);
    metadata = 0;
end

end

