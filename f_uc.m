% Funkcja licząca niepewność typu c
function w = f_uc(macierz_wynikow, delta)
    ua = f_ua(macierz_wynikow);
    ub = f_ub(delta);
    w = sqrt((ua^2) + (ub^2));
end