clear all
close all
clc



[data, metadata] = read_data('data/S2-lat_45_85299971127813_lon_10_852932810361423-2019-06-13_2.tif', 'geo');


[normalized_data, a, b, alpha, beta] = normalize_data(data, 'min-max', 1, 0);
plotter(normalized_data, [4 3 2], "After restoring")

[normalized_data, a, b, alpha, beta] = normalize_data(data, 'min-max', 4.5, 0);
plotter(normalized_data, [4 3 2], "Before restoring")

