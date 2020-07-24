clear all; close all; clc

%% Test read_data
path = 'data/S2-lat_45_85299971127813_lon_10_852932810361423-2019-06-13_2.tif';

% Geo mode
[data_1, metadata] = read_data(path, 'geo');

disp('Satellite metadata');
disp(metadata);

% Std mode
[data_2, ~] = read_data(path, 'std');

%% Test normalize data

[normalized_data_1, a1, b1, alpha1, beta1] = normalize_data(data_1, 'min-max', 5, 0);
disp('Normalization parameters')
disp('Min: '); disp(a1);
disp('Max: '); disp(b1);
disp('Multiplier: '); disp(alpha1);
disp('Range shift: '); disp(beta1);

[normalized_data_2, a2, b2, alpha2, beta2] = normalize_data(data_2, 'min-max', 5, 0);
disp('Normalization parameters')
disp('Min: '); disp(a2);
disp('Max: '); disp(b2);
disp('Multiplier: '); disp(alpha2);
disp('Range shift: '); disp(beta2);
