img = imread("ee3tp3picture2023.jpg");

r = img(:,:,1);
g = img(:,:,2);
b = img(:,:,3);

r_scale = 4.92;
g_scale = 4.53;

rec_r = r*r_scale;
rec_g = g*g_scale;

reconstructed_image = cat(3, rec_r, rec_g, b);

tiledlayout(2,1);
nexttile;
imshow(img);
nexttile;
imshow(reconstructed_image);

%imwrite(reconstructed_image, "my_fixed_image.jpg");