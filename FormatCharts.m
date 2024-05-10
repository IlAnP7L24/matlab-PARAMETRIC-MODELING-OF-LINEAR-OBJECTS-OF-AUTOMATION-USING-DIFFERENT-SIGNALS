function FormatCharts( xtitle,ytitle,ctitle )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    set(gca,'FontName','Times New Roman');
    set(gca,'FontSize',14);
    box on;
    grid on;
    title(' ','FontName','Times New Roman');
    title(' ','FontSize',14,'Interpreter','Latex');
    title(ctitle);
    xlabel(' ','FontName','Times New Roman');
    xlabel(' ','FontSize',14,'Interpreter','Latex');
    xlabel(xtitle);
    ylabel(' ','FontName','Times New Roman');
    ylabel(' ','FontSize',14,'Interpreter','Latex');
    ylabel(ytitle);
end

