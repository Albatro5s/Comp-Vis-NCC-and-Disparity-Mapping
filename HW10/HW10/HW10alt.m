%% Problem 1
I1 = im2double(imread('left.png'));
I2 = im2double(imread('right.png'));

A = stereoAnaglyph(I1,I2);
figure
imshow(A)
title('Red-Cyan composite view of the rectified stereo pair image')



disparityRange = [0 48];
disparityMap = disparitySGM(I1,I2,'DisparityRange',disparityRange,'UniquenessThreshold',20);

figure
imshow(disparityMap,disparityRange)
title('Disparity Map')
axis equal
colormap gray
colorbar