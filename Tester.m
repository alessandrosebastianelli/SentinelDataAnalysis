clear all
close all
clc
%% Sentinel-1 

% Load a Sentinel-1 acquisition
S1 = imread('data/S1-lat_41_901418340743376_lon_12_487605080987345-2019-08-12.tif');
plotter(S1, [1], "Before normalization")
S1 = normalize_data(S1, 'min-max', 1, 0);
plotter(S1, [1], "After normalization")


%% Sentinel-2 
% Bands -> [B1, B2 (B), B3 (G), B4 (R), B5, B6, B7, B8, B8A, B9, B10, B11, B12, QA10, QA20, QA60]
% Bands -> [1   2       3       4       5   6   7   8   9    10  11   12   13   14    15    16]
S2 = im2double(imread('data/S2-lat_41_901418340743376_lon_12_487605080987345-2019-08-09.tif'));

plotter(S2, [4,3,2], "Before normalization")

S2 = normalize_data(S2, 'min-max', 5.5, 0);
RGB = create_composite(S2, [4 3 2]);
NDVI = calculate_NDVI(S2, [8 4]);

plotter(RGB, [1,2,3], "After normalization")


