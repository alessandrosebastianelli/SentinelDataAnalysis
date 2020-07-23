clear all; close all; clc

[data, metadata] = read_data('data/S2-lat_45_85299971127813_lon_10_852932810361423-2019-06-13_2.tif', 'geo');


[normalized_data, a, b, alpha, beta] = normalize_data(data, 'min-max', 2.5, 0);
%plotter(normalized_data, [4 3 2], "Before restoring")

%ndvi = calculate_NDVI(data, [8 4]);

%ndvi = 2*(ndvi - min(min(ndvi)))/(max(max(ndvi)) - min(min(ndvi))) - 1;



%figure,
%imshow(ndvi, [-1 1]);
%colormap(jet); colorbar;


%composite = create_composite(normalized_data, [13 12 8]);
%plotter(composite, [1 2 3], "Composite")

rgb = create_composite(normalized_data, [4 3 2]);

%figure,

%S = shaperead('map/ne_110m_land.shp');
%mapshow(S);

%hold on;
%mapshow(rgb, metadata)

[masked, mask] = water_mask(normalized_data, [13 12 8]);

