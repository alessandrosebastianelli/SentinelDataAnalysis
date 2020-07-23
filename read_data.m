
function [data, metadata] = read_data(path, mode)
%READ_DATA loads satellite data given the path. If mode is set to std
%(standard) data are loaded without metadata (georeferencing, satellite
%information, timestamp). If the mode is set to geo or geo2 the data are loaded
%with metadata.
%
%   The mapping toolbox must be installed for geo mode.

if nargin < 2 || nargin > 2
    disp('Invalid arguments error: path and mode must be specified');
    return 
end

if mode == "std"
    data = im2double(imread(path));
    metadata = 0;
elseif mode == "geo"
    [data, metadata] = geotiffread(path);
else
    data = zeros(256, 256);
    metadata = 0;
end

end

