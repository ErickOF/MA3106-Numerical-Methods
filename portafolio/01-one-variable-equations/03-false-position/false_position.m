%{
False position method

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
%}

clear;

function [x, currentError, i] = falsePosition (xi_1, xi, func, errorFunc, tol, maxIterations)
    # Check Bolzano Theorem
    if func(xi_1) * func(xi) >= 0
        error("Do not satisfy the Bolzano Theorem");
    endif

    # Current iteration
    i = 0;
    # Current value of x
    x = xi;
    # Current error of the approximation
    currentError = 1.0;

    while (tol < currentError && i < maxIterations)
        # Evaluate function
        fxi_1 = func(xi_1);
        fxi = func(xi);

        # Compute the secant line
        m = (fxi - fxi_1) / (xi - xi_1);
        b = fxi - m * xi;

        # Compute the new approximation value
        x = -b / m;
        fx = func(x);

        # Compute the new error
        currentError = errorFunc(x, xi);

        # Show info
        if i > 0
            printf("%d\t%f\t%f\t%f\t%f\t%f\t%f\t-\n",
                    i + 1, xi_1, fxi_1, xi, fxi, x, fx);
        else
            printf("%d\t%f\t%f\t%f\t%f\t%f\t%f\t%f\n",
                    i + 1, xi_1, fxi_1, xi, fxi, x, fx, currentError);
        endif

        # Check Bolzano Theorem
        if (fx * fxi < 0)
            # Save the previous approximation value
            xi_1 = xi
        endif

        # Save the current approximation value
        xi = x

        i += 1;
    endwhile
endfunction

# Main
# Interval
x0 = 1;
x1 = 2;
# Max number of iterations
maxIterations = 100;
# Tolerance / error
tol = 0.001;
# Function to work
func = @(x) x^2 - cos(x) - 1;
# Error function
errorFunc = @(xi, xi_1) abs(xi - xi_1) / abs (xi);

# Compute with the false position method
[xi, finalError, iterations] = falsePosition(x0, x1, func, errorFunc, tol, maxIterations);
printf("La aproximación de x es %f después de %d iteraciones con un error de %f\n", xi, iterations, finalError);
