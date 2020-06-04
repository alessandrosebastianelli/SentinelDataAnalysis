function plotter(data, bands, extra_title)

% PLOTTER Classic and useful plots
%   plotter(data, bands)
%   - data: multichannel image
%   - bands: select the bands to be plotted
%   - extra_title: plot title

    figure;
    for i = 1:length(bands)    
        histogram(data(:,:,bands(i)), 'EdgeColor', 'auto'); hold on;
        title("Histogram " + extra_title, 'FontSize', 24);
    end
    grid on; legend;
    
    figure;
    imshow(data(:,:,1:length(bands)));
    title("Image show " + extra_title, 'FontSize', 24);
    
end

