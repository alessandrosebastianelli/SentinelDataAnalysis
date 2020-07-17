function [normalized_data, a, b, alpha, beta] = normalize_data(data, normalization, alpha, beta)
% NORMALIZE_DATA  Normalize the data
%   [normalized_data, a, b, alpha, beta] = normalize_data(data, normalization, alpha, beta)
%   - data: multichannel satellite image
%   - normalization: string value for normalization type
%   - alpha: double multiplier for range adjustment
%   - beta: double offset for range adjustment

    s = size(data);
    normalized_data = zeros(s);
    a = zeros(s(3));
    b = zeros(s(3));

    for i=1:s(3)
        if normalization == "min-max"
            a(i) = min(min(min(data(:,:,i))));
            b(i) = max(max(max(data(:,:,i))));
            normalized_data(:,:,i) = alpha*((data(:,:,i) - a(i))/(b(i) - a(i))) + beta;
        elseif normalization == "std"
            a(i) = mean(reshape(data(:,:,i), [], 1));
            b(i) = std(reshape(data(:,:,i), [], 1));
            normalized_data(:,:,i) = alpha*((data(:,:,i) - a(i))/(b(i))) + beta;
        elseif normalization == "max"
            a(i) = max(max(max(data(:,:,i))));
            normalized_data(:,:,i) = alpha*((data(:,:,i))/(a(i))) + beta;
        end
    end
    
    % Clip between 0 and 1
    normalized_data(normalized_data>1) = 1;
    
end

