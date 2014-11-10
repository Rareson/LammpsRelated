% Analyze def1.txt files and plot the responses
% draw uniaxial tensile and compressive curves in the same figure.
% 8*2 lines per figure.
% 11 graphs in total.

d = dir('*.def1.txt');
legendName = cell(length(d),1);

for i = 1:length(d)
    fname = d(i).name;
    A = importdata(fname);
    currentLegend = regexp(fname,'(cntC|cntT)Temp(\d*)H2O(\d*)\S*','tokens');
    legendName{i} = [num2str(currentLegend{1,1}{1,2}),',',num2str(currentLegend{1,1}{1,3})];
    if i==1
        graphicName = ['H2O_',num2str(currentLegend{1,1}{1,3})];
    end
    strain = -[0;A.data(:,1)];
    stress = -[zeros(1,3);A.data(:,2:4)];
    if strcmp(currentLegend{1,1}{1,1},'cntC')
        plot(strain,stress(:,3),'color',[i/length(d),0.5,0.5]);
    else
        strain = [0;A.data(:,1)];
        stress = [0;(A.data(:,4)-A.data(1,4))];
        plot(strain,stress,'color',[(i-length(d)/2)/(length(d)/2),0.5,0.5]);
    end
    
    hold on;

end

axis auto normal
 %
% legend(d.name,'Location','NorthEastOutside');
legend(legendName,'Location','NorthEastOutside');
set(gca,'LineWidth',2,'FontSize',24,'FontWeight','normal','FontName','Times')
set(get(gca,'xlabel'),'String','Strain','FontSize',32,'FontWeight','bold','FontName','Times')
set(get(gca,'ylabel'),'String','Stress (GPa)','FontSize',32','FontWeight','bold','FontName','Times')
print(gcf,'-dtiffn',graphicName)
print(gcf,'-depsc2',graphicName)
print(gcf,'-djpeg',graphicName)
print(gcf,'-dpng',graphicName)
% Export the figure to a tif file
% exportfig(gcf,strrep(fname,'.def1.txt','.tif'),'Format','tiff',...
   % 'Color','rgb','Resolution',300)