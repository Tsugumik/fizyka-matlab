% Pomiar oporności właściwej przewodu oporowego metodą techniczną
clc, clearvars

% Długość przewodu oporowego [m]
pomiar_l = (46:-2:20)*10^-2;

% Dokładny pomiar napięcia [v]
pomiar_d_p_napiecia = [1.45 1.44 1.41 1.38 1.30 1.23 1.18 1.12 1.06 1.00 0.94 0.87 0.78 0.72];

% Dokładny pomiar prądu [v]
pomiar_d_p_prad =     [1.46 1.44 1.44 1.37 1.32 1.23 1.22 1.17 1.11 1.06 0.99 0.93 0.84 0.78];