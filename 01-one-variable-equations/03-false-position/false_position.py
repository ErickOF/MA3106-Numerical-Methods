from math import pow, exp, sin, cos, tan, pi
from typing import Tuple


def false_position_method(xi_1: float,
                  xi: float,
                  func=None,
                  error_func=None,
                  error: float = 1e-10,
                  _iter: int = 9e10) -> Tuple[float, float, int]:
    """False position method

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
    # Check Bolzano Theorem
    if func(a) * func(b) >= 0:
        raise ValueError("Do not satisfy the Bolzano Theorem")

    # Current iteration
    i: int = 0
    # Current value of x
    x: float = xi
    # Current error of the approximation
    current_error: float = error_func(xi_1, xi)

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

        # Compute the new error
        current_error = error_func(x, xi)
        print(current_error if i > 0 else '-')

        # Check Bolzano Theorem
        if fx * fxi < 0:
            # Save the previous approximation value
            xi_1 = xi

        # Save the current approximation value
        xi = x

        i += 1

    return x, current_error, i


if __name__ == '__main__':
    # Function to work
    func = lambda x: pow(x, 2) - cos(x) - 1
    # Error function
    error_func = lambda xi, xi_1: abs(xi - xi_1) / abs(xi)

    # Compute with the false position method
    xi, error, i = false_position_method(1, 2, func, error_func, _iter=5)
    print(f"La aproximacion de x es {xi} y tomo {i} iteraciones con un error de {error}")
