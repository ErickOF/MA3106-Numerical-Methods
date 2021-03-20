%{
Fixed-Point method

@param x0 - initial value
@param func - lambda function representing the function to work
@param errorFunc - lambda function to compute the error
@param tol - tolerance of the algorithm / error
@param maxIter - max number of iterations

@return xk_1 - approximation of x
@return currentError - error
@return iterations - number of iterations
%}

clear;

function [xk_1, currentError, iterations] = fixedPoint (x0, func, errorFunc, tol, maxIter)
    # Current iteration
    iterations = 0;
    # Current value of x
    xk_1 = x0;
    # Current error of the approximation
    currentError = inf;

    while (tol < currentError && i < maxIter)

        # Evaluate functions
        xk = func(xk_1);

        # Compute the new error
        currentError = errorFunc(xk, xk_1);
        iterations += 1;

        # Show info
        if iterations == 1
            printf("%d\t%f\t%f\t-\n",
                 iterations, xk_1, xk);
        else
            printf("%d\t%f\t%f\t%f\n",
                 iterations, xk_1, xk, currentError);
        endif

        # Save previous value
        xk_1 = xk;
    endwhile
endfunction

# Main
# Initial value
x0 = 5;
# Max number of iterations
maxIter = 100;
# Tolerance / error
tol = 0.001;
# Function to work
func = @(x) -2*log(e^(-0.15*x) - 0.25);
# Error function
errorFunc = @(xi, xi_1) abs(xi - xi_1);

# Compute with the fixed point method
[xi, finalError, iterations] = fixedPoint(x0, func, errorFunc, tol, maxIter);
printf("La aproximación de x es %f después de %d iteraciones con un error de %f\n", xi, iterations, finalError);
