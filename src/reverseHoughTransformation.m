function orig_img = reverseHoughTransformation(hough_img,orig_size)
%REVERSEHOUGHTRANSFORMATION Calculate the reverse hough transformation for an image with size orig_size from hough image hough_img

    orig_img = zeros(orig_size);
    
    C = (orig_size')/2;
    max_dist = norm((orig_size+[1 1])./2);
    
    alpha_steps = size(hough_img,1);
    dist_steps = size(hough_img,2);
    
    for x = 1:orig_size(1)
        for y = 1:orig_size(2)
            
            confidence = 0;
            
            for a = 1:alpha_steps
                alpha = (a/alpha_steps * pi) - pi/2;
                P = [x;y];
                norm_from_alpha = [-sin(alpha) cos(alpha)];                 
                dist = norm_from_alpha * (C-P);
                dist = (dist+max_dist)/(2*max_dist); % normalize
                img_dist = round( dist * dist_steps)+1; % +1 because 1 indexing
                if hough_img(a,img_dist) > 0
                   confidence = confidence + 1/alpha_steps; 
                end
            end
            
            % create grey image from confidence
            % 0 <= confidence <= 1
            orig_img(x,y) = round(confidence * 255);

            % idea to return black-white image
            %if confidence > 0.9
            %    orig_img(x,y) = 1;
            %end
        end
    end

end

