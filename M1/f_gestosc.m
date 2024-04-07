% Funkcja licząca gęstość ciał stałych
function w = f_gestosc(m1, m2, m3, m4, pw)
    w = ((m2-m1)/(m2+m4-m1-m3))*pw;
end

