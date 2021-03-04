from math import pow, exp, sin, cos, tan, pi


def bisection_method(a: float,
                     b: float,
                     func=None,
                     error_func=None,
                     error: float = 1e-10,
                     _iter: int = 9e10):
    """Bisection method

    Params:
    ------------------------------------------------------------------
        - a: float.
            left-bounded of the interval
        - b: float
            right-bounded of the interval
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
        Approximation of x
    """
    # Check Bolzano Theorem
    if func(a) * func(b) >= 0:
        raise ValueError("Do not satisfy the Bolzano Theorem")

    # Current iteration
    i: int = 0
    # Previous value of x
    xi_1:  float = a
    # Current value of x
    x: float = b
    # Current error of the approximation
    current_error: float = 1

    while (error < current_error and i < _iter):
        # Save the previous approximation value
        xi_1 = x
        # Compute the new approximation value
        x = (a + b) / 2

        # Evaluate functions
        fa: float = func(a)
        fb: float = func(b)
        fx: float = func(x)

        # Compute the new error
        current_error = error_func(x, xi_1)

        # Show info
        print(i, a, b, fa, fb, x, fx, current_error if i > 0 else "-", sep="\t")

        # Check intervals
        if (fx * fb < 0):
            a = x
        elif (fx * fa < 0):
            b = x
        # Root was found
        else:
            return x

        i += 1

    # Current approximation of x
    return x


if __name__ == '__main__':
    # Function to work
    func = lambda x: exp(x) - sin(3*x) - 2
    # Error function
    error = lambda xi, xi_1: abs(xi - xi_1)

    # Compute with the bisection method
    xi = bisection_method(0, 1, func, error, 0.05)
    print(f"La aproximacion de x es {xi}")
