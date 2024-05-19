% Pomiar ogniskowej soczewki na podstawie odległości obrazu i przedmiotu od
% soczewki
clc, clearvars
pomiar_x =  [9.0 9.5 9.3 9.5 9.4 9.5 9.3 9.6 9.6 9.6] .* 10^-2; % m
pomiar_y =  [69.7 67.3 65.1 63.0 61.3 59.5 58.4 56.0 53.7 52.2] .* 10^-2; % m
wyniki = 1:10;

% Wzór roboczy
syms f(x, y)
f(x, y) = (x*y)/(x+y);

for i=1:length(pomiar_x)
    wyniki(i) = f(pomiar_x(i), pomiar_y(i));
end

ogniskowa = mean(wyniki);
ua_f = f_ua(wyniki);
