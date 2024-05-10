clear; clc;
a0=4; b0=1; tfin=100; wr=0.01; sim('Task_L_mod',tfin);
figure('Color','w'); 
subplot(3,1,1);
plot(w.data,A.data,'-','Color','black','LineWidth',2); ylim([-5,5]);
FormatCharts('$$\omega,{\textrm s^{-1}}$$','$$A(\omega)$$','primary data');
%%
k=0; N=length(w.time); clear Ah wh;
for i=2:1:N-1
    if and(abs(A.data(i-1))<abs(A.data(i)),abs(A.data(i))>abs(A.data(i+1)))
        k=k+1;
        Ah(k)=abs(A.data(i));
        wh(k)=w.data(i);
    end;
end;
subplot(3,1,2);
plot(wh,Ah,'-','Color','black','LineWidth',2); ylim([0,4]);
FormatCharts('$$\omega,{\textrm s^{-1}}$$','$$A(\omega)$$','detected data');
%%
subplot(3,1,3); hold on;
plot(wh,b0./(a0-wh.^2),'-','Color','black','LineWidth',2);
plot(wh,Ah,':','Color','black','LineWidth',2);
plot(2*wh,Ah,'-','Color','black','LineWidth',2); 
ylim([0,4]);
FormatCharts('$$\omega,{\textrm s^{-1}}$$','$$A(\omega)$$','results');
legend('analytical','measured','handled');
%%
A11=0; A12=0; A22=length(wh); B1=0; B2=0;
for k=1:1:A22
    A11=A11+Ah(k)^2;         A12=A12+Ah(k);
    B1=B1+Ah(k)^2*4*wh(k)^2; B2=B2+Ah(k)*4*wh(k)^2;
end;
A=[A11,-A12;A12,-A22]; B=[B1;B2]; X=A\B; 
format longe; disp([X(1),X(2)]);