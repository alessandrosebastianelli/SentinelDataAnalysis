function [normalized_data] = normalize_data(data, normalization, alpha, beta)
% NORMALIZE_DATA  Normalize the data
%   normalized_data = normalize_data(data, normalization, alpha, beta)
%   - data: multichannel satellite image
%   - normalization: string value for normalization type
%   - alpha: double multiplier for range adjustment
%   - beta: double offset for range adjustment

    s = size(data);
    normalized_data = zeros(s);

    for i=1:s(3)
        if normalization == "min-max"
            normalized_data(:,:,i) = alpha*((data(:,:,i) - min(min(min(data(:,:,i)))))/(max(max(max(data(:,:,i)))) - min(min(min(data(:,:,i)))))) + beta;
        elseif normalization == "std"
            normalized_data(:,:,i) = alpha*((data(:,:,i) - mean(reshape(data(:,:,i), [], 1)))/(std(reshape(data(:,:,i), [], 1)))) + beta;
        elseif normalization == "max"
            normalized_data(:,:,i) = alpha*((data(:,:,i))/(max(max(max(data(:,:,i)))))) + beta;
        end
    end
    
    % Clip between 0 and 1
    normalized_data(normalized_data>1) = 1;
    
end

