# Bisection method
# 
# Params:
# ------------------------------------------------------------------
#     - a: float.
#         left-bounded of the interval
#     - b: float
#         right-bounded of the interval
#     - func
#         lambda function representing the function to work
#     - error_func
#         lambdad function to compute the error
#     - tol: float
#         error value
#     - _iter: int
#         number of iterations
# 
# Returns
# ------------------------------------------------------------------
#     Approximation of x

clear;

function x = bisection (a, b, func, error_func, tol, iter)
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
    current_error = 1;

    while (tol < current_error && i < iter)
        # Save the previous approximation value
        xi_1 = x;
        # Compute the new approximation value
        x = (a + b) / 2;

        # Evaluate functions
        fa = func(a);
        fb = func(b);
        fx = func(x);

        # Compute the new error
        current_error = error_func(x, xi_1);

        # Show info
        if i > 0
            fprintf("%d\t%f\t%f\t%f\t%f\t%f\t%f\t-\n",
                 i, a, b, fa, fb, x, fx);
        else
            fprintf("%d\t%f\t%f\t%f\t%f\t%f\t%f\t%f\n",
                 i, a, b, fa, fb, x, fx, current_error);
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

# Function to work
func = @(x) e^x - sin(3*x) - 2;
# Error function
error_func = @(xi, xi_1) abs(xi - xi_1);

# Compute with the bisection method
xi = bisection (0, 1, func, error_func, 0.05, 100)
disp(xi);
