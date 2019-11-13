function normed_img = normImage(img)
%NORMIMAGE create colored image rgb from grey image and show 0 values as black
    black_base = true;
    peak = max(img, [], 'all');
    color_map = hsv(peak);
    normed_img = ind2rgb(img,color_map);
    if black_base
        normed_img(img == 0) = 0;
    end
end

