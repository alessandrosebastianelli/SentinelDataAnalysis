function [restored_data] = restore_range(data, normalization, a, b, alpha, beta)
%RESTORE_RAMGE  Restore the range of normalized data
%[restored_data] = restore_range(data, normalization, a, b, alpha, beta)
%- data: multichannel satellite image
%- normalization: string value for normalization type
%- a: double vector that stores max or mean values
%- b: double vector that stores min or std values
%- alpha: double multiplier for range adjustment
%- beta: double offset for range adjustment
% This function must be used after the normalize_data function, to restore
% the orignal range of the input data.

s = size(data);
restored_data = zeros(s);

for i=1:s(3)
    if normalization == "min-max"
        % out = min(in) + (max(in) - min(in)) * (in - beta)/alpha
        restored_data(:,:,i) = a(i) + (b(i)-a(i))*((data(:,:,i) - beta)/alpha);
    elseif normalization == "std"
        % out = std(in) + mean(in) * (in - beta)/alpha
        restored_data(:,:,i) = a(i) + b(i)*((data(:,:,i) - beta)/alpha);
    elseif normalization == "max"
        % out = max(in) * (in - beta)/alpha
        restored_data(:,:,i) = a(i)*((data(:,:,i) - beta)/alpha);
    end
end
    
end

