% Analyze def1.txt files and plot the responses
% draw uniaxial tensile and compressive curves in the same figure.
% 8*2 lines per figure.
% 11 graphs in total.

d = dir('*.def1.txt');
legendName = cell(length(d),1);
fractureStress = zeros(2,length(d)/2);
fractureStrain = zeros(2,length(d)/2);

for i = 1:length(d)
    fname = d(i).name;
    A = importdata(fname);
    currentLegend = regexp(fname,'(cntC|cntT)Temp(\d*\.*\d*)H2O(\d*)\S*','tokens');
    legendName{i} = [num2str(currentLegend{1,1}{1,2}),',',num2str(currentLegend{1,1}{1,3}),',',currentLegend{1,1}{1,1}];
    if i==1
        graphicName = ['H2O_',num2str(currentLegend{1,1}{1,3})];
    end
    
    if strcmp(currentLegend{1,1}{1,1},'cntT')
        %legendName{i} = [num2str(currentLegend{1,1}{1,2}),',',num2str(currentLegend{1,1}{1,3})];
        strain = [0;A.data(:,1)];
        stress = [0;A.data(:,4)--A.data(1,4)];
        [fractureStress(1,i), fractureStrainIndex] = min(stress);
        fractureStrain(1,i) =strain(fractureStrainIndex);
        plot(strain,stress,'--','color',[i/length(d),0.5,0.5]);
    else
        strain = [0;A.data(:,1)];
        stress = [0;(A.data(:,4)-A.data(1,4))];
        [fractureStress(2,i-length(d)/2), fractureStrainIndex] = max(stress);
        fractureStrain(2,i-length(d)/2) =strain(fractureStrainIndex);
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
figure
plot(300:300:1200, [fractureStrain(1,2:4),fractureStrain(1,1)],'-o')
hold on
plot(300:300:1200, [fractureStrain(2,2:4),fractureStrain(2,1)],'-.')
legend('Tensile')
set(gca,'LineWidth',2,'FontSize',24,'FontWeight','normal','FontName','Times')
set(get(gca,'xlabel'),'String','Temperature (K)','FontSize',32,'FontWeight','bold','FontName','Times')
set(get(gca,'ylabel'),'String','Fracture Strain','FontSize',32','FontWeight','bold','FontName','Times')
print(gcf,'-dtiffn',[graphicName,'fStrain'])
print(gcf,'-depsc2',[graphicName,'fStrain'])
print(gcf,'-djpeg',[graphicName,'fStrain'])
print(gcf,'-dpng',[graphicName,'fStrain'])

figure
plot(300:300:1200, [fractureStress(1,2:4),fractureStress(1,1)],'-o')
hold on
plot(300:300:1200, [fractureStress(2,2:4),fractureStress(2,1)],'-.')
legend('Tensile')
set(gca,'LineWidth',2,'FontSize',24,'FontWeight','normal','FontName','Times')
set(get(gca,'xlabel'),'String','Temperature (K)','FontSize',32,'FontWeight','bold','FontName','Times')
set(get(gca,'ylabel'),'String','Fracture Stress (GPa)','FontSize',32','FontWeight','bold','FontName','Times')
print(gcf,'-dtiffn',[graphicName,'fStress'])
print(gcf,'-depsc2',[graphicName,'fStress'])
print(gcf,'-djpeg',[graphicName,'fStress'])
print(gcf,'-dpng',[graphicName,'fStress'])