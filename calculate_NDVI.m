function [ndvi] = calculate_NDVI(data, bands)

    ndvi = (data(:,:,bands(1)) - data(:,:,bands(2)))/(data(:,:,bands(1)) + data(:,:,bands(2)));

end

