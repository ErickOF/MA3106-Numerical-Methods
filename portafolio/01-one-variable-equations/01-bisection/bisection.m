%{
Bisection method

Params:
------------------------------------------------------------------
    - a: float.
        left-bounded of the interval
    - b: float
        right-bounded of the interval
    - func
        lambda function representing the function to work
    - error_func
        lambdad function to compute the error
    - tol: float
        error value
    - _iter: int
        number of iterations

Returns
------------------------------------------------------------------
    Approximation of x
    Error
    Number of iterations
%}

clear;

function [x, currentError, i] = bisection (a, b, func, errorFunc, tol, maxIterations)
    # Check Bolzano Theorem
    if func(a) * func(b) >= 0
        error("Do not satisfy the Bolzano Theorem");
    endif

    # Current iteration
    i = 0;
    # Previous value of x
    xi_1 = a;
    # Current value of x
    x = b;
    # Current error of the approximation
    currentError = 1.0;

    while (tol < currentError && i < maxIterations)
        # Save the previous approximation value
        xi_1 = x;
        # Compute the new approximation value
        x = (a + b) / 2;

        # Evaluate functions
        fa = func(a);
        fb = func(b);
        fx = func(x);

        # Compute the new error
        currentError = errorFunc(x, xi_1);

        # Show info
        if i > 0
            printf("%d\t%f\t%f\t%f\t%f\t%f\t%f\t-\n",
                 i, a, b, fa, fb, x, fx);
        else
            printf("%d\t%f\t%f\t%f\t%f\t%f\t%f\t%f\n",
                 i, a, b, fa, fb, x, fx, currentError);
        endif

        # Check intervals
        if (fx * fb < 0)
            a = x;
        elseif (fx * fa < 0)
            b = x;
        # Root was found
        else
            return;
        endif

        i += 1;
    endwhile
endfunction

# Main
# Interval
a = 0;
b = 1;
# Max number of iterations
maxIterations = 100;
# Tolerance / error
tol = 0.05;
# Function to work
func = @(x) e^x - sin(3*x) - 2;
# Error function
errorFunc = @(xi, xi_1) abs(xi - xi_1);

# Compute with the bisection method
[xi, finalError, iterations] = bisection(a, b, func, errorFunc, tol, maxIterations);
printf("La aproximación de x es %f después de %d iteraciones con un error de %f\n", xi, iterations, finalError);
