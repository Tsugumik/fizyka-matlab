clc, clearvars, clf

g = 9.81; % m/s^2

% wzor roboczy
syms k(m, g_, x);
k(m, g_, x) = (m*g_)/x;

% Funkcja przyłożonej siły
syms F(m, g_);
F(m, g_) =  m*g_;

% Sumy mas obciążników [kg]
m_i = [0.050546 0.100938 0.151620 0.201894 0.252290 0.302620 0.353178];

% Dla x0 = 0.171
x_i_1 = [0.033 0.067 0.100 0.134 0.163 0.201 0.235];

% Dla x0 = 0.0244 [m]
x_i_2 = [0.022 0.043 0.065 0.087 0.108 0.130 0.151];

wyniki_1 = 1:7;
wyniki_2 = 1:7;
F_wyniki = 1:7;

for i=1:length(m_i)
    wyniki_1(i) = k(m_i(i), g, x_i_1(i));
    wyniki_2(i) = k(m_i(i), g, x_i_2(i));
    F_wyniki(i) = F(m_i(i), g);
end

k_1 = mean(wyniki_1);
k_2 = mean(wyniki_2);

plot(F_wyniki, x_i_1, "-", 'DisplayName', 'Wydłużenie sprężyny 1');
hold on;
plot(F_wyniki, x_i_2, "-", "DisplayName", "Wydłużenie sprężyny 2");

xlabel('Przyłożona siła');
ylabel('Wydłużenie sprężyny [m]');

title("Wydłużenie sprężyn w funkcji przyłożonej siły");
legend("show");
hold off;

uc_k_1 = f_ua(wyniki_1);
uc_k_2 = f_ua(wyniki_2);