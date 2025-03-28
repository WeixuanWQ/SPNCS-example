 clear all                                                               

%% Weixuan Timer

% initial conditions   x = [x_p; x_c; z_1; z_2; e_s; e_f; tau_s; tau]                                               
x0 = [10;-2;5;0;0;0;0;0];                                                                                               
                                                                        
% simulation horizon                                                    
T = 20;                                                                 
J = 100000000;     

                                                    
% rule for jumps                                                        
% rule = 1 -> priority for jumps                                        
% rule = 2 -> priority for flows                                        
% rule = 3 -> no priority, random selection when simultaneous conditions
rule = 2;                                                               

%solver tolerances
RelTol =  1e-8;
MaxStep = 0.0001;

% physical variables
epsilon = 0.0014;
tau_s_miati = 0.0029;
tau_s_mati  = 0.1072;

T_star = 0.8792;
tau_mati  = epsilon*T_star;
tau_miati = tau_mati;


                    