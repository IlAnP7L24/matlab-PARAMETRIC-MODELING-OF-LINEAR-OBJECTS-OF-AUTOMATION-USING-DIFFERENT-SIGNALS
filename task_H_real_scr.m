clear; clc;
a0=0.5; b0=2;
figure('Color','w'); 
nois_i=0; nois_o=0; sim('Task_H_real_mod',50);
subplot(2,1,1); hold on;
plot(u.time,u.data,'--','Color','black','LineWidth',2);
plot(x.time,x.data,'-','Color','black','LineWidth',2); ylim([-2,3]);
FormatCharts('$$t,{\textrm s}$$','$$u(t), x(t)$$','without noises');
legend('{\itu}({\itt})','{\itx}({\itt})');
nois_i=1; nois_o=1; sim('Task_H_real_mod',50);
subplot(2,1,2); hold on;
plot(u.time,u.data,'--','Color','black','LineWidth',2);
plot(x.time,x.data,'-','Color','black','LineWidth',2); ylim([-2,3]);
FormatCharts('$$t,{\textrm s}$$','$$u(t), x(t)$$','with noises');
legend('{\itu}({\itt})','{\itx}({\itt})');
