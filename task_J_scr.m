clear; clc;
a0=0.5; b0=1; tfin=100; wr=0.025; sim('Task_J_mod',tfin);
figure('Color','w'); 
subplot(3,1,1);
plot(w.data,A.data,'-','Color','black','LineWidth',2); ylim([-2,2]);
FormatCharts('$$\omega,{\textrm s^{-1}}$$','$$A(\omega)$$','primary data');
%%
subplot(3,1,2);
plot(w.data,abs(A.data),'-','Color','black','LineWidth',2); ylim([0,2]);
FormatCharts('$$\omega,{\textrm s^{-1}}$$','$$A(\omega)$$','handled data');
%%
k=0; N=length(w.time); clear Ah wh;
for i=2:1:N-1
    if and(abs(A.data(i-1))<abs(A.data(i)),abs(A.data(i))>abs(A.data(i+1)))
        k=k+1;
        Ah(k)=abs(A.data(i));
        wh(k)=w.data(i);
    end;
end;
subplot(3,1,3); hold on;
plot(wh,Ah,':','Color','black','LineWidth',2);
plot(2*wh,Ah,'--','Color','black','LineWidth',2);
plot(wh,b0./sqrt(a0.^2+wh.^2),'-','Color','black','LineWidth',2); 
ylim([0,2]);
FormatCharts('$$\omega,{\textrm s^{-1}}$$','$$A(\omega)$$','results');
legend('measured','handled','analytical');
