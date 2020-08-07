clear all; close all; clc;

%% Load images paths
fileList = dir('data/Sentinel-2_Timeseries/*.tif');

s = size(fileList);
ndvis = zeros(s(1),2);
labels = strings(s(1),1);

%% Read and process data 
% -1: read
% -2: normalize data
% -3: crop
% -4: calculate NDVI

for i=1:s(1)
   
    img_path = strcat('data/Sentinel-2_Timeseries/', fileList(i).name);
    labels(i) = string(fileList(i).name);
    
    [data, ~] = read_data(img_path, 'std');
    [normalized_data, ~, ~, ~, ~] = normalize_data(data, 'min-max', 1, 0);
    
    cropped_data = crop(normalized_data, [100, 150, 100, 150]);
    
    ndvi = 2*calculate_NDVI(cropped_data, [8 4])-0.5;
    
    ndvis(i, 1) = mean(ndvi(:));
    ndvis(i, 2) = min(ndvi(:));
      
end

%% Plot results
figure, 
x = linspace (1, s(1), s(1));
plot(x, ndvis(:, 1), '.', 'MarkerSize', 20); hold on; grid on;
xticklabels(labels)
xticks(x)
xtickangle(90)
title('Spatial Mean of NDVI for 1 year time-series', 'FontSize', 24);


