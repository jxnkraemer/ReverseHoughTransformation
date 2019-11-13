function drawHoughLines(hough_img, resized_img)
%DRAWHOUGHLINES Draw peaks from hough image as lines into resized_img

% Hough Transformation Calculation:
% alpha = (a/alpha_steps * pi) - pi/2;
% P = [x;y];
% norm_from_alpha = [-sin(alpha) cos(alpha)];                 
% dist = abs(norm_from_alpha * (P-C));
% 
% img_dist = floor(dist * dist_steps / max_dist)+1;
% h_img(a,img_dist) = h_img(a,img_dist) + 1;


    hold on;

    %[alpha,dist] = find(hough_img == max(hough_img,[],'all'));
    [alpha,dist] = find(hough_img > max(hough_img,[],'all')/1.1);
    %[alpha,dist] = find(hough_img > 0);
    
    C = (size(resized_img)/2)';
    
    hough_img_size = size(hough_img);
    resized_img_size = size(resized_img);
    max_dist = norm((resized_img_size(1:2)+[1 1])./ 2);
        
    for i = 1:size(alpha,1)/100:size(alpha,1)
        a = alpha(floor(i));
        d  = dist(floor(i));
        a = (a / hough_img_size(1) * pi) - pi/2;
        d = (d / hough_img_size(2));
        d = (d * 2 * max_dist) - max_dist;
        
        P = d * [sin(a);-cos(a)];
               
        len = -500:100:500;
       
        point = len.*[cos(a);sin(a)] + repmat((C+P),size(len));
        
        line(point(2,:), point(1,:),'LineWidth',2);
    
    end
    
    hold off;
end

