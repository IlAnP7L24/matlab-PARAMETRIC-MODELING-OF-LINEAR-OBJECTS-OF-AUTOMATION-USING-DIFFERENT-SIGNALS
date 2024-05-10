clear; clc;
a0=1; b0=2;
figure('Color','w'); 
nois_i=0; nois_o=0; sim('Task_B_mod',20);
subplot(1,2,1); hold on;
plot(u.time,u.data,'--','Color','black','LineWidth',2);
plot(x.time,x.data,'-','Color','black','LineWidth',2); ylim([0,3]);
FormatCharts('$$t,{\textrm s}$$','$$u(t), x(t)$$','without noises');
legend('{\it u}({\it t})','{\it x}({\it t})');
nois_i=1; nois_o=1; sim('Task_B_mod',20);
subplot(1,2,2); hold on;
plot(u.time,u.data,'--','Color','black','LineWidth',2);
plot(x.time,x.data,'-','Color','black','LineWidth',2); ylim([0,3]);
FormatCharts('$$t,{\textrm s}$$','$$u(t), x(t)$$','with noises');
legend('{\it u}({\it t})','{\it x}({\it t})');
N=length(x.data); Nest=round(2*N/3); xest=0;
for k=Nest+1:1:N
    xest=xest+x.data(k);
end;
xest=xest/(N-Nest);
a0_id=0; stk2=0;
for k=1:1:round(N/10)
    a0_id=a0_id+x.time(k)*log(1-x.data(k)/xest);
    stk2=stk2+x.time(k)*x.time(k);
end;
a0_id=-a0_id/stk2;
format longe; disp(a0_id);
