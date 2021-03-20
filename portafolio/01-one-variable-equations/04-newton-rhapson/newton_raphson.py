from math import exp, sin, cos, tan, pi
from scipy import misc
from typing import Tuple


def newton_raphson_method(x0: float,
                          func=None,
                          error_func=None,
                          error: float = 1e-10,
                          _iter: int = 9e10) -> Tuple[float, float, int]:
    """Newton-Raphson method

    Params:
    ------------------------------------------------------------------
        - x0: float.
            initial value of x
        - func
            lambda function representing the function to work
        - error_func
            lambda function to compute the error
        - error: float
            error value
        - _iter: int
            number of iterations

    Returns
    ------------------------------------------------------------------
        - Approximation of x
        - Error
        - Number of iterations
    """
    # Valor incial de x
    xk: float = x0
    i: int = 0

    # Current error of the approximation
    current_error: float = 1.0

    while (error < current_error and i < _iter):
        # Get x in the iteration k - 1
        xk_1 = xk
        # Evaluating the function
        fxk_1 = func(xk)

        # Derivating and evaluating the function
        dfxk_1 = misc.derivative(func, xk_1, dx=1e-6)

        # Current approximation of x
        xk = xk - fxk_1 / dfxk_1

        # New error
        current_error = error_func(xk, xk_1)

        # Show info
        print(i + 1, xk_1, fxk_1, dfxk_1, xk,
              current_error if i > 0 else "-", sep="\t")

        i += 1

    return xk, current_error, i


if __name__ == '__main__':
    # Initial value
    x0 = 1.5
    # Tolerance / error
    tol = 0.0001
    # Function to work
    func = lambda x: pow(x, 2) - cos(x) - 1
    # Error function
    error_func = lambda xi, xi_1: abs(xi - xi_1) / abs(xi)

    # Compute with the false position method
    xi, error, i = newton_raphson_method(x0, func, error_func, tol, _iter=5)
    print(
        f"La aproximacion de x es {xi} y tomo {i} iteraciones con un error de {error}")
