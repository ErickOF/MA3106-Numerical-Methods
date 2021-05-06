% Restart
clear;
clc;

% Only when running on PC
pkg load symbolic;

syms x

warning('off', 'all');

func = e^(-x^2)
x0 = 0
xn = 2
n = 164

M = [];

% Get derivatives
printf("\nDerivadas:\n");

printf("f\'(x) = \n");
func = expand(diff(func))
printf("f\'\'(x) = \n");
func = expand(diff(func))

% Critical Points
printf("\nPuntos criticos:\n");
printf("f\'\'\'(x) = \n");
dx = expand(diff(func))
dxZeros = solve(dx)
numberOfZeros = length(dxZeros);

printf("Descartando ceros\n");
finalDxZeros = [];

xMin = (x0 < xn) * x0 + (x0 >= xn) * xn;
xMax = (x0 > xn) * x0 + (x0 <= xn) * xn;

for index = 1:numberOfZeros
    xi = dxZeros(index);

    if (!(xMin <= xi && xi <= xMax))
        xi
        printf("fuera del intervalo\n");
    elseif (xMin == xi)
        xi
        printf("igual al intervalo menor\n");
    elseif (xi == xMax)
        xi
        printf("igual al invervalo mayor\n");
    else
        xi
        printf("%f es valido\n");
        finalDxZeros(end + 1) = double(xi);
    end

end

printf("\nPuntos criticos restantes:\n");
dxZeros = finalDxZeros
numberOfZeros = length(dxZeros);

if numberOfZeros > 0

    for index = 1:numberOfZeros
        M(end + 1) = abs(double(subs(func, x, dxZeros(index))))
    end

end

% Intervals
printf("\nSubstituir intervalo menor y mayor:\n");

M(end + 1) = double(subs(func, x, xMin));
M(end + 1) = double(subs(func, x, xMax))

% Compute error function
printf("\nCalcular funcion de error:\n");

MMax = max(abs(M))

h = (xn - x0) / n
trError = MMax * ((xn - x0) * h ^ 2) / 12
