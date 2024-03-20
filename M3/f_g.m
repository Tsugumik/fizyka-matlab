% Funkcja licząca przyspieszenie ziemskie
function g = f_g(l1, l2, T2, T1)
    g = ((4*(pi^2))*(l2-l1))/((T2^2)-(T1^2));
end