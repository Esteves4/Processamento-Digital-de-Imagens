%% Figura 2.21 - Variação do número de níveis de intensidade em uma imagem digital.
home;
clear;
src = imread('../pics/chapter_2/Fig0221(a)(ctskull-256).tif');

b = uint8(floor(double(src)/2));
c = uint8(floor(double(src)/4));
d = uint8(floor(double(src)/8));
e = uint8(floor(double(src)/16));
f = uint8(floor(double(src)/32));
g = uint8(floor(double(src)/64));
h = uint8(floor(double(src)/128));

figure; 
subplot(2,4,1);
imshow(src, [])
subplot(2,4,2);
imshow(b, [])
subplot(2,4,3);
imshow(c, [])
subplot(2,4,4);
imshow(d, [])
subplot(2,4,5);
imshow(e, [])
subplot(2,4,6);
imshow(f, [])
subplot(2,4,7);
imshow(g, [])
subplot(2,4,8);
imshow(h, [])

%% Figura 2.26 - Adição(para cálculo da média) de imagens ruidosas para a redução de ruídos.
home;
clear;
img = imread('../pics/chapter_2/Fig0226(galaxy_pair_original).tif');

k = [1 5 10 20 50 100];
figure;
for i=1:length(k)
  img_ruido = uint16(zeros(size(img)));
  
  for j=1:k(i)
    %Simula o ruído
    img_ruido = img_ruido + uint16(imnoise(img,'gaussian',0,(64/256)^2));
  end
  
  subplot(2,3,i)
  imshow(uint8(img_ruido/k(i)))
end

%% Figura 2.27 - Subtração de imagens para realce de diferenças
home;
clear;
src = imread('../pics/chapter_2/Fig0227(a)(washington_infrared).tif');

b = bitset(src,1,0);
c = imabsdiff(src,b);
c = rescale(c);

figure; 
subplot(1,3,1);
imshow(src);
subplot(1,3,2);
imshow(b);
subplot(1,3,3);
imshow(c);

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

%% Figura 2.28 - Imagens de Raio X
home;
clear;
src_a = imread('../pics/chapter_2/Fig0228(a)(angiography_mask_image).tif');
src_b = imread('../pics/chapter_2/Fig0228(b)(angiography_live_ image).tif');

c = double(src_a) - double(src_b);
c = 1 - c;
c = mat2gray(c);

d = c - 100/255;

figure; 
subplot(2,2,1);
imshow(src_a);
subplot(2,2,2);
imshow(src_b);
subplot(2,2,3);
imshow(c);
subplot(2,2,4);
imshow(d);

%% Figura 2.29 - Correção de sombreamento
home;
clear;
src = imread('../pics/chapter_2/Fig0229(a)(tungsten_filament_shaded).tif');
mask = imread('../pics/chapter_2/Fig0229(b)(tungsten_sensor_shading).tif');
 
c = imdivide(double(src),double(mask));

figure; 
subplot(1,3,1);
imshow(src);
subplot(1,3,2);
imshow(mask);
subplot(1,3,3);
imshow(c);

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

%% Figura 2.36 - Rotação da imagem e interpolação de intensidade.
home;
clear;
src = imread('../pics/chapter_2/Fig0236(a)(letter_T).tif');

b = imrotate(src, -21, 'nearest');
c = imrotate(src, -21, 'bilinear');
d = imrotate(src, -21, 'bicubic');

figure; 
subplot(1,4,1);
imshow(src);
subplot(1,4,2);
imshow(b);
subplot(1,4,3);
imshow(c);
subplot(1,4,4);
imshow(d);

%% 2.40 - Processamento de imagens no domínio da transformada
home;
clear;
src = imread('../pics/chapter_2/Fig0240(a)(apollo 17_boulder_noisy).tif');

[M,N] = size(src);

H2 = lpfilter('gaussian', M, N, 40);
H2 = fftshift(H2);

F = fft2(double(src), size(H2,1), size(H2,2));
F = fftshift(F);
mag_src = log(1+abs(F));

G1 = H2.*F;

d = mat2gray(real(ifft2(ifftshift(G1))));

figure; 
subplot(2,2,1);
imshow(src, []);
subplot(2,2,2);
imshow(mag_src, []);
subplot(2,2,3);
imshow(H2, []);
subplot(2,2,4);
imshow(d);