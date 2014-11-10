% Analyze def1.txt files and plot the responses

d = dir('*.def1.txt');
for i = 1:length(d)
    fname = d(i).name;
    A = importdata(fname);
    strain = -[0;A.data(:,1)];
    stress = -[zeros(1,3);A.data(:,2:4)];
    temperature = [A.data(1,6);A.data(:,5)];
    
    
    [ax,h1,h2] = plotyy(strain,stress(:,3),strain,temperature);
    axis auto normal
%     grid on
%     axis square % this will make the figure look very odd.
    legend('Pzz','Temperature')
    set(h1, 'LineStyle','-','LineWidth',2,'LineSmoothing','on')
    set(h2, 'Marker','.','LineWidth',2,'LineSmoothing','on')
    
    
    %ylim([0 7])
    %xlim([0 0.2])
    set(gca,'LineWidth',2,'FontSize',24,'FontWeight','normal','FontName','Times')
    set(get(ax(1),'xlabel'),'String','Strain','FontSize',32,'FontWeight','bold','FontName','Times')
    set(get(ax(1),'ylabel'),'String','Stress (GPa)','FontSize',32','FontWeight','bold','FontName','Times')
    set(get(ax(2),'ylabel'),'String','Temperature (K)','FontSize',32','FontWeight','bold','FontName','Times')
    %set(gcf,'Position',[1 1 round(1000) round(1000)])
%     ax1 = gca;
% %     set(ax1,'XColor','r','YColor','r');
%     ax2 = axes('Position',get(ax1,'Position'), 'XAxisLocation','top',...
%         'YAxisLocation','right','Color','none',...
%         'XColor','k','YColor','k');
%     hold on
%     plot(strain,temperature,'-y','LineWidth',2),hold on
%     legend('Temperature','Location','NorthWestOutside');
    
    % Export the figure to a tif file
    % exportfig(gcf,strrep(fname,'.def1.txt','.tif'),'Format','tiff',...
       % 'Color','rgb','Resolution',300)
end
