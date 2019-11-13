im1 = imread('../images/im1.png');
im2 = imread('../images/im2.png');
im3 = imread('../images/im3.png');
im4 = imread('../images/im4.png');
im5 = imread('../images/im5.png');
im6 = imread('../images/im6.png');
im7 = imread('../images/im7.png');
im8 = imread('../images/im8.png');

im9 = zeros(32,32);im9(16,16) = 255;
im10 = ones(128,128) * 255;

work_img = im5; % change image here

% plot image
subplot(2,3,4);
resized_image = imbinarize(imresize(work_img,1/8));
title(['Original Image black-white']);
imshow(resized_image);

% plot Hough Transformation
subplot(2,3,5);
hough_ratio = 8;
alpha_res = hough_ratio * size(resized_image,1);
dist_res  = hough_ratio * size(resized_image,2);
hough_image = houghTransformation(resized_image, alpha_res, dist_res);
title(['Hough Transformed Image']);
imshow(hough_image);

subplot(2,3,2);
hough_colored_image = normImage(hough_image);
title(['Colorized Hough Transformed Image - accumulator colorized']);
imshow(hough_colored_image);


% plot Reverse Image
subplot(2,3,3);
reverse_ratio = 1; % ratio to original image
reverse_image = reverseHoughTransformation(hough_image, reverse_ratio * size(resized_image));

colored_reverse_image = normImage(reverse_image);

title(['Reverse Hough Transformed Image with Confidence Colors']);
imshow(colored_reverse_image);

subplot(2,3,6);
threshold_image = reverse_image;
threshold_image(threshold_image < 150) = 0;
threshold_image = imbinarize(threshold_image);
title(['Reverse Hough Transformed Image with 100% Confidence black-white']);
imshow(threshold_image);

disp("Finsihed");
