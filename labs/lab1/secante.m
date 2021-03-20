function [xk, itera, err] = secante(x0, x1, tol, iterMax)
  err = inf;
  itera = 0;
  xk_2 = x0;
  xk_1 = x1;

  while (err > tol && itera < iterMax)
    % Aumentar en uno la iteracion actual
    itera += 1;

    % Calcula el siguiente xi
    xk = xk_1 - func(xk_1) * (xk_1 - xk_2) / (func(xk_1) - func(xk_2));

    % Calcular el error
    err = abs(func(xk));

    % Guardar los valores para la siguiente iteracion
    xk_2 = xk_1;
    xk_1 = xk;
  end
end
