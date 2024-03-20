% Liczenie współczynnika lepkości cieczy
clc, clearvars

qs = 7.65*10^3;
qg = 1.26*10^3;
g = 9.81;
d2r = 0.01;
dt = 0.2;
dl = 0.1;
dqs = 0.01*10^3;
dqg = 0.01*10^3;
dg = 0.01;

r = [4.41 4.40 4.36];
t = [8.91 9.06 9.19];
l = 67.5; 

rmean = mean(r);
tmean = mean(t);
lmean = mean(l);

w = wsplepk(tmean, ((rmean/2)*10^(-3)), lmean*10^(-2), qs, qg, g);

pochodna_czastkowa_t = (2/9)*(((rmean/2)*10^(-3))^2/(67.5*10^(-2)))*(qs-qg)*g;
pochodna_czastkowa_r = (2*(2/9)*((tmean*((rmean/2)*10^(-3)))/(lmean*10^(-2))))*(qs-qg)*g;
pochodna_czastkowa_l = -(2/9)*(tmean*((rmean/2)*10^(-3))^2/(lmean*10^(-2))^2)*(qs-qg)*g;
pochodna_czastkowa_qs = (2/9)*((tmean*((rmean/2)*10^(-3))^2*g)/(lmean*10^(-2)));
pochodna_czastkowa_qg = -(2/9)*((tmean*((rmean/2)*10^(-3))^2*g)/(lmean*10^(-2)));
pochodna_czastkowa_g = ((2/9)*((tmean*((rmean/2)*10^(-3))^2 )/(lmean*10^(-2))))*(qs-qg);


% szacowanie niepewnosci dla t
ua_t = sqrt(sum((t-tmean).^2)/(3*(3-1)));
ub_t = dt/sqrt(3);
uc_t = sqrt((ua_t^2) + (ub_t^2));

% szacowanie niepewnosci dla r
ua_d = (sqrt(sum((r-rmean).^2)/(3*(3-1))))*10^-3;
ub_d = (d2r/sqrt(3))*10^-3;
uc_r = (1/2)*sqrt((ua_d^2) + (ub_d^2));

% szacowanie niepewnosci dla l
ub_l = dl/sqrt(3)*10^-2;
uc_l = ub_l;

% szacowanie niepewnosci dla q
ub_qs = dqs/sqrt(3);
uc_qs = ub_qs;

uc_qg = uc_qs;

% szacowanie niepewnosci dla g
ub_g = dg/sqrt(3);
uc_g = ub_g;

% Wynik
suma = pochodna_czastkowa_t^2 * uc_t^2 + pochodna_czastkowa_r^2 * uc_r^2 + pochodna_czastkowa_l^2 * uc_l^2 + pochodna_czastkowa_qs^2 * uc_qs^2 + pochodna_czastkowa_qg^2 * uc_qg^2 + pochodna_czastkowa_g^2 * uc_g^2;
niepewnosc = sqrt(suma);