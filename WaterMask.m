clear all
close all
clc
%% Load Sentinel-2
% Load a Sentinel-1 acquisition
[S2, ~] = read_data('data/S2-lat_45_85299971127813_lon_10_852932810361423-2019-06-13_2.tif', 'geo');
S2 = normalize_data(S2, 'min-max', 2.5, 0);

% Sentinel-2 
% Bands -> [B1, B2 (B), B3 (G), B4 (R), B5, B6, B7, B8, B8A, B9, B10, B11, B12, QA10, QA20, QA60]
% Bands -> [1   2       3       4       5   6   7   8   9    10  11   12   13   14    15    16]
IR = create_composite(S2, [13 12 8]);
plotter(IR, [1,2,3], "Bands: 12, 11, and 8")

%% Create a mask with a simple treshold

s = size(IR);
mask_1 = zeros(s(1), s(2), 3);
mask_2 = zeros(s(1), s(2), 3);

for i=1:s(1)
    for j=1:s(2)
        if (IR(i, j, 1)  + IR(i, j, 2) +  IR(i, j, 3) >= 0.4)
            mask_1(i,j,:) = IR(i, j, :);
            mask_2(i,j,:) = 0;
        else
            mask_1(i,j,:) = 1;
            mask_2(i,j,1) = 1;
        end
    end
end

figure,
imshow(mask_1)
figure,
imshow(mask_2)

%% Load Sentinel-2
[S2, ~] = read_data('data/S2-lat_45_85299971127813_lon_10_852932810361423-2019-06-13_2.tif', 'geo');
S2 = normalize_data(S2, 'min-max', 1.1, 0);

% Sentinel-2 
% Bands -> [B1, B2 (B), B3 (G), B4 (R), B5, B6, B7, B8, B8A, B9, B10, B11, B12, QA10, QA20, QA60]
% Bands -> [1   2       3       4       5   6   7   8   9    10  11   12   13   14    15    16]
IR = create_composite(S2, [13 12 8]);

%% Create a mask with log transformation
s = size(IR);
mask_1 = zeros(s(1), s(2), 3);
mask_2 = zeros(s(1), s(2), 3);

IR = -log10(1*IR);
IR(IR>1) = 1;
IR(IR<0) = 0;
plotter(IR, [1,2,3], "Bands: 8, 11, and 4")

for i=1:s(1)
    for j=1:s(2)
        if (IR(i, j, 1)  + IR(i, j, 2) +  IR(i, j, 3) <= 2.8)
            mask_1(i,j,:) = IR(i, j, :);
            mask_2(i,j,:) = 0;
        else
            mask_1(i,j,:) = 1;
            mask_2(i,j,1) = 1;
        end
    end
end

figure,
imshow(mask_1)
figure,
imshow(mask_2)