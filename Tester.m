clear all; close all; clc

path = 'data/S2-lat_45_85299971127813_lon_10_852932810361423-2019-06-13_2.tif';

info = geotiffinfo(path);

[data, metadata] = read_data(path, 'geo');
[normalized_data, a, b, alpha, beta] = normalize_data(data, 'min-max', 5, 0);


rgb = create_composite(normalized_data, [4 3 2]);

figure,

ax = worldmap('Europe')

%setm(ax, 'MapProjection','lambcyln');
load coast
setm(ax, 'Origin', [0 0 0])
plotm(lat, long)

mapshow(ax, rgb, metadata);
getm(ax,'MapProjection')


