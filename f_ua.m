% Funkcja licząca niepewność typu a
function w = f_ua(macierz_wynikow)
    n = length(macierz_wynikow);
    srednia = mean(macierz_wynikow);
    w = sqrt(sum((macierz_wynikow-srednia).^2)/(n*(n-1)));
end