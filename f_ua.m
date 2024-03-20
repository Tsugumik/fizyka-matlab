% Funkcja licząca niepewność typu a
function w = f_ua(macierz_wynikow)
    srednia = mean(macierz_wynikow);
    w = sqrt(sum((macierz_wynikow-srednia).^2)/(3*(3-1)));
end

