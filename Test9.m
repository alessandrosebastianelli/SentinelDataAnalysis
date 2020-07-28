clear all; close all; clc

%% Sentinel-1

% Read data
path = 'data/S1-lat_45_85299971127813_lon_10_852932810361423-2019-06-25.tif';

[data, ~] = read_data(path, 'std2');

data(data>15) = 15;
data(data<-30) = -30;

% Normalize data
[normalized_data, a, b, alpha, beta] = normalize_data(data, 'min-max', 1, 0);

%% Test Apply Filter
figure,
imshow(normalized_data(:,:,1))

figure, 
filtered = apply_filter(normalized_data(:,:,1),'wiener');
imshow(filtered)

figure, 
filtered = apply_filter(normalized_data(:,:,1),'median');
imshow(filtered)
