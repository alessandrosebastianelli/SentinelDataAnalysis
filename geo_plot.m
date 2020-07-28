function geo_plot(data, coordinates, region, zoom)
%GEO_PLOT plot the data on a georeferenced map
%- data: satellite data (only <= 3 bands must be passed)
%- coordinates: vector with latitude and logitude of a reference point
%- region: string that identify the region under analysis, e.g. Europe,
%Italy, World
%- zoom: int value used to magnify the image

if nargin < 2
    disp('Invalid arguments error: path and coordinates must be specified');
    return;
elseif nargin == 2
    region = 'World';
    zoom = 1;
end

figure,
load geoid;
% Create a map
worldmap(region);

% Add land, rivers and lake to the map
geoshow(geoid, geoidrefvec, 'FaceColor', [0.92 0.95 1]);
geoshow('landareas.shp', 'FaceColor', [1 1 1]); 
geoshow('WorldLakes.shp', 'FaceColor', [0.92 0.95 1]); 
geoshow('worldrivers.shp', 'Color', [0.92 0.95 1]); 

% Get the default projection method
mstruct=gcm;

%% Plot a point
[x, y] = mfwdtran(mstruct,coordinates(1),coordinates(2));
plot(x,y,'.', 'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize', 30);
hold on

%% Plot the image
sizeDeg = zoom;

img_3D=data;
img_3D=flipdim(img_3D,1);

latlim=[coordinates(1) coordinates(1)+sizeDeg];
lonlim=[coordinates(2) coordinates(2)+sizeDeg];

% show the frame of the image, you can skip this step
[xlim, ylim] = mfwdtran(mstruct,latlim,lonlim);
plot([xlim(1) xlim(2) xlim(2) xlim(1) xlim(1)],[ylim(1) ylim(1) ylim(2) ylim(2) ylim(1)],'y-')

% Show the image
R = maprefcells(xlim,ylim,size(img_3D(:,:,1)));
mapshow(img_3D,R)


end

