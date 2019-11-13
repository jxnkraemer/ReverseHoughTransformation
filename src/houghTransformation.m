function h_img = houghTransformation(img, alpha_steps,dist_steps)
%HOUGHTRANSFORM Summary of this function goes here
%   Detailed explanation goes here
    if islogical(img)
        bw_img = img;
    else
        bw_img = imbinarize(img); % black-white image
    end
    %C = [0;0]; % Center point
    %max_dist = norm((size(img)+[1 1]));
    C = (size(img)')/2;
    max_dist = norm((size(img)+[1 1])./ 2);
    h_img = zeros(alpha_steps,dist_steps);
    for x = 1:size(bw_img,1)
        for y = 1:size(bw_img,2)
            if bw_img(x,y) == 1 % Akkumulator aller Gerade hochzählen
                for a = 1:alpha_steps
                    alpha = (a/alpha_steps * pi) - pi/2;
                    P = [x;y];
                    norm_from_alpha = [-sin(alpha) cos(alpha)];                 
                    dist = norm_from_alpha * (C-P);
                    %dist = abs(dist)
                    dist = (dist+max_dist)/(2*max_dist); % normalize
                    img_dist = round( dist * dist_steps)+1; % +1 because 1 indexing
                    %disp(img_dist)
                    h_img(a,img_dist) = h_img(a,img_dist) + 1;
                end
            end
        end
    end
end
