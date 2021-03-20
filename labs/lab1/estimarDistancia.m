clear;

format long;

% Parametros generales de las funciones
errFunc = @(dk, dk_1) abs(dk - dk_1);
tol = 10e-8;
iterMax = 1000;

% Metodo de la biseccion
disp("Metodo de Biseccion");
a = 6
b = 6.5
[dkBis, iteraBis, errorBis] = biseccion(a, b, tol, iterMax)

% Metodo de la secante
disp("\nMetodo de la Secante");
x0 = 6
x1 = 6.5
[dkSec, iteraSec, errorSec] = secante(x0, x1, tol, iterMax)

% Metodo de falsa posicion
disp("\nMetodo de Falsa Posicion");
x0 = 6
x1 = 6.5
[dkFP, iteraFP, errorFP] = falsaPosicion(x0, x1, tol, iterMax)

% Metodo de Steffensen
disp("\nMetodo de Steffensen");
x0 = 6
[dkSt, iteraSt, errorSt] = steffensen(x0, tol, iterMax)

% Metodo de Muller
disp("\nMetodo de Muller");
x0 = 6.25
x1 = 6.5
x2 = 6
[dkMu, iteraMu, errorMu] = muller(x0, x1, x2, tol, iterMax)
