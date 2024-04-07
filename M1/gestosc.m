% Wyznaczanie gęstości ciał stałych za pomocą piknometru
% Dane
clc, clearvars

m1 = 24.120 * 10^-3; % kg
m2 = 51.04 * 10^-3; % kg
m3 = 67.186 * 10^-3; % kg
m4 = 49.734 * 10^-3; % kg

pw = 0.997992*10^3; % kg/m^3

wynik = f_gestosc(m1, m2, m3, m4, pw);
disp(wynik);

% Niepewności proste
d_m = 10^-6; % kg
d_pw = 10^-3; % kg/m^3

uc_m = f_ub(d_m);
uc_pw = f_ub(d_pw);

% Pochodne

pochodna_m1 = (pw*(m3-m4))/((-m3+m4-m1+m2)^2);
pochodna_m2 = (pw*(m4-m3))/((-m3+m4-m1+m2)^2);
pochodna_m3 = (pw*(m2-m1))/((-m3+m4-m1+m2)^2);
pochodna_m4 = (pw*(m1-m2))/((-m3+m4-m1+m2)^2);
pochodna_pw = (m2-m1)/(-m3+m4-m1+m2);

suma = ((pochodna_m1^2)*(uc_m^2))+((pochodna_m2^2)*(uc_m^2))+((pochodna_m3^2)*(uc_m^2))+((pochodna_m4^2)*(uc_m^2))+((pochodna_pw^2)*(uc_pw^2));
uc_p = sqrt(suma);

% gestosc marmuru = 2837.56 +- 0,58 kg/m^3