syms A B C D

format short g;

warning('off', 'all');

% Parametros de la cuadratura
params = [A B C D]
% Grado de la derivada de cada funcion de la cuadratura
% Poner cero si no hay que derivar
derivatives = [1 0 1 0]
% Valores para evaluar cada funcion de la cuadratura
vals = [0 1 2 3]
% Intervalo
low = 0
high = 3

[qp] = GaussianQuadrature(low, high, derivatives, vals, params);

format rat;

printf("Los parametros formato fraccion son: \n");
qp

format short g;
printf("Los parametros formato decimal son: \n");
qp

printf("\nAproximar funcion\n");

syms x

f = sin((x + 3) / 3) / (x + 6)

funcParams = [];

for i = 1:length(params)
    printf("Funcion %d\n", i);
    func = diff(f, x, derivatives(i))
    funcParams(i) = double(subs(func, vals(i)));
end

printf("Resultado\n");
funcParams, qp
I = sum(funcParams * qp)
