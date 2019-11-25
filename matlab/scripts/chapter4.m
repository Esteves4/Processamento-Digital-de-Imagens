%% Figura 4.17 - Ilustração do aliasing em imagens reamostradas.
home;
clear;
a = imread('../pics/chapter_4/Fig0417(a)(barbara).tif');

[rows, columns] = size(a);

b = imresize(a,[0.5*rows 0.5*columns], 'bilinear');

[row, col] = size(b);
r2 = row*2;
c2 = col*2;
I2 = zeros(r2,c2);
I2(1:2:r2, 1:2:c2) = b;
for i = 1:2:r2
    for j = 1:2:c2
        I2(i,j+1) = I2(i,j);
        I2(i+1,j) = I2(i,j);
        I2(i+1,j+1) = I2(i,j);
    end
end

b = I2;

n = 3;
c = conv2(a, ones(n)/n^2,'same');
c = imresize(c,[0.5*rows 0.5*columns], 'bilinear');


[row, col] = size(c);
r2 = row*2;
c2 = col*2;
I2 = zeros(r2,c2);
I2(1:2:r2, 1:2:c2) = c;
for i = 1:2:r2
    for j = 1:2:c2;
        I2(i,j+1) = I2(i,j);
        I2(i+1,j) = I2(i,j);
        I2(i+1,j+1) = I2(i,j);
    end
end

c = I2;

figure; 
subplot(1,3,1);
imshow(a, []);
subplot(1,3,2);
imshow(b, []);
subplot(1,3,3);
imshow(c, []);
%% Figura 4.31 - Ilustração do aliasing em imagens reamostradas.
home;
clear;
src = double(imread('../pics/chapter_4/Fig0431(d)(blown_ic_crop).tif'));

[rows, cols] = size(src);

H = lpfilter('gaussian', rows, cols, 8);
H2 = hpfilter('gaussian', rows, cols, 8);
H3 = hpfilter('gaussian', rows, cols, 8)+0.85;

F = fft2(src);

G = H.*F;
G2 = H2.*F;
G3 = H3.*F;

d = real(ifft2(G));
e = real(ifft2(G2));
f = real(ifft2(G3));

figure; 
subplot(1,3,1);
imshow(d, [])
subplot(1,3,2);
imshow(e, []);
subplot(1,3,3);
imshow(f, []);

%% Figura 4.32 - Ilustração do aliasing em imagens reamostradas.
home;
clear;
src = imread('../pics/chapter_4/Fig0432(a)(square_original).tif');

[rows, cols] = size(src);

PQ=paddedsize(size(src));

H = lpfilter('gaussian', rows, cols, 8);
H2 = lpfilter('gaussian', PQ(1),PQ(2) , 8);

F = fft2(src);
F2 = fft2(src,PQ(1),PQ(2));

G = H.*F;
G2 = H2.*F2;

b = mat2gray(real(ifft2(G)));
c = mat2gray(real(ifft2(G2)));
c=c(1:size(src,1),1:size(src,2));

figure; 
subplot(1,3,1);
imshow(src, [])
subplot(1,3,2);
imshow(b);
subplot(1,3,3);
imshow(c);

%% Figura 4.39 - Obtenção de um filtro no domínio da frequência
home;
clear;
src = imread('../pics/chapter_4/Fig0438(a)(bld_600by600).tif');
h = [[-1 0 -1], [ -2 0 2], [-1 0 1]];

PQ = paddedsize(size(src));

[rows, cols] = size(src);
f = double(padarray(src,[(PQ(1)-rows)/2 (PQ(2)-cols)/2]));

[rows, cols] = size(h);
h = padarray(h,[floor((PQ(1)-rows)/2) floor((PQ(2)-cols)/2)]);
h = padarray(h,[1 1],0,'pos');

F = fft2(f);
H = fft2(h);

G = H.*F;
    
H = fftshift(H);

imshow(abs(H), [])

%% Figura 4.41 - Espectro de Fourier
home;
clear;
src = imread('../pics/chapter_4/Fig0441(a)(characters_test_pattern).tif');

F = fft2(double(src));
F = fftshift(F);

espectro=log(1+abs(F)); 

figure; 
subplot(1,2,1);
imshow(src, [])
subplot(1,2,2);
imshow(espectro, []);

%% Figura 4.42 - ILPF
home;
clear;
src = imread('../pics/chapter_4/Fig0441(a)(characters_test_pattern).tif');

[rows, cols] = size(src);

H1 = lpfilter('ideal', rows, cols, 10);
H2 = lpfilter('ideal', rows, cols, 30);
H3 = lpfilter('ideal', rows, cols, 60);
H4 = lpfilter('ideal', rows, cols, 160);
H5 = lpfilter('ideal', rows, cols, 460);

F = fft2(double(src), size(H1,1), size(H1,2));

G1 = H1.*F;
G2 = H2.*F;
G3 = H3.*F;
G4 = H4.*F;
G5 = H5.*F;

b = mat2gray(real(ifft2(G1)));
c = mat2gray(real(ifft2(G2)));
d = mat2gray(real(ifft2(G3)));
e = mat2gray(real(ifft2(G4)));
f = mat2gray(real(ifft2(G5)));

b = b(1:size(src,1),1:size(src,2));
c = c(1:size(src,1),1:size(src,2));
d = d(1:size(src,1),1:size(src,2));
e = e(1:size(src,1),1:size(src,2));
f = f(1:size(src,1),1:size(src,2));

figure; 
subplot(3,2,1);
imshow(src)
subplot(3,2,2);
imshow(b)
subplot(3,2,3);
imshow(c)
subplot(3,2,4);
imshow(d)
subplot(3,2,5);
imshow(e)
subplot(3,2,6);
imshow(f)

%% Figura 4.45 - BLPF 
home;
clear;
src = imread('../pics/chapter_4/Fig0441(a)(characters_test_pattern).tif');

[rows, cols] = size(src);

H1 = lpfilter('btw', rows, cols, 10, 2);
H2 = lpfilter('btw', rows, cols, 30, 2);
H3 = lpfilter('btw', rows, cols, 60, 2);
H4 = lpfilter('btw', rows, cols, 160, 2);
H5 = lpfilter('btw', rows, cols, 460, 2);

F = fft2(double(src), size(H1,1), size(H1,2));

G1 = H1.*F;
G2 = H2.*F;
G3 = H3.*F;
G4 = H4.*F;
G5 = H5.*F;

b = mat2gray(real(ifft2(G1)));
c = mat2gray(real(ifft2(G2)));
d = mat2gray(real(ifft2(G3)));
e = mat2gray(real(ifft2(G4)));
f = mat2gray(real(ifft2(G5)));

b = b(1:size(src,1),1:size(src,2));
c = c(1:size(src,1),1:size(src,2));
d = d(1:size(src,1),1:size(src,2));
e = e(1:size(src,1),1:size(src,2));
f = f(1:size(src,1),1:size(src,2));

figure; 
subplot(3,2,1);
imshow(src)
subplot(3,2,2);
imshow(b)
subplot(3,2,3);
imshow(c)
subplot(3,2,4);
imshow(d)
subplot(3,2,5);
imshow(e)
subplot(3,2,6);
imshow(f)

%% 4.46 

H1 = fftshift(lpfilter('btw', 500, 500, 50, 1));
H2 = fftshift(lpfilter('btw', 500, 500, 50, 2));
H3 = fftshift(lpfilter('btw', 500, 500, 50, 5));
H4 = fftshift(lpfilter('btw', 500, 500, 50, 10));


figure; 
subplot(1,4,1);
imshow(H1)
subplot(1,4,2);
imshow(H2)
subplot(1,4,3);
imshow(H3)
subplot(1,4,4);
imshow(H4)

%% Figura 4.48 - GLPFs  
home;
clear;
src = imread('../pics/chapter_4/Fig0441(a)(characters_test_pattern).tif');

[rows, cols] = size(src);

H1 = lpfilter('gaussian', rows, cols, 10);
H2 = lpfilter('gaussian', rows, cols, 30);
H3 = lpfilter('gaussian', rows, cols, 60);
H4 = lpfilter('gaussian', rows, cols, 160);
H5 = lpfilter('gaussian', rows, cols, 460);

F = fft2(double(src), size(H1,1), size(H1,2));

G1 = H1.*F;
G2 = H2.*F;
G3 = H3.*F;
G4 = H4.*F;
G5 = H5.*F;

b = mat2gray(real(ifft2(G1)));
c = mat2gray(real(ifft2(G2)));
d = mat2gray(real(ifft2(G2)));
e = mat2gray(real(ifft2(G2)));
f = mat2gray(real(ifft2(G2)));

b = b(1:size(src,1),1:size(src,2));
c = c(1:size(src,1),1:size(src,2));
d = d(1:size(src,1),1:size(src,2));
e = e(1:size(src,1),1:size(src,2));
f = f(1:size(src,1),1:size(src,2));

figure; 
subplot(3,2,1);
imshow(src)
subplot(3,2,2);
imshow(b)
subplot(3,2,3);
imshow(c)
subplot(3,2,4);
imshow(d)
subplot(3,2,5);
imshow(e)
subplot(3,2,6);
imshow(f)
