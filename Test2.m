clear all; close all; clc

%% Read data
path = 'data/S2-lat_45_85299971127813_lon_10_852932810361423-2019-06-13_2.tif';

% Geo mode
[data, metadata] = read_data(path, 'geo');

% Normalize data
[normalized_data, a, b, alpha, beta] = normalize_data(data, 'min-max', 5, 0);

%% Test crop

[cropped_data] = crop(normalized_data, [600 1000 1 400]);

%% Test geo plot
% With crop
geo_plot(cropped_data(:,:,[4 3 2]), [45.85299971127813 10.852932810361423], 'Italy', 1);
% Without crop
geo_plot(normalized_data(:,:,[4 3 2]), [45.85299971127813 10.852932810361423], 'Italy', 1);
