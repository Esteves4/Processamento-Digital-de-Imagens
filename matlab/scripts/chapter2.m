%% Figura 3.8 - Transformações de potência (gama)
home;
clear;
a = imread('../pics/chapter_2/Fig0228(a)(mask).jpg');
b = imread('../pics/chapter_2/Fig0228(b)(angiography_live_ image).jpg');
c = imabsdiff(a,b);

figure; 
subplot(1,3,1);
imshow(a);
subplot(1,3,2);
imshow(b);
subplot(1,3,3);
imshow(c,[]);