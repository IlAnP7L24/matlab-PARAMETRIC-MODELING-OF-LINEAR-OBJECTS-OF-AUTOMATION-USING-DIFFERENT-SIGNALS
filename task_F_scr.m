clear; clc;
a=2;
figure('Color','w'); 
nois_i=0; nois_o=0; sim('Task_F_mod',20);
subplot(1,2,1); hold on;
plot(u.time,u.data,'--','Color','black','LineWidth',2);
plot(x.time,x.data,'-','Color','black','LineWidth',2); ylim([-3,3]);
FormatCharts('$$t,{\textrm s}$$','$$u(t), x(t)$$','without noises');
legend('{\it u}({\it t})','{\it x}({\it t})');
nois_i=1; nois_o=1; sim('Task_F_mod',20);
subplot(1,2,2); hold on;
plot(u.time,u.data,'--','Color','black','LineWidth',2);
plot(x.time,x.data,'-','Color','black','LineWidth',2); ylim([-3,3]);
FormatCharts('$$t,{\textrm s}$$','$$u(t), x(t)$$','with noises');
legend('{\it u}({\it t})','{\it x}({\it t})');