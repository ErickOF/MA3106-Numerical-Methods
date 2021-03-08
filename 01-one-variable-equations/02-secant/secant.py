from math import pow, exp, sin, cos, tan, pi
from typing import Tuple


def secant_method(xi_1: float,
                  xi: float,
                  func=None,
                  error_func=None,
                  error: float = 1e-10,
                  _iter: int = 9e10) -> Tuple[float, float, int]:
    """Secant method

    Params:
    ------------------------------------------------------------------
        - xi_1: float.
            first initial value of x
        - xi: float
            second initial value of x
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

    # Current iteration
    i: int = 1
    # Current value of x
    x: float = xi
    # Current error of the approximation
    current_error: float = 1.0

    while (error < current_error and i < _iter):
        # Evaluate function
        fxi_1: float = func(xi_1)
        fxi: float = func(xi)

        # Compute the tangent line
        m = (fxi - fxi_1) / (xi - xi_1)
        b = fxi - m*xi

        # Compute the new approximation value
        x = -b / m
        fx = func(x)

        # Show info
        print(i + 1, xi_1, fxi_1, xi, fxi, x, fx, f'<y = {m}x + {b}>', sep="\t", end="\t")

        # Save the previous approximation value
        xi_1 = xi
        # Save the current approximation value
        xi = x

        # Compute the new error
        current_error = error_func(xi_1, xi)
        print(current_error)

        i += 1

    return x, current_error, i


if __name__ == '__main__':
    # Function to work
    func = lambda x: x*cos(1 + x)
    # Error function
    error_func = lambda xi, xi_1: abs(xi - xi_1)

    # Compute with the secant method
    xi, error, i = secant_method(-4, -2, func, error_func, _iter=5)
    print(
        f"La aproximacion de x es {xi} y tomó {i} iteraciones con un error de {error}")
