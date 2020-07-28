function [ndvi] = calculate_NDVI(data, bands)
%CALCULATE_NDVI calculate the NDVI index
%NDVI = (NIR - VIS)/(NIR + VIS)
%-data: multispectral Satellite data
%-bands: vector with the index, for the data matrix, of the NIR
%and VIS bands.
% https://it.wikipedia.org/wiki/Normalized_Difference_Vegetation_Index

if nargin < 2
    disp('Invalid arguments error: data and bands must be specified');
    return;
end

ndvi = (data(:,:,bands(1)) - data(:,:,bands(2)))./(data(:,:,bands(1)) + data(:,:,bands(2)));

end

