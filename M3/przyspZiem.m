% Wyznaczanie przyspieszenia ziemskiego za pomocą wahadła matematycznego.
clc, clearvars

% Górne położenie wahadła
l1 = 10 * 10^-2; % m

% Dolne położenie wahadła
l2 = 110 * 10^-2; % m

% Okres 20 drgań w górnym położeniu wahadła
T1 = [43.43 43.41 42.97 43.81 43.12]; % s
T1_okresy = T1/20;

% Okres 20 drgań w dolnym położeniu wahadła
T2 = [57.78 58.13 58.12 58.43 57.69]; % s
T2_okresy = T2/20;

g_wyniki = 1:5;

for i = 1:5
    g_wyniki(i) = f_g(l1, l2, T2_okresy(i), T1_okresy(i));
end

g_srednia = mean(g_wyniki);
% ok. 10.612942260169252