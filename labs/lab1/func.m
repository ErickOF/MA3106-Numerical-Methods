function y = func(d)
   r = 10;
   alpha = 4;
   sigmadB = 4;
   lambda = 1;
   x1 = 7;
   x2 = 6;

   S = pi * r^2;
   sigmaR = sigmadB^2 / (10 * alpha)^2;
   k = 10 * alpha / log(10);
   gd = 2 * S / pi * acos(d / (2 * r)) - d * sqrt(r^2 - d^2 / 4);
   sigmaC =gd^2 / (2 * lambda * k^2) * (1 / gd + 1 / S);

   t1 = log10(x1 / d) / (sigmaR * log(10));
   t2 = (d * (x2 - d)) / sigmaC;

   y = t1 + t2;
end
