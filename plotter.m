function plotter(data, bands, extra_title, plotbands, plothistograms)
%PLOTTER Classic and useful plots
%plotter(data, bands)
%- data: multichannel image
%- bands: select the bands to be plotted
%- extra_title: plot title
%- plotbands: boolean value, if 1 plots an histogram for each band
%- plothistograms: boolean value, if 1 plots an image for each band

if nargin < 2
    disp('Invalid arguments error: data and bands must be specified');
    return;
elseif nargin == 2
    extra_title = " ";
    plotbands = 0;
    plothistograms = 0;
elseif nargin == 3
    plotbands = 0;
    plothistograms = 0;
end

figure;
for i = 1:length(bands)    
    histogram(data(:,:,bands(i)), 'EdgeColor', 'auto'); hold on;
    title("Histogram " + extra_title, 'FontSize', 24);
end
grid on; legend;
hold off;

figure;
imshow(data(:,:,bands));
hold off;
if plothistograms == 1
    s = size(data);
    for i = 1:s(3)
        figure;
        histogram(data(:,:,i), 'EdgeColor', 'auto');
        title("Histogram of band " + i, "FontSize", 24);
        grid on;
    end
end

if plotbands == 1
    s = size(data);
    for i = 1:s(3)
        figure;
        imshow(data(:,:,i));
        title("Imshow of band " + i, "FontSize", 24);
        grid on;
    end
end
    
end

