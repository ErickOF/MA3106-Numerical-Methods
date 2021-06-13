% Parte 4 Lab3
t1 = 1;
C(t1) = 1;
t2 = 1;
L(t2) = 1;

% Gráfica de C(t)
subplot(2, 1, 1)
stem(t1, C)
title("Gráfica de la función C(t)")

% Gráfica de L(t)
subplot(2, 1, 2)
stem(t2, L)
title("Gráfica de la función L(t)")
