im1 = imread('../images/im1.png');
im2 = imread('../images/im2.png');
im3 = imread('../images/im3.png');
im4 = imread('../images/im4.png');
im5 = imread('../images/im5.png');

work_img = im5; % change image here


subplot(1,3,1);
resized_image = imbinarize(imresize(work_img,1/1));
imshow(resized_image);

subplot(1,3,2);
title('Test');
hough_image = houghTransformation(resized_image, 200, 200);
colored_hough_image = normImage(hough_image);
imshow(colored_hough_image);

subplot(1,3,3);
imshow(resized_image)
drawHoughLines(hough_image, resized_image);
