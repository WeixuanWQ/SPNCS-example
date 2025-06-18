clear all


k = 2.5; % k should be greater than 0.5

a1 = 0.01;
a2 = 0.16;
a3 = 1.7;
a4 = 6;
a5 = 0.48;
a6 = 0.41;
n1 = 0.02;
n2 = 0.001;
lambda_s_star = 0.35;
lambda_f_star = 0.54;
mu_factor = 0.33;
a_rho_s_low = 2.5;
a_rho_f_low = 2.5;

%%

mati_f_max = 0;
objective = 0;


 n = 40;
k_list = linspace(1.8,2.8,n);
%a1_list = linspace(-0.001,0.001,n);
a2_list = linspace(0.01,0.3,n);
a3_list = linspace(1.5,3,n);
a4_list = linspace(4,8,n);
a5_list = linspace(0.3,0.8,n);
a6_list = linspace(0.2,0.7,n);
n1_list = linspace(0.01,0.1,n);
n2_list = linspace(0.001,0.01,n);
lambda_s_star_list = linspace(0.2,0.7,n);
lambda_f_star_list = linspace(0.2,0.7,n);
mu_factor_list = linspace(0.2,0.7,n);
a_rho_s_low_list = linspace(2,4,n);
a_rho_f_low_list = linspace(2,4,n);

index = [];

[MATI_f,T_star] = No_MIATIs_FUNCTION(k,a1,a2,a3,a4,a5,a6,n1,n2,lambda_s_star,lambda_f_star,mu_factor,a_rho_s_low,a_rho_f_low);
objective = MATI_f;


for i = 1:n
        [MATI_f,T_star] = No_MIATIs_FUNCTION(k,a1,a2,a3,a4,a5,a6,n1,n2,lambda_s_star,lambda_f_star,mu_factor,a_rho_s_low_list(i),a_rho_f_low);
        if MATI_f > objective
            objective = MATI_f;
            mati_f_max = MATI_f;
            a_rho_s_low = a_rho_s_low_list(i);
        end
end

for i = 1:n
        [MATI_f,T_star] = No_MIATIs_FUNCTION(k,a1,a2,a3,a4,a5,a6,n1,n2,lambda_s_star,lambda_f_star,mu_factor,a_rho_s_low,a_rho_f_low_list(i));
        if MATI_f > objective
            objective = MATI_f;
            mati_f_max = MATI_f;
            a_rho_f_low = a_rho_f_low_list(i);
        end
end


for i = 1:n
        [MATI_f,T_star] = No_MIATIs_FUNCTION(k_list(i),a1,a2,a3,a4,a5,a6,n1,n2,lambda_s_star,lambda_f_star,mu_factor,a_rho_s_low,a_rho_f_low);
        if MATI_f > objective
            objective = MATI_f;
            mati_f_max = MATI_f;
            k = k_list(i);
        end
end



% for i = 1:n
%         [MATI_f,T_star] = No_MIATIs_FUNCTION(k,a1_list(i),a2,a3,a4,a5,a6,n1,n2,lambda_s_star,lambda_f_star,mu_factor,a_rho_s_low,a_rho_f_low);
%         if MATI_f > objective
%         objective = MATI_f;
%             mati_f_max = MATI_f;
%             a1 = a1_list(i);
%         end
% end




for i = 1:n
        [MATI_f,T_star] = No_MIATIs_FUNCTION(k,a1,a2_list(i),a3,a4,a5,a6,n1,n2,lambda_s_star,lambda_f_star,mu_factor,a_rho_s_low,a_rho_f_low);
        if MATI_f > objective
            objective = MATI_f;
            mati_f_max = MATI_f;
            a2 = a2_list(i);
        end
end

for i = 1:n
        [MATI_f,T_star] = No_MIATIs_FUNCTION(k,a1,a2,a3_list(i),a4,a5,a6,n1,n2,lambda_s_star,lambda_f_star,mu_factor,a_rho_s_low,a_rho_f_low);
        if MATI_f > objective
            objective = MATI_f;
            mati_f_max = MATI_f;
            a3 = a3_list(i);
        end
end


for i = 1:n
        [MATI_f,T_star] = No_MIATIs_FUNCTION(k,a1,a2,a3,a4_list(i),a5,a6,n1,n2,lambda_s_star,lambda_f_star,mu_factor,a_rho_s_low,a_rho_f_low);
        if MATI_f > objective
            objective = MATI_f;
            mati_f_max = MATI_f;
            a4 = a4_list(i);
        end
end

for i = 1:n
        [MATI_f,T_star] = No_MIATIs_FUNCTION(k,a1,a2,a3,a4,a5_list(i),a6,n1,n2,lambda_s_star,lambda_f_star,mu_factor,a_rho_s_low,a_rho_f_low);
        if MATI_f > objective
            objective = MATI_f;
            mati_f_max = MATI_f;
            a5 = a5_list(i);
        end
end


for i = 1:n
        [MATI_f,T_star] = No_MIATIs_FUNCTION(k,a1,a2,a3,a4,a5,a6_list(i),n1,n2,lambda_s_star,lambda_f_star,mu_factor,a_rho_s_low,a_rho_f_low);
        if MATI_f > objective
            objective = MATI_f;
            mati_f_max = MATI_f;
            a6 = a6_list(i);
        end
end


for i = 1:n
        [MATI_f,T_star] = No_MIATIs_FUNCTION(k,a1,a2,a3,a4,a5,a6,n1,n2,lambda_s_star,lambda_f_star_list(i),mu_factor,a_rho_s_low,a_rho_f_low);
        if MATI_f > objective
            objective = MATI_f;
            mati_f_max = MATI_f;
            lambda_f_star = lambda_f_star_list(i);
        end
end

for i = 1:n
        [MATI_f,T_star] = No_MIATIs_FUNCTION(k,a1,a2,a3,a4,a5,a6,n1,n2,lambda_s_star,lambda_f_star,mu_factor_list(i),a_rho_s_low,a_rho_f_low);
        if MATI_f > objective
            objective = MATI_f;
            mati_f_max = MATI_f;
            mu_factor = mu_factor_list(i);
        end
end


for i = 1:n
        [MATI_f,T_star] = No_MIATIs_FUNCTION(k,a1,a2,a3,a4,a5,a6,n1_list(i),n2,lambda_s_star,lambda_f_star,mu_factor,a_rho_s_low,a_rho_f_low);
        if MATI_f > objective
            objective = MATI_f;
            mati_f_max = MATI_f;
            n1 = n1_list(i);
        end
end


for i = 1:n
        [MATI_f,T_star] = No_MIATIs_FUNCTION(k,a1,a2,a3,a4,a5,a6,n1,n2_list(i),lambda_s_star,lambda_f_star,mu_factor,a_rho_s_low,a_rho_f_low);
        if MATI_f > objective
            objective = MATI_f;
            mati_f_max = MATI_f;
            n2 = n2_list(i);
        end
end



for i = 1:n
        [MATI_f,T_star] = No_MIATIs_FUNCTION(k,a1,a2,a3,a4,a5,a6,n1,n2,lambda_s_star_list(i),lambda_f_star,mu_factor,a_rho_s_low,a_rho_f_low);
        if MATI_f > objective
            objective = MATI_f;
            mati_f_max = MATI_f;
            lambda_s_star = lambda_s_star_list(i);
        end
end








% plot(1:1:length(mati_f_list), mati_f_list);
% hold on
%plot(a2, mati_f_list);
% plot(1:1:length(gain_u_list), gain_u_list/1000);
% legend('mati','gain');
