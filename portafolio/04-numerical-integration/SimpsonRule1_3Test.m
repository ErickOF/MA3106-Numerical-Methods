printf("Simple:\n");
x0 = -6
x1 = -1.5
x2 = -3

func = @(x) x * e^x

[approx] = SimpleSimpsonRule1_3(x0, x1, x2, func)


printf("\nCompuesta:\n");
a = -6
b = -3
n = 8

func = @(x) x * e^x
[approx] = CompositeSimpsonRule1_3(a, b, n, func)
