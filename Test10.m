clear all; close all; clc;

fileList = dir('data/Sentinel-2_Timeseries/*.tif');

s = size(fileList);
img_path = strcat('data/Sentinel-2_Timeseries/', fileList(1).name);
[data, ~] = read_data(img_path, 'std');

s2 = size(data);
ndvi_matrix = zeros(s2(1)*s2(2),s(1));

for i=1:s(1)
   
    img_path = strcat('data/Sentinel-2_Timeseries/', fileList(i).name);
    [data, ~] = read_data(img_path, 'std');
    [normalized_data, ~, ~, ~, ~] = normalize_data(data, 'min-max', 1, 0);
    ndvi = 2*calculate_NDVI(data, [8 4]) -0.5;
    
    ndvi_matrix(:,i) = ndvi(:);
    
end