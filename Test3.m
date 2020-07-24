clear all; close all; clc;
%% Read data
path = 'data/S2-lat_45_85299971127813_lon_10_852932810361423-2019-06-13_2.tif';

% Geo mode
[data, ~] = read_data(path, 'std');

% Normalize data
[normalized_data, a, b, alpha, beta] = normalize_data(data, 'min-max', 5, 0);

%% Test plotter
plotbands = 1;
plothistograms = 1;
plotter(normalized_data, [4 3 2], 'Test plotter', plotbands, plothistograms)