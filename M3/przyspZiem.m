% Wyznaczanie przyspieszenia ziemskiego za pomocą wahadła matematycznego.
clc, clearvars

% Górne położenie wahadła
l1 = 10 * 10^-2; % m

% Dolne położenie wahadła
l2 = 110 * 10^-2; % m

% Okres 20 drgań w górnym położeniu wahadła
T1 = [43.43 43.41 42.97 43.81 43.12]; % s
T1_okresy = T1/20;
T1_okresy_srednia = mean(T1_okresy);

% Okres 20 drgań w dolnym położeniu wahadła
T2 = [57.78 58.13 58.12 58.43 57.69]; % s
T2_okresy = T2/20;
T2_okresy_srednia = mean(T2_okresy);

g = f_g(l1, l2, T2_okresy_srednia, T1_okresy_srednia);
% ok. 10.6094

% -- Niepewności --
d_l = 0.1 * 10^-2; % m
d_T = 0.2/20; % Czyli niepewność czasu dt = 0.2 przez 20 okresów

% dla l1 oraz l2
uc_l1 = f_ub(d_l);
uc_l2 = uc_l1;

% dla T1
ub_t1 = f_ub(d_T);
uc_t1 = f_uc(T1_okresy, d_T);

% dla T2
uc_t2 = f_uc(T2_okresy, d_T);

% -- Pochodne cząstkowe
pochodna_l1 = (4*(pi^2))/((T2_okresy_srednia^2)-(T1_okresy_srednia^2));
pochodna_l2 = pochodna_l1;
pochodna_t1 = (8*(pi^2)*T1_okresy_srednia*(l2-l1))/(((T2_okresy_srednia^2)-(T1_okresy_srednia^2))^2);
pochodna_t2 = (8*(pi^2)*T2_okresy_srednia*(l2-l1))/(((T2_okresy_srednia^2)-(T1_okresy_srednia^2))^2);

% Niepewność złożona
suma = (pochodna_l1^2)*(uc_l1^2)+(pochodna_l2^2)*(uc_l2^2)+(pochodna_t1^2)*(uc_t1^2)+(pochodna_t2^2)*(uc_t2^2);
uc_g = sqrt(suma);
uc_g2 = 2*uc_g;

% Wynik końcowy
% g = 10.609 +- 0.371