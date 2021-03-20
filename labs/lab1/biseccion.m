function [xk, itera, err] = biseccion(a, b, tol, maxItera)
  if func(a) * func(b) >= 0
    error("No se satisface el teorema de Bolzano");
  end

  # Valor anterior de x
  xk_1 = a;
  # Valor actual de x
  xk = b;
  itera = 0;
  err = inf;

  while (tol < err && itera < maxItera)
    xk_1 = xk;

    # Calcular la siguiente aproximacion
    xk = (a + b) / 2;

    fa = func(a);
    fb = func(b);
    fxk = func(xk);

    # Calcular el error actual
    err = abs(fxk);
    itera += 1;

    # Verificar el nuevo intervalo
    if (fxk * fb < 0)
      a = xk;
    elseif (fxk * fa < 0)
      b = xk;
      # Se encontro la raiz
    else
      return;
    end
  end
end