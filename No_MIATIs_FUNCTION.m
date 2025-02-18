function [MATI_f] = No_MIATIs_FUNCTION(k,a1,a2,a3,a4,a5,a6,n1,n2,lambda_s_star,lambda_f_star,mu_factor,a_rho_s_low,a_rho_f_low)
% k = 1.5;%63; % k should be greater than 0.5
% 
% a1 = 0.001;
% a2 = 0.2;
% a3 = 0.6;
% a4 = 0.73333;
% a5 = 1.1111;
% a6 = 0.36667;
% n1 = 0.02;
% n2 = 0.0018;
% lambda_s_star = 0.3333;
% lambda_f_star = 0.4556;
% mu_factor = 0.65556;
% a_rho_s_low = 1.1556;
% a_rho_f_low = 0.40556;


constraints = [];

% Boundary Layer system model
A11f = [-a2 0; -a2 -a4];
A12f = [0; 0];
A21f = [a2 a4];
A22f = 0;

% Reduced system model
A11s = [a1 -(n1-n2)*k; a6*(1+a3/a4) -a5];
A12s = [n1-n2;0];
A21s = [a6*(1+a3/a4)*k -a5*k];
A22s = 0;


% define variables for reduced model
p11s = sdpvar(1,1);
p12s = sdpvar(1,1);
p22s = sdpvar(1,1);
Ps = [p11s p12s; p12s p22s]; % Quadratic Lyapunov function
gamma_s = sdpvar(1,1);
a_rho_s = sdpvar(1,1);

% define constraints
LMI_s = [A11s'*Ps+Ps*A11s+a_rho_s*eye(2)+A21s'*A21s  Ps*A12s;
         A12s'*Ps (a_rho_s-gamma_s^2)];
constraints = [constraints,Ps>=0.01*eye(2), gamma_s>=0.01, LMI_s<=-0.001*eye(3), a_rho_s_low<=a_rho_s<=1000];



% define variables for boundary-layer system
p11f = sdpvar(1,1);
p12f = sdpvar(1,1);
p22f = sdpvar(1,1);
Pf = [p11f p12f; p12f p22f];
gamma_f = sdpvar(1,1);
a_rho_f = sdpvar(1,1);

% define constraints
LMI_f = [A11f'*Pf+Pf*A11f+a_rho_f*eye(2)+A21f'*A21f  zeros(2,1);
         zeros(1,2) (a_rho_f-gamma_f^2)];
constraints = [constraints, Pf>=0.01*eye(2), gamma_f>=0.01, LMI_f<=-0.01*eye(3), a_rho_f_low<=a_rho_f<=1000];




MATI_s = -(1/gamma_s)*(atan(lambda_s_star) - atan(1/lambda_s_star));


T_star = -(1/gamma_f)*(atan(lambda_f_star) - atan(1/lambda_f_star));

as = a_rho_s;
af = a_rho_f;

% The following b1 b2 and b3 are not the tightest value, we use these value
% to get a cost funciton that can be solved by the solver. We will use
% tighter b1 b3 and b3 to calculate epsilon_star_new later.
b1 = 2*(abs(a2*p11s) + (abs(a2)+abs(a6))*abs(p12s) + ...
        abs(a6*p22s) + 2*(gamma_s/lambda_s_star)*a6*k);
n_bar = n1-n2;
b2 = 2*(abs(a3/a4)*(abs(a1)+n_bar*k+n_bar)*abs(p12f) + ...
        abs(a3/a4)*(abs(a1)+n_bar*k+n_bar)*abs(p22f) + (abs(a1)+n_bar*k+n_bar)*gamma_f/lambda_f_star);

b3 = 2*(abs(a2*a3/a4)*abs(p12f) + abs(a2*a3/a4)*(p22f) + abs(a2)*gamma_f/lambda_f_star);




cost = b1 + b2 + gamma_s + p11s + p11f + abs(p12s) + gamma_f + b3;
%      b1 + b2 + p11f + gamma_f + b3;

sol = optimize(constraints,cost, sdpsettings('debug',1));
if sol.problem == 0
 gamma_s = value(gamma_s);
 
 Ps = value(Ps);
 MATI_s = value(MATI_s);

 Pf = value(Pf);
 gamma_f = value(gamma_f);
 T_star = value(T_star);

 a_rho_s = value(a_rho_s);
 a_rho_f = value(a_rho_f);
 
 b1 = value(b1);
 b2 = value(b2);
 b3 = value(b3);
 
else
    MATI_f = 0;
    return
end



eigVal_Ps = eig(Ps);
underline_a_Vs = min(eigVal_Ps);
overline_a_Vs = max(eigVal_Ps);

eigVal_Pf = eig(Pf);
underline_a_Vf = min(eigVal_Pf);
%overline_a_Vf = max(eigVal_Pf);



underline_a_Us = min(underline_a_Vs,gamma_s*lambda_s_star);
underline_a_Uf = min(underline_a_Vf,gamma_f*lambda_f_star);

overline_a_Us = max(overline_a_Vs, gamma_s/lambda_s_star);
%overline_a_Uf = max(overline_a_Vf, gamma_f/lambda_f_star);

a_phi_1 = sqrt(1/underline_a_Us);
a_phi_2 = sqrt(1/underline_a_Uf);

%L=1; %Lipschitz constant of H_bar


as = value(as);
af = value(af);
b3 = value(b3);


% These group of b1 b2 and b3 gives us better MIATI_s, so we will not use
% b1_new, b2_new and b3_new to calculate MIATI_s.
MIATI_s = 0.9*MATI_s;

% New b1
Gamma_b1 = 2*[abs(a2*p11s) abs(a6*p12s) 0; ...
              abs(a2*p12s) 0 abs(a6*p22s); ...
              0 (gamma_s/lambda_s_star)*abs(a6)*k (gamma_s/lambda_s_star)*abs(a6)*k];
Gamma_b1 = value(Gamma_b1);

b1_new = sqrt(max(eig(Gamma_b1'*Gamma_b1)));


% New b2
Gamma_b2 = 2*[abs((a1*a3/a4)*p12f)  abs((a1*a3/a4)*p22f)     abs(a1)*gamma_f/lambda_f_star; ...
            k*abs((a3/a4)*p12f)*n_bar  k*abs((a3/a4)*p22f)*n_bar   n_bar*k*gamma_f/lambda_f_star;
            abs((a3/a4)*p12f)*n_bar    abs((a3/a4)*p22f)*n_bar     n_bar*gamma_f/lambda_f_star];
Gamma_b2 = value(Gamma_b2);

b2_new = sqrt(max(eig(Gamma_b2'*Gamma_b2)));


% New b3
Gamma_b3 = [2*abs((a2*a3/a4)*p12f) abs((a1*a3/a4)*p22f) abs(a2)*gamma_f/(lambda_f_star);...
              abs((a2*a3/a4)*p22f) 0 0;...
              abs(a2)*gamma_f/(lambda_f_star) 0 0];
Gamma_b3 = value(Gamma_b3);

b3_new = sqrt(max(eig(Gamma_b3'*Gamma_b3)));


mu = mu_factor*as*a_phi_1^2;

lambda_LB = exp(-mu*MIATI_s/overline_a_Us); % Since we have overline_a_Us > d*overline_a_Uf
ratio = 0.01;
lambda = ratio*lambda_LB + (1-ratio)*1;


lambda_1 = (n2/a2)^2*value(abs(p11f));
lambda_2 = (n2/a2)*value(2*(abs(p11f)+abs(p12f))/sqrt(underline_a_Vf));



aa = lambda_1/(gamma_s*lambda_s_star);
bb = 0.5*(lambda_2/(gamma_s*lambda_s_star) + lambda_2);
cc = 1 - lambda * exp(mu*MIATI_s);

d = ((-bb + sqrt(bb^2 - 4*aa*cc))/(2*aa))^2;

comp1 = a_phi_1/(af*d);
comp2 = ((b1_new+d*b2_new)*a_phi_1*a_phi_2)^2/(as*a_phi_1^2 - mu);
comp3 = b3*a_phi_2^2/af;

epsilon_star = (comp1*(0.25*comp2+mu*d)+comp3)^(-1);

MATI_f = epsilon_star*T_star;


end

