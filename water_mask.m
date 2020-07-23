
function [masked, mask] = water_mask(data, bands, threshold)

if nargin < 2
    disp('Invalid arguments error: data and bands must be specified');
    return;
elseif nargin == 2
    threshold = 0.4;
end

IR = create_composite(data, bands);

s = size(IR);
masked = zeros(s(1), s(2), 3);
mask = zeros(s(1), s(2), 3);

for i=1:s(1)
    for j=1:s(2)
        if (IR(i, j, 1)  + IR(i, j, 2) +  IR(i, j, 3) >= threshold)
            masked(i,j,:) = IR(i, j, :);
            mask(i,j,:) = 0;
        else
            masked(i,j,:) = 1;
            mask(i,j,1) = 1;
        end
    end
end


end
