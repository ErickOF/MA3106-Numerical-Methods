clear;
clc;

syms x

warning('off', 'all');

% Trazador cubico natural de la funcion
func = @(x) x .* cos(x) .+ x.^2 .- 1 ./ x;

% Utilizando los puntos
x = 1:6;
y = func(x);

% Paso 1: Generar una matriz A, utilizando la funcion de la
% Pregunta 2 con n = 6
n = 6;

A = tridiagonal(n);

% Paso 2: Generar un vector w, utilizando la funcion de la
% Pregunta 3 con y = [y1, y2, y3, y4, y5, y6] y h = 1
h = 1;
w = vector_eq(y, h);

% Paso3: Resolver el sistema Az = w, utilizando el metodo de
% Eliminacion Gaussiana o la factorizacion de Cholesky
z = ElimGauss_Piv(A, w, 1);

% Paso 4: Crear los parametros aj, bj, cj, dj, utilizando las
% formulas para j = 1,..., 5.
colors = [1 0 0; 0 1 0; 0 0 1; 1 1 0; 0 1 1];

hold on;

for j = 1:5
    a = z(j + 1) / (6 * h);
    b = z(j) / (6 * h);
    c = y(j + 1) / h - z(j + 1) * h / 6;
    d = y(j) / h - z(j) * h / 6;

    f = func_cubica(a, b, c, d, x(j), x(j + 1));

    % Paso 5: Construir los trazadores cubicos naturales f1,...,f2,
    % utilizando la funcion de la Pregunta 5, y graficar en cada
    % subintervalo. Cada funcion fj debe estar graficada con un color
    % diferente
    ezPlotj = ezplot(f, [x(j) x(j + 1)]);
    set(ezPlotj, 'color', colors(j, :));
    set(ezPlotj, 'LineWidth', 2);
end

title('f(x) = xcos(x) + x^2 - 1/x');
xlabel('Eje x');
ylabel('Eje y');

ezPlot1 = ezplot('x * cos(x) + x^2 - 1 / x', [1, 6]);
set(ezPlot1, 'color', [0 0 0]);

grid on;
