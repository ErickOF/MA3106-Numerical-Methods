clear;
clc;

% Only when running on PC
pkg load symbolic;

syms x

format rat;

warning('off', 'all');

Node = [1/4 -2; 1/2 -1; 1 0; 4 2; 8 3]

Pn = LagrangePolin(x, Node)

xApprox = 3
double(subs(Pn, x, xApprox))
