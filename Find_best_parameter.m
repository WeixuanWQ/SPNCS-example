clear all
k = 1.9;%63; % k should be greater than 0.5

a1 = 0.01;
a2 = 0.1551;
a3 = 1.5;
a4 = 4.91;
a5 = 0.6053;
a6 = 0.4105;
n1 = 0.02;
n2 = 0.001;
lambda_s_star = 0.3526;
lambda_f_star = 0.5421;
mu_factor = 0.3309;
a_rho_s_low = 2;
a_rho_f_low = 2;


%%

mati_f_max = 0;



 n = 20;
k_list = linspace(1.5,2.5,n);
%a1_list = linspace(-0.001,0.001,n);
a2_list = linspace(0.01,0.5,n);
a3_list = linspace(1,2,n);
a4_list = linspace(1,6,n);
a5_list = linspace(0.3,1,n);
a6_list = linspace(0.15,0.7,n);
n1_list = linspace(0.01,0.1,n);
n2_list = linspace(0.001,0.01,n);
lambda_s_star_list = linspace(0.2,0.7,n);
lambda_f_star_list = linspace(0.2,0.7,n);
mu_factor_list = linspace(0.2,0.7,n);
a_rho_s_low_list = linspace(0.5,2.5,n);
a_rho_f_low_list = linspace(0.5,2.5,n);

index = [];





for i = 1:n
        MATI_f = No_MIATIs_FUNCTION(k_list(i),a1,a2,a3,a4,a5,a6,n1,n2,lambda_s_star,lambda_f_star,mu_factor,a_rho_s_low,a_rho_f_low);
        if MATI_f > mati_f_max
            mati_f_max = MATI_f;
            k = k_list(i);
        end
end



% for i = 1:n
%         MATI_f = No_MIATIs_FUNCTION(k,a1_list(i),a2,a3,a4,a5,a6,n1,n2,lambda_s_star,lambda_f_star,mu_factor,a_rho_s_low,a_rho_f_low);
%         if MATI_f > mati_f_max
%             mati_f_max = MATI_f;
%             a1 = a1_list(i);
%         end
% end




for i = 1:n
        MATI_f = No_MIATIs_FUNCTION(k,a1,a2_list(i),a3,a4,a5,a6,n1,n2,lambda_s_star,lambda_f_star,mu_factor,a_rho_s_low,a_rho_f_low);
        if MATI_f > mati_f_max
            mati_f_max = MATI_f;
            a2 = a2_list(i);
        end
end

for i = 1:n
        MATI_f = No_MIATIs_FUNCTION(k,a1,a2,a3_list(i),a4,a5,a6,n1,n2,lambda_s_star,lambda_f_star,mu_factor,a_rho_s_low,a_rho_f_low);
        if MATI_f > mati_f_max
            mati_f_max = MATI_f;
            a3 = a3_list(i);
        end
end


for i = 1:n
        MATI_f = No_MIATIs_FUNCTION(k,a1,a2,a3,a4_list(i),a5,a6,n1,n2,lambda_s_star,lambda_f_star,mu_factor,a_rho_s_low,a_rho_f_low);
        if MATI_f > mati_f_max
            mati_f_max = MATI_f;
            a4 = a4_list(i);
        end
end

for i = 1:n
        MATI_f = No_MIATIs_FUNCTION(k,a1,a2,a3,a4,a5_list(i),a6,n1,n2,lambda_s_star,lambda_f_star,mu_factor,a_rho_s_low,a_rho_f_low);
        if MATI_f > mati_f_max
            mati_f_max = MATI_f;
            a5 = a5_list(i);
        end
end


for i = 1:n
        MATI_f = No_MIATIs_FUNCTION(k,a1,a2,a3,a4,a5,a6_list(i),n1,n2,lambda_s_star,lambda_f_star,mu_factor,a_rho_s_low,a_rho_f_low);
        if MATI_f > mati_f_max
            mati_f_max = MATI_f;
            a6 = a6_list(i);
        end
end


for i = 1:n
        MATI_f = No_MIATIs_FUNCTION(k,a1,a2,a3,a4,a5,a6,n1_list(i),n2,lambda_s_star,lambda_f_star,mu_factor,a_rho_s_low,a_rho_f_low);
        if MATI_f > mati_f_max
            mati_f_max = MATI_f;
            n1 = n1_list(i);
        end
end


for i = 1:n
        MATI_f = No_MIATIs_FUNCTION(k,a1,a2,a3,a4,a5,a6,n1,n2_list(i),lambda_s_star,lambda_f_star,mu_factor,a_rho_s_low,a_rho_f_low);
        if MATI_f > mati_f_max
            mati_f_max = MATI_f;
            n2 = n2_list(i);
        end
end



for i = 1:n
        MATI_f = No_MIATIs_FUNCTION(k,a1,a2,a3,a4,a5,a6,n1,n2,lambda_s_star_list(i),lambda_f_star,mu_factor,a_rho_s_low,a_rho_f_low);
        if MATI_f > mati_f_max
            mati_f_max = MATI_f;
            lambda_s_star = lambda_s_star_list(i);
        end
end


for i = 1:n
        MATI_f = No_MIATIs_FUNCTION(k,a1,a2,a3,a4,a5,a6,n1,n2,lambda_s_star,lambda_f_star_list(i),mu_factor,a_rho_s_low,a_rho_f_low);
        if MATI_f > mati_f_max
            mati_f_max = MATI_f;
            lambda_f_star = lambda_f_star_list(i);
        end
end

for i = 1:n
        MATI_f = No_MIATIs_FUNCTION(k,a1,a2,a3,a4,a5,a6,n1,n2,lambda_s_star,lambda_f_star,mu_factor_list(i),a_rho_s_low,a_rho_f_low);
        if MATI_f > mati_f_max
            mati_f_max = MATI_f;
            mu_factor = mu_factor_list(i);
        end
end




for i = 1:n
        MATI_f = No_MIATIs_FUNCTION(k,a1,a2,a3,a4,a5,a6,n1,n2,lambda_s_star,lambda_f_star,mu_factor,a_rho_s_low_list(i),a_rho_f_low);
        if MATI_f > mati_f_max
            mati_f_max = MATI_f;
            a_rho_s_low = a_rho_s_low_list(i);
        end
end

for i = 1:n
        MATI_f = No_MIATIs_FUNCTION(k,a1,a2,a3,a4,a5,a6,n1,n2,lambda_s_star,lambda_f_star,mu_factor,a_rho_s_low,a_rho_f_low_list(i));
        if MATI_f > mati_f_max
            mati_f_max = MATI_f;
            a_rho_f_low = a_rho_f_low_list(i);
        end
end


% plot(1:1:length(mati_f_list), mati_f_list);
% hold on
%plot(a2, mati_f_list);
% plot(1:1:length(gain_u_list), gain_u_list/1000);
% legend('mati','gain');
