function [z] = func1(Ci, Li)
    z = [2 * Ci - 0.02 * Ci * Li, 0.0002 * Ci * Li - 0.8 * Li];
end
