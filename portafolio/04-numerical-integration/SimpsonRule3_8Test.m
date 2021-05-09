printf("Simple:\n");
x0 = -6
x1 = -5
x2 = -4
x3 = -3

func = @(x) x * e^x

[approx] = SimpleSimpsonRule3_8(x0, x1, x2, x3, func)


printf("\nCompuesta:\n");
a = -6
b = -3
n = 9

func = @(x) x * e^x

[approx] = CompositeSimpsonRule3_8(a, b, n, func)
