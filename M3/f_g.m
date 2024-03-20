% Funkcja wyliczająca przyspieszenie ziemskie
function g = f_g(l1,l2,T2_srednia,T1_srednia)
    g = ((4*(pi^2))*(l2-l1))/((T2_srednia^2)-(T1_srednia^2));
end

