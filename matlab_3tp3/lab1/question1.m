f = SimpleFunctions();
n = -10:10;

% a. x[n] = u[n] − 2u[n − 1] + u[n − 4]
ex_a = f.unitstep(n) - 2*f.unitstep(n-1) + f.unitstep(n-4);

% b. x[n] = (n + 2)u[n + 2] − 2u[n] − nu[n − 4]
ex_b = (n+2).*f.unitstep(n+2) - 2*f.unitstep(n) - n.*f.unitstep(n-4);

%c. x[n] = δ[n + 1] − δ[n] + u[n + 1] − u[n − 2]
ex_c = f.delta(n + 1) - f.delta(n) + f.unitstep(n+1) - f.unitstep(n - 2);

%d. x[n] = e^(0.8n)u[n + 1] + u[n]
ex_d = exp(0.8*n).*f.unitstep(n+1) + f.unitstep(n);


tiledlayout(4,1);
nexttile;
stem(n, ex_a, "LineWidth", 3);
nexttile;
stem(n, ex_b, "LineWidth", 3);
nexttile;
stem(n, ex_c, "LineWidth", 3);
nexttile;
stem(n, ex_d, "LineWidth", 3);

%xlim([0 10]);
%ylim([-0.4 0.8]);

%text(-5, 1, "John Smith 5551212" , "FontSize", 14);

%exportgraphics(gcf, 'filename_you_want.jpg');