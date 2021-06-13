clear;
clc;
clf;

% Paso 1
a = 0;
b = 5;
n = 10;
h = 0.5;

Y0 = [3000 120];

% Paso 2 es la funcion definida en el archivo func1

% Paso 3
[W] = eulerMet(a, b, h, Y0);

% Paso 4
t = linspace(a, b, n + 1);

C = W(:, 1);
L = W(:, 2);

% Gráfica de C(t)
subplot(2, 1, 1);
stem(t, C);
title("Gráfica de la función C(t)");

% Gráfica de L(t)
subplot(2, 1, 2);
stem(t, L);
title("Gráfica de la función L(t)");

% Paso 5
