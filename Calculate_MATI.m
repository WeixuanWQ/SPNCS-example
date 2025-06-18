function [MATI] = Calculate_MATI(L, gamma, lambda, ita)

syms phi
% Define the function f(phi)
phi_dot = -2*L*phi - gamma*((1+ita)*phi^2 + 1) ;

% Define the bounds
lower_bound = 1 / lambda;
upper_bound = lambda;

% Perform the integral
MATI = eval(int(1/phi_dot, phi, lower_bound, upper_bound));

% % Display the result
% disp('The integral result is:');
% disp(MATI);
end

