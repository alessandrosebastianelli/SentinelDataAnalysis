function [masked, mask] = cloud_mask(data, maskData, mode)
%CLOUD_MASK apply a cloud masking method to optical data
%- data: satellite data
%- maskData: cloud mask band or threshold value
%- mode: string that defines the functioning mode. if 'mask', the variable 
%maskData must contains the band with the cloud mask, else if 'threshold' the variable 
%maskData must contains the value of the threshold.

if nargin < 2
    disp('Invalid arguments error: path and mask must be specified');
    return;
elseif nargin == 2
    mode = 'threshold';
    maskData = 0.6;
end


s = size(data);
masked = zeros(s(1), s(2), s(3));
mask = zeros(s(1), s(2), 3);

cloud_coverage = 0;

for i=1:s(1)
    for j=1:s(2)
        if mode == "threshold"
            if (data(i, j, 4)  + data(i, j, 3) +  data(i, j, 2) < maskData)
                masked(i,j,:) = data(i, j, :);
                mask(i,j,:) = 0;
            else
                masked(i,j,:) = 0;
                mask(i,j,1) = 1;
                cloud_coverage = cloud_coverage + 1;
            end
        elseif mode == "mask"
            if (data(i, j, maskData) == 0)
                masked(i,j,:) = data(i, j, :);
                mask(i,j,:) = 0;
            else
                masked(i,j,:) = 0;
                mask(i,j,1) = 1;
                cloud_coverage = cloud_coverage + 1;
            end
        end
    end
end

disp('Total number of pixel (single band)')
s = size(masked);
total_pixels = s(1)*s(2);
disp(total_pixels);

disp('Total number of cloud pixel ')
disp(cloud_coverage);

disp('Cloud coverage percentage based on the mask')
clouds_percentage = (cloud_coverage/total_pixels)*100 ;
disp(clouds_percentage);

end

