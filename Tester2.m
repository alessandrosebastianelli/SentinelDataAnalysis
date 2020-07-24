[data, metadata] = read_data('data/S2-lat_45_85299971127813_lon_10_852932810361423-2019-06-13_2.tif', 'geo');
[normalized_data, a, b, alpha, beta] = normalize_data(data, 'min-max', 5, 0);

[cropped_data] = crop(normalized_data, [600 1000 1 400]);

NDVI = calculate_NDVI(cropped_data, [8 4]);

imshow(NDVI, [0 1])
colormap(jet)
colorbar()



