% Restart
clear;
clc;

% Only when running on PC
pkg load symbolic;

syms x

warning('off', 'all');

% Function to approximate
func = x + 2 / x
% X to approximate
xApprox = 1.5
% Degree of a polynomial
n = 2
% Points
x0 = [1 2 2.5]
% Max and min
xMax = max(x0)
xMin = min(x0)

M = []

% Get derivatives
printf("\nDerivadas:\n");

for _ = 1:n + 1
    func = diff(func)
end

% Critical Points
printf("\nPuntos criticos:\n");

dx = diff(func)
dxZeros = solve(dx)
numberOfZeros = length(dxZeros);

if numberOfZeros > 0

    for index = 1:numberOfZeros
        M(end + 1) = abs(double(subs(func, x, dxZeros(index))))
    end

end

% Intervals
printf("\nSubstituir intervalo:\n");

M(end + 1) = abs(double(subs(func, x, xMin)));
M(end + 1) = abs(double(subs(func, x, xMax)))

% Compute error function
printf("\nCalcular funcion de error:\n");

MMax = max(M)

errorFunc = 1;

for index = 1:n + 1
    errorFunc *= (x - x0(index));
end

errorFunc *= MMax / factorial(n + 1)
abs(double(subs(errorFunc, x, xApprox)))
