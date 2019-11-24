%% Figura 3.8 - Transformações de potência (gama)
home;
clear;
img = imread('../pics/chapter_3/Fig3.08(a).jpg');

img_b = imadjust(img,[],[],0.6);
img_c = imadjust(img,[],[],0.4);
img_d = imadjust(img,[],[],0.3);

% Resutado
subplot(2,2,1);
imshow(img)

subplot(2,2,2);
imshow(img_b)

subplot(2,2,3);
imshow(img_c)

subplot(2,2,4);
imshow(img_d)

%% Figura 3.12 - Fatiamento de niveis de intensidade
home;
clear;
% Lendo imagem
A = imread('../pics/chapter_3/Fig3.12(a)(kidney).tif');

% Efetuando o fatiamento de niveis de intensidade modo 1
B = imglevelB(150, 255, 235, A);

% Efetuando o fatiamento de niveis de intensidade modo 2
C = imglevelC(110, 145, 20, A);

% Resutado
subplot(1,3,1);
imshow(A)

subplot(1,3,2);
imshow(B)

subplot(1,3,3);
imshow(C)

%% Figura 3.14 - Fatiamento dos planos de Bits
home;
clear;
src = imread("../pics/chapter_3/Fig0314(a)(100-dollars).tif");

[line, colunm] = size(src);

subplot(3, 3, 1);

imshow(src);

total = src*0;

for i = 8:-1:1
  temp = bitget(src, i);
   
  temp = temp*(2^(i-1));
  
  total = total + temp;
    
  subplot(3, 3, i+1);
  imshow(double(temp));
  
end

%Somando os planos
figure;
imshow(total);

%% Figura 3.20 - Equalização de Histograma
home;
clear;
% Lendo imagens coluna da direita
A = imread('../pics/chapter_3/Fig0320(1)(top_left).tif');
B = imread('../pics/chapter_3/Fig0320(2)(2nd_from_top_).tif');
C = imread('../pics/chapter_3/Fig0320(3)(third_from_top).tif');

A_out = histeq(A);
B_out = histeq(B);
C_out = histeq(C);
D_out = histeq(C_out);


figure;
subplot(4,3,1);
imshow(A);
subplot(4,3,2);
imshow(A_out);
subplot(4,3,3);
imhist(A_out);

subplot(4,3,4);
imshow(B);
subplot(4,3,5);
imshow(B_out);
subplot(4,3,6);
imhist(B_out);

subplot(4,3,7);
imshow(C);
subplot(4,3,8);
imshow(C_out);
subplot(4,3,9);
imhist(C_out);

subplot(4,3,10);
imshow(C_out);
subplot(4,3,11);
imshow(D_out);
subplot(4,3,12);
imhist(D_out);

%% 3.26 - Equalização local de histograma
home;
clear;
src = imread("../pics/chapter_3/Fig0326(a)(embedded_square_noisy_512).tif");

%Img equalizada globalmente
src_eq = histeq(src);

%Img equalizada localmente
out_img = blkproc(src,[3 3], @histeq);

figure; 
subplot(1,3,1);
imshow(src);
subplot(1,3,2);
imshow(src_eq);
subplot(1,3,3);
imshow(out_img);

%% Figura 3.27 - Realce local utilizando estatísticas de histograma.
home;
clear;
src = imread("../pics/chapter_3/Fig0327(a)(tungsten_original).tif");


%Img equalizada globalmente
src_eq = histeq(src);

%Img equalizada estatisticamente
E = 4.0;
K0 = 0.4;
K1 = 0.02;
K2 = 0.4;

mean_g = mean2(src);
std_g = std2(src);

mean_xy = conv2(src, ones(3)/9, 'same');
std_xy = stdfilt(src);

[rows, columns] = size(src);

out_img = zeros(rows,columns);

for i = 1:rows
    for j = 1:columns
        
        if mean_xy(i,j) <= K0*mean_g && K1*std_g <= std_xy(i,j) <= K2*std_g
            out_img(i,j) = E*src(i,j);
        else
            out_img(i,j) = src(i,j);
        end
    end
end

out_img = uint8(out_img);

figure; 
subplot(1,3,1);
imshow(src);
subplot(1,3,2);
imshow(src_eq);
subplot(1,3,3);
imshow(out_img);

%% Figura 3.33 - Suavização de imagens
home;
clear;
src = imread("../pics/chapter_3/Fig3.35(a).jpg");

n = 3;
b = uint8(conv2(src, ones(n)/n^2,'same'));
n = 5;
c = uint8(conv2(src, ones(n)/n^2,'same'));
n = 9;
d = uint8(conv2(src, ones(n)/n^2,'same'));
n = 15;
e = uint8(conv2(src, ones(n)/n^2,'same'));
n = 35;
f = uint8(conv2(src, ones(n)/n^2,'same'));

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
subplot(2,3,6);
imshow(f);

%% Figura 3.34 - Suavização de imagens
home;
clear;
src = imread("../pics/chapter_3/Fig3.36(a).jpg");

n = 15;
b = uint8(conv2(src, ones(n)/n^2,'same'));

max_b = max(max(b));
threshold = 0.25*max_b;

[rows, columns] = size(b);

c = zeros(rows, columns);

for i = 1:rows
    for j = 1:columns
        
        if b(i,j) < threshold
            c(i,j) = 0;
        else
            c(i,j) = 1;
        end
        
    end
end

figure; 
subplot(1,3,1);
imshow(src);
subplot(1,3,2);
imshow(b);
subplot(1,3,3);
imshow(c);

%% Figura 3.35 - Utilização da filtragem de mediana para a redução de ruído
home;
clear;
src = imread("../pics/chapter_3/Fig3.37(a).jpg");

n = 3;
b = uint8(conv2(src, ones(n)/n^2,'same'));
c = medfilt2(src, [3 3]);

figure; 
subplot(1,3,1);
imshow(src);
subplot(1,3,2);
imshow(b);
subplot(1,3,3);
imshow(c);

%% Figura 3.38 - Aguçamento de imagens utilizando o laplaciano.
home;
clear;
src = imread("../pics/chapter_3/Fig3.40(a).jpg");

m_a = [[0,1,0], [1,-4,1],[0,1,0]];
m_b = [[1,1,1], [1,-8,1],[1,1,1]];

b = conv2(double(src), m_a, 'same');

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

%% Figura 3.42 - Utilização de gradiente para realce de borda.
home;
clear;
src = imread("../pics/chapter_3/Fig3.45(a).jpg");

[Gx,Gy] = imgradientxy(src);
b = abs(Gx) + abs(Gy);

figure; 
subplot(1,2,1);
imshow(src, []);
subplot(1,2,2);
imshow(b, []);

%% Figura 3.43 - Combinando métodos de realce espacial.
home;
clear;
src = imread("../pics/chapter_3/Fig3.46(a).jpg");

m_b = [[1,1,1], [1,-8,1],[1,1,1]];

b = conv2(double(src), m_b, 'same');
b = b - min(min(b));
b = 255*(b/max(max(b)));

c = imadd(double(src),b);

[Gx,Gy] = imgradientxy(src);
d = abs(Gx) + abs(Gy);

n = 5;
e = conv2(d, ones(n)/n^2,'same');

f = immultiply(c,e);
g = imadd(double(src),f);
h = imadjust(src,[],[],0.5);

figure; 
subplot(2,4,1);
imshow(src, []);

subplot(2,4,2);
imshow(b, []);

subplot(2,4,5);
imshow(c, []);

subplot(2,4,6);
imshow(d, []);

subplot(2,4,3);
imshow(e, []);

subplot(2,4,4);
imshow(f, []);

subplot(2,4,7);
imshow(g, []);

subplot(2,4,8);
imshow(h, []);
