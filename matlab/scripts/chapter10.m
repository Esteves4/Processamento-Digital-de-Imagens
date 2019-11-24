%% Figura 10.4 - Detecção de pontos isolados
home;
clear;
src = imread('../pics/chapter_10/Fig1004(b)(turbine_blade_black_dot).tif');

mask = [[1,1,1]; [1,-8,1]; [1,1,1]];

c = conv2(src, mask);

[rows, cols] = size(c);

d = zeros([rows, cols]);

T = 0.9*max(abs(c(:)));

for x = 1:rows
    for y = 1:cols
        if abs(c(x,y)) >= T
            d(x,y) = 1;
        end
    end
end

figure; 
subplot(1,3,1);
imshow(src, []);
subplot(1,3,2);
imshow(c, []);
subplot(1,3,3);
imshow(d,[]);

%% Figura 10.5 - Detecção de linhas.
home;
clear;
src = imread('../pics/chapter_10/Fig1005(a)(wirebond_mask).tif');

mask = [[0, 1, 0]; [1, -4, 1]; [0, 1, 0]];

b = conv2(src, mask);
c = abs(b);
d = b;
d(d<0) = 0;

figure; 
subplot(2,2,1);
imshow(src, []);
subplot(2,2,2);
imshow(b, []);
subplot(2,2,3);
imshow(c, []);
subplot(2,2,4);
imshow(d, []);

%% Figura 10.7 - Detecção de linhas em direções específicas
home;
clear;
src = imread('../pics/chapter_10/Fig1007(a)(wirebond_mask).tif');

mask = [[2, -1, -1]; [-1, 2, -1]; [-1, -1, 2]];

b = conv2(src, mask);
c = b;
c(c<0) = 0;

T = max(c(:));
d = c;
d(d < T) = 0;
d(d >= T) = 255;

figure; 
subplot(2,2,1);
imshow(src, []);
subplot(2,2,2);
imshow(b, []);
subplot(2,2,3);
imshow(c, []);
subplot(2,2,4);
imshow(d, []);

%% Figura 10.16 - Ilustração da magnitude e do ângulo (direção) do gradiente 2-D
home;
clear;
src = imread('../pics/chapter_10/Fig1016(a)(building_original).tif');
src = rescale(src);

mask = [[-1, -2, -1]; [0, 0, 0]; [1, 2, 1]];
mask2 = [[-1, 0, -1]; [-2, 0, 2]; [1, 0, 1]];

b = abs(conv2(double(src), mask, 'same'));
c = abs(conv2(double(src), mask2, 'same'));
d = c + b;

figure; 
subplot(2,2,1);
imshow(src);
subplot(2,2,2);
imshow(b);
subplot(2,2,3);
imshow(c);
subplot(2,2,4);
imshow(d);

%% Figura 10.17 - Ilustração da magnitude e do ângulo (direção) do gradiente 2-D
home;
clear;
src = imread('../pics/chapter_10/Fig1016(a)(building_original).tif');
src = rescale(src);

mask = [[-1, -2, -1]; [0, 0, 0]; [1, 2, 1]];
mask2 = [[-1, 0, -1]; [-2, 0, 2]; [1, 0, 1]];

gx = conv2(double(src), mask, 'same');
gy = conv2(double(src), mask2, 'same');

alfa = atan2(gy,gx);

figure; 
imshow(alfa, [])

%% Figura 10.18 - Ilustração da magnitude e do ângulo (direção) do gradiente 2-D
home;
clear;
src = imread('../pics/chapter_10/Fig1016(a)(building_original).tif');
src = rescale(src);

n = 5;
src = conv2(src, ones(n)/n^2,'same');

mask = [[-1, -2, -1]; [0, 0, 0]; [1, 2, 1]];
mask2 = [[-1, 0, -1]; [-2, 0, 2]; [1, 0, 1]];

b = abs(conv2(double(src), mask, 'same'));
c = abs(conv2(double(src), mask2, 'same'));
d = c + b;

figure; 
subplot(2,2,1);
imshow(src, []);
subplot(2,2,2);
imshow(b);
subplot(2,2,3);
imshow(c);
subplot(2,2,4);
imshow(d);

%% Figura 10.19 - Ilustração da magnitude e do ângulo (direção) do gradiente 2-D
home;
clear;
src = imread('../pics/chapter_10/Fig1016(a)(building_original).tif');
src = rescale(src);

n = 5;
src = conv2(src, ones(n)/n^2,'same');

mask = [[0, 1, 2]; [-1, 0, 1]; [-2, -1, 0]];
mask2 = [[-2, -1, 0]; [-1, 0, 1]; [0, 1, 2]];

b = abs(conv2(double(src), mask, 'same'));
c = abs(conv2(double(src), mask2, 'same'));

figure; 
subplot(1,2,1);
imshow(b);
subplot(1,2,2);
imshow(c);

%% Figura 10.36 - Limiarização
home;
clear;
a = imread('../pics/chapter_10/Fig1036(a)(original_septagon).tif');
b = imread('../pics/chapter_10/Fig1036(b)(gaussian_noise_mean_0_std_10_added).tif');
c = imread('../pics/chapter_10/Fig1036(c)(gaussian_noise_mean_0_std_50_added).tif');

figure; 
subplot(2,3,1);
imshow(a, []);
subplot(2,3,2);
imshow(b, []);
subplot(2,3,3);
imshow(c, []);
subplot(2,3,4);
imhist(a)
subplot(2,3,5);
imhist(b)
subplot(2,3,6);
imhist(c)

%% Figura 10.37 - Limiarização
home;
clear;
a = imread('../pics/chapter_10/Fig1037(a)(septagon_gaussian_noise_mean_0_std_10_added).tif');
b = imread('../pics/chapter_10/Fig1037(b)(intensity_ramp).tif');
c = rescale(immultiply(double(a),double(b)));

figure; 
subplot(2,3,1);
imshow(a, []);
subplot(2,3,2);
imshow(b);
subplot(2,3,3);
imshow(c, []);
subplot(2,3,4);
imhist(a)
subplot(2,3,5);
imhist(b)
subplot(2,3,6);
imhist(c)
%% Figura 10.39 - Limiarização global ótima usando o método de Otsu.
home;
clear;
a = imread('../pics/chapter_10/Fig1039(a)(polymersomes).tif');

T = mean(a);
T_old = 0;
deltaT = 10^-3;

while T - T_old >= deltaT
    T_old = T;
    
    G1 = a(a > T);
    G2 = a(a <= T);

    m1 = mean(G1);
    m2 = mean(G2);

    T = (m1 + m2)/2.0;
    
end

c = imquantize(a,T);
d = imbinarize(a);

figure; 
subplot(2,2,1);
imshow(a);
subplot(2,2,2);
imhist(a)
subplot(2,2,3);
imshow(c,[])
subplot(2,2,4);
imshow(d,[])

%% Figura 10.40 - Suavização e Limiarização global usando o método de Otsu.
home;
clear;
a = imread('../pics/chapter_10/Fig1040(a)(large_septagon_gaussian_noise_mean_0_std_50_added).tif');

level = multithresh(a);
c = imquantize(a,level);

n = 5;
d = conv2(a, ones(n)/n^2,'same');
d = rescale(d);

level = multithresh(d);
e = imquantize(d,level);

figure; 
subplot(2,3,1);
imshow(a, []);
subplot(2,3,2);
imhist(a)
subplot(2,3,3);
imshow(c, []);
subplot(2,3,4);
imshow(d, []);
subplot(2,3,5);
imhist(d)
subplot(2,3,6);
imshow(e, []);

%% Figura 10.41 - Suavização e Limiarização global usando o método de Otsu.
home;
clear;
a = imread('../pics/chapter_10/Fig1041(a)(septagon_small_noisy_mean_0_stdv_10).tif');

level = graythresh(a);
c = imbinarize(a,level);

n = 5;
d = conv2(a, ones(n)/n^2,'same');
d = rescale(d);

level = graythresh(d);
e = imbinarize(d,level);

figure; 
subplot(2,3,1);
imshow(a, []);
subplot(2,3,2);
imhist(a)
subplot(2,3,3);
imshow(c, []);
subplot(2,3,4);
imshow(d, []);
subplot(2,3,5);
imhist(d)
subplot(2,3,6);
imshow(e, []);

