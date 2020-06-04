function [composite] = create_composite(data, bands)
% CREATE_COMPOSITE Create a new data using a specific list of bands
%   [composite] = create_composite(data, bands)
%   - data: multichannel image
%   - bands: array of bands
%
%   For Example - RGB from Sentinel-2
%   composite = create_composite(s2_image, [4 3 2])
%   [4 3 2] -> B4 (Red band), B3 (Green band), B2 (Blue band)
%   Sentinel-2 Bands -> [B1, B2, B3, B4, B5, B6, B7, B8, B8A, B9, B10, B11, B12, QA10, QA20, QA60]

    s = size(data);
    composite = zeros(s(1), s(2), length(bands));

    for i = 1:length(bands)
        composite(:,:,i) = data(:,:,bands(i));
    end

end

