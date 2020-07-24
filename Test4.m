clear all; close all; clc;
%% Read data
path = 'data/S2-lat_45_85299971127813_lon_10_852932810361423-2019-06-13_2.tif';

% Geo mode
[data, ~] = read_data(path, 'std');

% Normalize data
[normalized_data, a, b, alpha, beta] = normalize_data(data, 'min-max', 1, 0);


%% Test NDVI
ndvi = 2*calculate_NDVI(data, [8 4]) -0.5;

figure,
imshow(ndvi, [-1 1]);
colormap(jet);
colorbar();