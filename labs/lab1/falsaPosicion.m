function [xk, iter, err] = falsaPosicion(xk_2, xk_1, tol, iterMax)
  if func(xk_1) * func(xk_2) >= 0
    error("No se satisface el teorema de Bolzano");
  end

  iter = 0;
  % Valor actual de x
  xk = xk_1;
  err = inf;

  while (tol < err && iter < iterMax)
    % Evaluar funciones
    fxk_2 = func(xk_2);
    fxk_1 = func(xk_1);

    % Calcular el siguiente valor de x
    xk = xk_1 - fxk_1 * (xk_1 - xk_2) / (fxk_1 - fxk_2);
    fxk = func(xk);

    % Calcular el error
    err = abs(fxk);

    % Verificar el teorema de Bolzano para seleccionar el nuevo intervalo
    if (fxk * fxk_1 < 0)
      xk_2 = xk_1;
    end

    xk_1 = xk;

    iter += 1;
  end
end
