function cube_plot(data, step)
%CUBE_PLOT: plot the data (image) in a 3D cube.
%-data: data to be plotted
%-step: integer used to select a defined number of bands to be plotted
%together

if nargin < 1
    disp('Invalid arguments error: data must be specified');
    return;
elseif nargin == 1
    step = 1;
end

s = size(data);

figure,
for i=1:step:s(3)
    bands = [i:1:i+(step-1)];
    im = data(:,:,bands);
    [X,Y] = meshgrid(1:size(im,2),1:size(im,1));
    warp(X,Y,i*ones(size(X)),im)
    hold on
end