% Wyznaczanie równoważnika elektrochemicznego miedzi i stałej Faradaya
clc, clearvars
natezenia = [1.506 1.504 1.507 1.507 1.509 1.511 1.505 1.507 1.509 1.513]; % A
natezenia_srednia = mean(natezenia);

m1 = 156.916 * 10^-3; % kg
m2 = 157.570 * 10^-3; % kg
M = 63.54 * 10^-3; % kg/mol
t = 1200; % s

k = f_k(m1, m2, natezenia_srednia, t);
F = f_F(M, k, 2);
F = round(F, 4);

% Pochodne cząstkowe dla k
pochodna_m1 = -(1)/(t*natezenia_srednia);
pochodna_m2 = (1)/(t*natezenia_srednia);
pochodna_I = (m1-m2)/(t*(natezenia_srednia^2));
pochodna_t = (m1-m2)/((t^2)*natezenia_srednia);

% Pochodne cząstkowe dla F
pochodna_M = (1)/(k*2);
pochodna_k = (M)/((k^2)*2);

% Niepewności proste
d_m = 2*10^-6; % kg
d_I = 10^-2; % A
d_t = 0.2; % s
d_M = 0.01*10^-3; % kg/mol

uc_natezenie = f_uc(natezenia, d_I);
uc_t = f_ub(d_t);
uc_M = f_ub(d_M);
uc_m = f_ub(d_m);

% Niepewność złożona dla k
suma_k = (pochodna_m1^2)*(uc_m^2)+(pochodna_m2^2)*(uc_m^2)+(pochodna_I^2)*(uc_natezenie^2)+(pochodna_t^2)*(uc_t^2);
uc_k = sqrt(suma_k);
uc_k_2 = 2*uc_k;

% Niepewność złożona dla F
suma_F = (pochodna_M^2)*(uc_M^2)+(pochodna_k^2)*(uc_k^2);
uc_F = sqrt(suma_F);
uc_F_2 = 2*uc_F;

% Wyniki końcowe
% k = 0.00000036 +- 0.0000000033 kg/C
% F = 87895.056 +- 810.25 C/mol
