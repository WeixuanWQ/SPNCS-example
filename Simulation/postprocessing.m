close all;
%x = [x_p; x_c; z_1; z_2; e_s; e_f; tau_s; tau]


t = out.t;
j = out.j;
x_p = out.x(:,1);
x_c = out.x(:,2);
z_1 = out.x(:,3);
z_2 = out.x(:,4);
e_s = out.x(:,5);
e_f = out.x(:,6);
tau_s = out.x(:,7);
tau = out.x(:,8);

plot(t,x_p,'LineWidth',3);hold on;
plot(t,z_1,'LineWidth',3);hold on;
plot(t,z_2,'--','LineWidth',3);
grid on;
xlabel('$t [s]$','Interpreter','latex','FontSize',20);
ylabel('$(x_p,z_1,z_2) [-]$','Interpreter','latex','FontSize',20);
legend('$x_p$','$z_1$','$z_2$', ...
        'Interpreter','latex','FontSize',18,'orientation','horizontal');



%Hz = -x1-x2-e_x;

% subplot(2,1,1)
% plot(t,x1,'LineWidth',2); hold on;
% plot(t,x2,'LineWidth',2); hold on;
% plot(t,z,'LineWidth',2); hold on;
% plot(t,Hz,'--','LineWidth',2);
% grid on;
% xlabel('$t [s]$','Interpreter','latex','FontSize',20);
% ylabel('$(x,z) [-]$','Interpreter','latex','FontSize',20);
% legend('$x_1$','$x_2$','$z$','$H_z(x,e_x)$', ...
%         'Interpreter','latex','FontSize',18,'orientation','horizontal');



% subplot(2,1,2)
% plot(t,abs(e_x),'LineWidth',2); hold on;
% plot(t,abs(e_z),'LineWidth',2);
% grid on;
% xlabel('$t [s]$','Interpreter','latex','FontSize',20);
% ylabel('$|e| [-]$','Interpreter','latex','FontSize',20);
% legend('$|e_x|$','$|e_z|$','Interpreter','latex', ...
%         'FontSize',18,'orientation','horizontal');
