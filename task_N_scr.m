clear; clc;
b0=1; tfin=20; a2=0; a1=1; a0=0; 
figure('Color','w'); 
sim('Task_N_mod',tfin);
subplot(1,2,1);
plot(u.data,u.data,'-','Color','black','LineWidth',2); 
FormatCharts('$$t,\textrm(s)$$','$$u(t)$$','impulse input');
%%
subplot(1,2,2); hold on;
plot(x.time,x.data,':','Color','black','LineWidth',2); 
a0=1; sim('Task_N_mod',tfin);
plot(x.time,x.data,'--','Color','black','LineWidth',2); 
a2=1; sim('Task_N_mod',tfin);
plot(x.time,x.data,'-','Color','black','LineWidth',2); 
FormatCharts('$$t,\textrm(s)$$','$$u(t)$$','reaction on impulse input');
%%
legend('При a_2=0 та a_0=0','При a_2=0 та a_0=1','При a_2=1 та a_0=1');
