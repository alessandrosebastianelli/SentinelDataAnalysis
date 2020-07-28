clear all; close all; clc;
%% Read data
path = 'data/S2-lat_45_85299971127813_lon_10_852932810361423-2019-06-21.tif';

% Geo mode
[data, ~] = read_data(path, 'std');

% Normalize data
[normalized_data, a, b, alpha, beta] = normalize_data(data, 'min-max', 5, 0);

%% Test Cloud Mask

% With Threshold
[masked, mask] = cloud_mask(normalized_data, 3*0.6, "threshold");
% With cloud mask
[masked2, mask2] = cloud_mask(normalized_data, 16, "mask");

figure,
imshow(masked(:,:,[4 3 2]));

figure,
imshow(masked2(:,:,[4 3 2]));

figure,
imshow(normalized_data(:,:,[4 3 2]));