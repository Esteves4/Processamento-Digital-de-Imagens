%% Figura 10.4 - Detec��o de pontos isolados
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

%% Figura 10.5 - Detec��o de linhas.
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

%% Figura 10.7 - Detec��o de linhas em dire��es espec�ficas
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

%% Figura 10.16 - Ilustra��o da magnitude e do �ngulo (dire��o) do gradiente 2-D
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

%% Figura 10.17 - Ilustra��o da magnitude e do �ngulo (dire��o) do gradiente 2-D
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

%% Figura 10.18 - Ilustra��o da magnitude e do �ngulo (dire��o) do gradiente 2-D
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

%% Figura 10.19 - Ilustra��o da magnitude e do �ngulo (dire��o) do gradiente 2-D
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

%% Figura 10.36 - Limiariza��o
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

%% Figura 10.37 - Limiariza��o
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
%% Figura 10.39 - Limiariza��o global �tima usando o m�todo de Otsu.
home;
clear;
a = imread('../pics/chapter_10/Fig1039(a)(polymersomes).tif');

T = alg_thresh(a,10^-3);

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

%% Figura 10.40 - Suaviza��o e Limiariza��o global usando o m�todo de Otsu.
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

%% Figura 10.41 - Suaviza��o e Limiariza��o global usando o m�todo de Otsu.
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
%% Figura 10.42 - Gradiente para melhorar a limiariza��o global.
home;
clear;
a = imread('../pics/chapter_10/Fig1042(a)(septagon_small_noisy_mean_0_stdv_10).tif');
a = rescale(a);

[Gmag,Gdir] = imgradient(a);

level = prctile(Gmag,[99.7],'all');

c = imbinarize(Gmag,level);

d = immultiply(c,a);
d = rescale(d);

[counts,binLocations] = imhist(d);

counts(1) = 0;

level = otsuthresh(counts);

e = imbinarize(a, level);

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
stem(binLocations,counts, 'Marker','none');
subplot(2,3,6);
imshow(e, []);

%% Figura 10.45 - Limiariza��o global m�ltipla
home;
clear;
a = imread('../pics/chapter_10/Fig1045(a)(iceberg).tif');
a = rescale(a);

level = multithresh(a,2);
c = imquantize(a,level);

figure; 
subplot(1,3,1);
imshow(a, []);
subplot(1,3,2);
imhist(a)
subplot(1,3,3);
imshow(c, []);

%% Figura 10.46 - Limiariza��o vari�vel por meio de particionamento da imagem.
home;
clear;
a = imread('../pics/chapter_10/Fig1046(a)(septagon_noisy_shaded).tif');
a = rescale(a);

T = alg_thresh(a,10^-3);
c = imquantize(a,T);

level = graythresh(a);
d = imquantize(a,level);

[m,n] = size(a);

m = ceil(m/2);
n = ceil(n/3);

fun = @(block_struct) imquantize(block_struct.data,graythresh(block_struct.data));

f = blockproc(a,[m n],fun);

f = medfilt2(f);
f = rescale(f);
level = graythresh(f);
f = imquantize(f,level);


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
imshow(f, []);
% subplot(2,3,6);
% imshow(e, []);

%% Figura 10.51 - Segmenta��o por crescimento da regi�o
home;
clear;
a = imread('../pics/chapter_10/Fig1051(a)(defective_weld).tif');

c = imquantize(a,254);
c = rescale(c);

c = 1 - c;
[x,y] = find(c==0);

[m,n] = size(c);

d = zeros(m,n);

for i = 1:size(x)
    BW = grayconnected(c,x(i),y(i));
    d = d + bwmorph(BW,'shrink',Inf);
end

d = imbinarize(d,0.1);

a = rescale(a);
c = rescale(c);
e = imabsdiff(a,c);
e = 1 - e;
c = 1 - c;
e = c + e;
e = 1 - e;
c = 1 - c;

level = multithresh(e,2);
g = imquantize(e,level);
h = imquantize(e,min(level));

[x,y] = find(d==1);

[m,n] = size(h);

i = zeros(m,n);
for j = 1:size(x)
    i = i + regiongrowing(1-h,x(j),y(j));
end

figure; 
subplot(3,3,1);
imshow(a, []);
subplot(3,3,2);
imhist(a)
subplot(3,3,3);
imshow(c, []);
subplot(3,3,4);
imshow(d);
subplot(3,3,5);
imshow(e, []);
subplot(3,3,6);
imhist(e);
subplot(3,3,7);
imshow(g,[]);
subplot(3,3,8);
imshow(h, []);
subplot(3,3,9);
imshow(i, []);

figure;
imshow(d);