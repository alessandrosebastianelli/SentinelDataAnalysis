function [restored_data] = restore_range(data, normalization, a, b, alpha, beta)

% RESTORE_DATA  Restore the range of normalized data
%   [normalized_data, a, b, alpha, beta] = normalize_data(data, normalization, alpha, beta)
%   - data: multichannel satellite image
%   - normalization: string value for normalization type
%   - alpha: double multiplier for range adjustment
%   - beta: double offset for range adjustment

    s = size(data);
    restored_data = zeros(s);

    for i=1:s(3)
        if normalization == "min-max"
            restored_data(:,:,i) = a(i) + (b(i)-a(i))*((data(:,:,i) - beta)/alpha);
        elseif normalization == "std"
            restored_data(:,:,i) = a(i) + b(i)*((data(:,:,i) - beta)/alpha);
        elseif normalization == "max"
            restored_data(:,:,i) = a(i)*((data(:,:,i) - beta)/alpha);
        end
    end
    
end

