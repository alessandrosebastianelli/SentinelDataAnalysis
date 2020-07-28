function [filtered] = apply_filter(data, mode)
%APPLY_FILTER: apply a filter to the input data
%-data: input data to be filtered
%-mode: type of filter -> wiener, median, median2, minimum, maximum, min-n-s-w-e

if nargin < 2 
    disp('Invalid arguments error: data and mode must be specified');
    return;
end

size = [5 5];

if mode == "wiener"
    filtered = wiener2(data,[size(1) size(2)]);
elseif mode == "median"
    filtered = medfilt2(data,[size(1) size(2)]);
elseif mode == "median2"
    filtered = ordfilt2(data,5,ones(3,3));
elseif mode == "minimum"
    filtered = ordfilt2(data,1,ones(3,3));
elseif mode == "maximum"
    filtered = ordfilt2(data,9,ones(3,3));
elseif mode == "min-n-s-w-e"
    filtered = ordfilt2(data,1,[0 1 0; 1 0 1; 0 1 0]);
    
end