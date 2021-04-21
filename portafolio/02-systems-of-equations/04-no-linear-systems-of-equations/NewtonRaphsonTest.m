% Only when running on PC
pkg load symbolic;

% Add more variables here if it's necessary
syms x y

F = [(x^2 + x*y - 10); (y + 3*x*y^2 - 57)];
x0 = [1.5; 3.5];
maxIter = 3;
tol = 0.0001;
% norm to compute
p = 2;
% type of error, 0 = absolute, 1 = relative
errorType = 1;
% Add more variables here if it's necessary
% They have got to be the same as you declared before
variables = [x; y];

mSol = NewtonRaphson(F, x0, variables, maxIter, tol, p, errorType)
