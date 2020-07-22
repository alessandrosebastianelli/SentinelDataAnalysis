
function [normalized_data, a, b, alpha, beta] = normalize_data(data, normalization, alpha, beta)
% NORMALIZE_DATA  Normalize the data
%   [normalized_data, a, b, alpha, beta] = normalize_data(data, normalization, alpha, beta)
%   - data: multichannel satellite image
%   - normalization: string value for normalization type
%   - a: double vector that stores max or mean values
%   - b: double vector that stores min or std values
%   - alpha: double multiplier for range adjustment
%   - beta: double offset for range adjustment

if nargin == 1 
    alpha = 1;
    beta = 0;
    normalization = "min-max";
elseif nargin == 0
    disp('Invalid arguments error: data must be specified');
    return 
end
    
s = size(data);
normalized_data = zeros(s);
a = zeros(s(3), 1);
b = zeros(s(3), 1);

for i=1:s(3)
    if normalization == "min-max"
        % out = alpha * (in - min(in) / (max(in) - min(in))) + beta
        a(i) = min(min(data(:,:,i)));
        b(i) = max(max(data(:,:,i)));
        normalized_data(:,:,i) = alpha*((data(:,:,i) - a(i))/(b(i) - a(i))) + beta;
    elseif normalization == "std"
        % out = alpha * (in - mean(in) / std(in)) + beta
        a(i) = mean(reshape(data(:,:,i), [], 1));
        b(i) = std(reshape(data(:,:,i), [], 1));
        normalized_data(:,:,i) = alpha*((data(:,:,i) - a(i))/(b(i))) + beta;
    elseif normalization == "max"
        % out = alpha * (in / max(in)) + beta
        a(i) = max(max(data(:,:,i)));
        normalized_data(:,:,i) = alpha*((data(:,:,i))/(a(i))) + beta;
    end
end

% Clip between 0 and 1
normalized_data(normalized_data>1) = 1;    
end

