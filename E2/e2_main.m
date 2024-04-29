% Pomiar oporności właściwej przewodu oporowego metodą techniczną
clc, clearvars

% stopien wielomianu
n = 1;

I_A = 200 * 10^-3; % Natężenie prądu odczytane na amperomierzu [A]
R_V = 2500; % Rezystancja wewnętrzna woltomierza [Ω]
R_A = 0.15; % Rezystancja wewnętrzna miliaperomierza [Ω]

% Długość przewodu oporowego [m]
pomiar_l = (46:-2:20)*10^-2;
l_val = linspace(min(pomiar_l), max(pomiar_l), 100);

% Odczyt woltomierza (dokładny pomiar napięcia) [v]
pomiar_d_p_napiecia = [1.45 1.44 1.41 1.38 1.30 1.23 1.18 1.12 1.06 1.00 0.94 0.87 0.78 0.72];

% Odczyt woltomierza (dokładny pomiar prądu) [v]
pomiar_d_p_prad =     [1.46 1.44 1.44 1.37 1.32 1.23 1.22 1.17 1.11 1.06 0.99 0.93 0.84 0.78];

wsp_napiecie = polyfit(pomiar_l, pomiar_d_p_napiecia, n);
wsp_prad = polyfit(pomiar_l, pomiar_d_p_prad, n);

R_P_napiecie_fit = (polyval(wsp_napiecie, l_val) ./ (I_A)) .* (1+(polyval(wsp_napiecie, l_val) ./ (I_A*R_V)));
R_P_prad_fit = (polyval(wsp_prad, l_val) ./ I_A) - R_A;

R_P_napiecie = (pomiar_d_p_napiecia ./ (I_A)) .* (1+(pomiar_d_p_napiecia ./ (I_A*R_V)));
R_P_prad = (pomiar_d_p_prad ./ I_A) - R_A;

% Wykres zależności rezystancji przewodnika od jego długości
figure;
plot(pomiar_l, R_P_napiecie, 'o', 'DisplayName', 'Dokładny pomiar napięcia');
hold on;
plot(pomiar_l, R_P_prad, 's', 'DisplayName', 'Dokładny pomiar prądu');
plot(l_val, R_P_napiecie_fit, '-', 'DisplayName', 'Dopasowanie dokładnego pomiaru napięcia');
plot(l_val, R_P_prad_fit, '-', 'DisplayName', 'Dopasowanie dokładnego pomiaru prądu');
hold off;
xlabel('Długość przewodu [m]');
ylabel('Rezystancja przewodnika [Ω]');
title('Zależność rezystancji przewodnika od jego długości');
legend('show');

% Obliczenie rezystancji właściwej przewodu oporowego
nachylenie_napiecie = wsp_napiecie(1);
nachylenie_prad = wsp_prad(1);

d = 3.22 * 10^-4; % średnica drutu [m]
rezystancja_wlasciwa_napiecie = nachylenie_napiecie*((pi*(d^2))/4);
rezystancja_wlasciwa_prad = nachylenie_prad*((pi*(d^2))/4);