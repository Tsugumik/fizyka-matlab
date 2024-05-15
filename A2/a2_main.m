% Wyznaczanie prędkości fali dźwiękowej w powietrzu metodą rezonansu

% wzór roboczy
function w = V(f, h1, h2)
    w = 2*f*(h2-h1);
end

% Dane
h1 = [17    18 17.5 18.5 18.6 18 18.7 18.1 17.4 17.5] .* 10^-2; % m;
h2 = [57.5  57.6 58 57.5 57.3 58 57.3 57.5 57.5 57.4] .* 10^-2; % m;
f = 435; % Hz
d_f = 1; % Hz
d_h = 0.1 * 10^-2; % m

h1_srednia = mean(h1);
h2_srednia = mean(h2);

wynik = V(f, h1_srednia, h2_srednia);

% Pochodne
pochodna_f = 2*(h2_srednia-h1_srednia);
pochodna_h1 = -2*f;
pochodna_h2 = 2*f;

% Niepewności proste
uc_f = f_ub(d_f);
ua_h1 = f_ua(h1);
uc_h1 = f_uc(h1, d_h);
ua_h2 = f_ua(h2);
uc_h2 = f_uc(h2, d_h);
ub_h = f_ub(d_h);

% Niepewność złożona
suma = pochodna_f^2 * uc_f^2 + pochodna_h1^2 * uc_h1^2 + pochodna_h2^2 * uc_h2^2;
uc_v = sqrt(suma);
ur = (wynik - 343)/343;

