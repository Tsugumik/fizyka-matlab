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

