clear all; close all; clc;
%% Read data
path = 'data/S2-lat_45_85299971127813_lon_10_852932810361423-2019-06-21.tif';

% Geo mode
[data, ~] = read_data(path, 'std');

% Normalize data
[normalized_data, a, b, alpha, beta] = normalize_data(data, 'min-max', 5, 0);

% Cloud mask
[cloud_masked, ~] = cloud_mask(normalized_data, 3*0.6, "threshold");
% Water mask
[water_masked, ~] = water_mask(normalized_data, [13 12 8], 3*0.4);
% RGB composite
rgb = create_composite(normalized_data, [4 3 2]);

%% Test cube plot
data2plot(:,:,[1 2 3]) = cloud_masked(:,:,[4 3 2]); 
data2plot(:,:,[4 5 6]) = water_masked(:,:,[4 3 2]); 
data2plot(:,:,[7 8 9]) = rgb; 

cube_plot(data2plot, 3);