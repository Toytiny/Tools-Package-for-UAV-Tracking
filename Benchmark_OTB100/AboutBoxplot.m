% ���Ƹ����Է�����ɵ�����ͼ

function AboutBoxplot()
close all;
clear,clc;

addpath('./util');

saveFig = true; % true=�����ͼ���, false=������

paperTitle = 'ICRA19_LFL'; % ��ԵĻ�����ڿ����ƺ�����
typeSet = {'Precision', 'Success'};
evalTypeSet = {'OPE'}; % 'SRE', 'OPE'

fontSize = 15; % ͼƬ�������С

dataPath = ['.\dataAnaly\', paperTitle, '\AboutAtt\'];

trackers=configTrackers;
num_tracker = length(trackers);

for count_trk = 1 : num_tracker
    tracker_name_set{count_trk} = trackers{count_trk}.namePaper;
end

figWidth = num_tracker*120;
figHeight = 500;
figSize = [0 0 figWidth figHeight];

for typeNum = 1:length(typeSet)
    matrix = [];
    plot_table = importdata([dataPath, typeSet{typeNum} '_att.mat']);
    for ii = 2:size(plot_table,1)
        rowLabels{ii-1} = plot_table{ii, 1};
        for jj = 2:(size(plot_table,2)-1) % -1����Ϊ���һ����overall�ķ���
            aa = plot_table{ii,jj};
            matrix(ii-1,jj-1) = str2double(aa); % ע��matrix���Ԫ����char���ͣ�Ҫ�仯��
            columnLabels{jj-1} = plot_table{1, jj};
        end
    end
    matrix = 100*matrix; % ת�ɰٷֺű�ʾ
    matrix_2 = matrix';
    figure;
    boxplot(matrix_2);
    set(gca,'xtick',1:num_tracker);
    set(gca,'FontSize',fontSize,'fontname','Times New Roman');
    ylabel(typeSet{typeNum},'fontsize',fontSize,'fontname','Times New Roman','fontweight','bold');
    xlabel('Trackers','fontsize',fontSize,'fontname','Times New Roman','fontweight','bold');
    set(gca, 'XTickLabel', tracker_name_set);
    set(gcf, 'position', figSize);
    tightfig;
    
    saveDir = [dataPath typeSet{typeNum} '_boxplot.pdf'];
    if saveFig == true
        print(gcf,'-dpdf',saveDir);
        fprintf('����ͼ�����ɣ�λ�� %s\n', saveDir);
    end
end
rmpath('./util');