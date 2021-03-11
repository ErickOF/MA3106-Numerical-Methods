
%{
Newton-Raphson method

@param x0 - initial value
@param func - lambda function representing the function to work
@param errorFunc - lambda function to compute the error
@param tol - tolerance of the algorithm / error
@param maxIter - max number of iterations

@return x - approximation of x
@return iterations - number of iterations
@return currentError - error
%}

clear;
close all;

% Only when running on PC
%pkg load symbolic;


function [xAprox, iterations, currentError] = newtonRaphson (x0, func, errorFunc, tol, maxIter)
    % Initial value of x
    xAprox = x0;
    % Current iterations
    iterations = 0;

    % Convert function to symbolic programming
    syms f(x);
    f(x) = func;
    % Derivate function
    df = diff(f);
    % Current error
    currentError = x0;
    
    % Repeat until x approaches the root of the function
    for _=1:maxIter
        % Save previous value
        xk_1 = xAprox;
        # Evaluate function
        fxk_1 = func(xk_1);
        # Evaluate in df/fx
        dfxk_1 = double(df(xk_1));

        % Update x value and the current iteration
        xAprox = xk_1 - fxk_1 / dfxk_1;

        % New error
        currentError = errorFunc(xAprox, xk_1);

        # Show info
        if iterations > 0
            printf("%d\t%f\t%f\t%f\t%f\t-\n",
                    iterations + 1, xk_1, fxk_1, dfxk_1, xAprox);
        else
            printf("%d\t%f\t%f\t%f\t%f\t%f\n",
                    iterations + 1, xk_1, fxk_1, dfxk_1, xAprox, currentError);
        endif

        iterations += 1;

        % Check error
        if (currentError < tol)
            break;
        endif
    endfor

    disp("Derivada: ");
    disp(df);

    return;
endfunction


% Main
% Initial value
x0 = 1.5;
% Tolerance
tol = 0.001;
% Max number of iterations
maxIter = 1000;
% Function to work
func = @(x) x^2 - cos(x) - 1;
errorFunc = @(xi, xi_1) abs(xi - xi_1) / abs (xi);
% Call method
[xi, iterations, finalError] = newtonRaphson (x0, func, errorFunc, tol, maxIter);

% Display result
printf("La aproximación de x es %f después de %d iteraciones con un error de %f\n", xi, iterations, finalError);
