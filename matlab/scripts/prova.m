%% Figura 2.32 - Operações de conjuntos envolvendo intensidades de imagem
home;
clear;
src = imread('../pics/chapter_2/Fig0232(a)(partial_body_scan).tif');

const = uint8(ones(size(src))*70);

b = 255 - src;
c = max(src, const);

figure; 
subplot(1,3,1);
imshow(src);
subplot(1,3,2);
imshow(b);
subplot(1,3,3);
imshow(c);

%% 3.25 - Especificação de histograma
home;
clear;
src = imread('../pics/chapter_3/Fig3.20(a).jpg');

% Função de saida
T = ones(1,256);

T(1:127) = linspace(0,10,127);
T(127:200) = linspace(10, 120, 74);
T(200:256) = linspace(120, 256, 57);

T = rescale(T,0,255);


% Histograma especificado
binLocations = linspace(0,255,256);
counts = zeros(256,1);

counts(1:15) = linspace(0,7*10^4,15);
counts(15:28) = linspace(7*10^4, 1.31*10^4,14);
counts(28:190) = linspace(1.31*10^4, 0, 163);
counts(190:194) = linspace(0, 1.31*10^4, 5);
counts(194:256) = linspace(1.31*10^4, 0, 63);

% Imagem equalizada
imgeq = histeq(src);

[M,N] = size(src);
src = uint8(src)+1;

for i = 1:M
    for j = 1:N
        imgeq(i,j) = T(imgeq(i,j));
    end
end

figure;
subplot(2,3,1);
stem(binLocations,counts, 'Marker','none');
subplot(2,3,2);
plot(0:255,T);
subplot(2,3,3);
imhist(imgeq);
subplot(2,3,4);
imshow(imgeq);

%% Figura 3.38 - Aguçamento de imagens utilizando o laplaciano.
home;
clear;
src = imread("../pics/chapter_3/Fig3.40(a).jpg");

m_a = [[0,1,0], [1,-4,1],[0,1,0]];
m_b = [[1,1,1], [1,-8,1],[1,1,1]];

b = conv2(double(src), m_a, 'same');

% Filtro sugerido
c = b - min(min(b));
c = 255*(c/max(max(c)));

b = uint8(b);
c = uint8(c);

d = src + b;
e = src + uint8(conv2(double(src), m_b, 'same'));

figure; 
subplot(2,3,1);
imshow(src);
subplot(2,3,2);
imshow(b);
subplot(2,3,3);
imshow(c);
subplot(2,3,4);
imshow(d);
subplot(2,3,5);
imshow(e);

%% Figura 4.27 - Propriedades do espectro de Fourier
home;
clear;
src = imread("../pics/chapter_4/Fig0427(a)(woman).tif");
rectangle = imread("../pics/chapter_4/Fig0424(a)(rectangle).tif");

[M,N] = size(rectangle);

% Fourier da imagem e retangulo
dft = fft2(src,M,N);
dft_rect = fft2(rectangle);

% Construindo imagem só com angulo
fftB = 1.*exp(i*angle(dft));
imageC = real(ifft2(fftB));

% Espectro da imagem
espectro = log(1+abs(fftshift(dft)));
%imageC = abs(imageB);
imageC = imageC(1:size(src,1), 1:size(src,2));

% Imagem com espectro do rectangulo
fftE = abs(dft_rect).*exp(i*angle(dft));
imageE = ifft2(fftE);
imageE = imageE(1:size(src,1), 1:size(src,2));

% Imagem com anuglo do rectangulo
fftF = abs(dft).*exp(i*angle(dft_rect));
imageF = ifft2(fftF);

figure; 
subplot(2,3,1);
imshow(src);
subplot(2,3,2);
imshow(angle(dft),[-pi,pi]);
subplot(2,3,3);
imshow(imageC,[]);
subplot(2,3,4);
imshow(espectro, []);
subplot(2,3,5);
imshow(imageE, []);
subplot(2,3,6);
imshow(imageF, []);

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
