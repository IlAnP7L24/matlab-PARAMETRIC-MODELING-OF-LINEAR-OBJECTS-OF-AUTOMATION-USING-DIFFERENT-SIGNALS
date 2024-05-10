clear; clc;
a0=0.5; b0=1; sim('Task_K_mod',200);
figure('Color','w'); 
subplot(1,2,1);
plot(u.time,u.data,'-','Color','black','LineWidth',2);  ylim([-2,2]);
FormatCharts('$$t,{\textrm s}$$','$$u(t)$$','');
subplot(1,2,2);
plot(x.time,x.data,'-','Color','black','LineWidth',2);  ylim([-10,10]);
FormatCharts('$$t,{\textrm s}$$','$$x(t)$$','');