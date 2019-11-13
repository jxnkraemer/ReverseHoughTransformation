im1 = imread('../images/im1.png');
im2 = imread('../images/im2.png');
im3 = imread('../images/im3.png');
im4 = imread('../images/im4.png');
im5 = imread('../images/im5.png');
im6 = zeros(512,512);im6(256,256) = 255;%im6(256,256) = 255;im6(1,512) = 255;
im7 = ones(128,128) * 255;

work_img = im4; % change image here

subplot(2,3,1);
resized_image = imbinarize(imresize(work_img,1/16));
imshow(resized_image);
hough_image = houghTransformation(resized_image, 200, 200);
subplot(2,3,4);
imshow(hough_image);

%reverse_image = reverseHoughTransformation(hough_image, size(resized_image));
%subplot(3,3,7);
%imshow(reverse_image);

resized_image = imresize(work_img,1/2);
hough_image = houghTransformation(resized_image, 200, 200);
hough_test = hough_image;
subplot(2,3,2);
imshow(imbinarize(resized_image));
drawHoughLines(hough_image, resized_image);

subplot(2,3,5);
hough_image = normImage(hough_image);
imshow(hough_image);

subplot(2,3,3);
resized_image = imresize(work_img,1/1);
imshow(imbinarize(resized_image,0.1));
hough_image = houghTransformation(resized_image, 512, 512);
subplot(2,3,6);
imshow(hough_image);


% --------------------------------------------

    

