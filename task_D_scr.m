clear; clc;
a1=0.5; b0=2;
figure('Color','w'); 
nois_i=0; nois_o=0; sim('Task_D_mod',20);
subplot(2,1,1); hold on;
plot(u.time,u.data,'--','Color','black','LineWidth',2);
plot(x.time,x.data,'-','Color','black','LineWidth',2); ylim([0,100]);
FormatCharts('$$t,{\textrm s}$$','$$u(t), x(t)$$','without noises');
legend('{\it u}({\it t})','{\it x}({\it t})');
nois_i=1; nois_o=1; sim('Task_D_mod',20);
subplot(2,1,2); hold on;
plot(u.time,u.data,'--','Color','black','LineWidth',2);
plot(x.time,x.data,'-','Color','black','LineWidth',2); ylim([0,100]);
FormatCharts('$$t,{\textrm s}$$','$$u(t), x(t)$$','with noises');
legend('{\it u}({\it t})','{\it x}({\it t})');
%%
N=length(x.data); Nab=round(N/2); A11=0; A12=0; A22=N-Nab; B1=0; B2=0;
for k=Nab+1:1:length(x.data);
    A11=A11+x.time(k)^2;       A12=A12+x.time(k);
    B1=B1+x.time(k)*x.data(k); B2=B2+x.data(k);
end;
A=[A11,A12;A12,A22];B=[B1;B2];X=A\B; a1_id=-X(1)/X(2); b0_id=-X(1)^2/X(2);
format longe; disp([a1_id,b0_id]);
