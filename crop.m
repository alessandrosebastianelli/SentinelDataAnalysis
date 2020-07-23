function [cropped_data] = crop(data, cropping_limits)
%CROP create a subimage from the input data
% cropping_limits should be a vector with four coordinates
% [x_start y_start x_end y_end]
%
%  .------------------------------------.
%  |                                    |
%  |    x_start, y_start___.            |
%  |    !                  !            |
%  |    !                  !            |
%  |    !                  !            |
%  |    !  A               !            |
%  |    !_______x_end,y_end!            |
%  |                                    |
%  |                                    |
%  |                                  B |
%  .------------------------------------.
%
% the coordinates must be contained into the range of coordinates of the
% input image.

if nargin < 2
    disp('Invalid arguments error: data and cropping_list must be specified');
    return;
end
    
cropped_data = data(cropping_limits(3):cropping_limits(4), cropping_limits(1):cropping_limits(2),:);
end

