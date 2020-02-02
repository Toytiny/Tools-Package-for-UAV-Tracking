% ����FPS��״ͼ��ע�����£�
% - ��Ҫ�� .\util\configSeqs.m�� .\util\configTrackers ���ʵ��
% - ����ѡ��Ϊ saveFpsFig


function AboutFPS()
clear;
close all;

addpath('.\util\');

dataPath = 'D:\Tracking\DTB70';
paperTitle = 'ECCV2020'; % ��ԵĻ�����ڿ����ƺ�����
evalType = 'OPE'; % 'SRE', 'OPE'
rpAll = ['.\results\results_' evalType '\'];

saveFpsFig = true; % true:�����ͼ���; false:������
drawFpsBaseline = false; % true:���ƻ�׼��; false:�����ƻ�׼��
fpsBaseline = 10; % fps��׼��λ��
fontSize = 15; % ͼƬ�������С


FPS_path = ['.\dataAnaly\', paperTitle, '\AboutFPS\'];
if ~exist(FPS_path, 'dir')
    mkdir(FPS_path);
end
seqs = configDTBSeqs(dataPath);
trackers = configTrackers;
num_tracker = length(trackers);
for count_trk = 1 : num_tracker
    tracker_name_set{count_trk} = trackers{count_trk}.namePaper;
end

[FPS_all, FPS_avg_all, rowSeq, colTrk] = CalFps(seqs, trackers, rpAll);

result_up = [' ' colTrk];
result_down = [rowSeq num2cell(FPS_all')];
result_avg = ['Average' num2cell(FPS_avg_all')];
FPS_table = [result_up; result_down;result_avg];
xlswrite([FPS_path 'AboutFPS.xlsx'], FPS_table);
fprintf('������FPS���λ�� %s\n', [FPS_path 'AboutFPS.xlsx'])

FpsBar = FPS_avg_all;
figure;hold on
if num_tracker == 1
    bar(FpsBar)
else
    bar(FpsBar,0.8);
end
box on;
set(gca,'YLim',[0 ceil(max(FpsBar)/100)*100+50]);
set(gca,'xtick',1:num_tracker);
set(gca,'FontSize',fontSize,'fontname','Times New Roman');
ylabel('FPS','fontsize',fontSize,'fontname','Times New Roman','fontweight','bold');
xlabel('Trackers','fontsize',fontSize,'fontname','Times New Roman','FontWeight','bold');
set(gca, 'XTickLabel',tracker_name_set);

figWidth = num_tracker*150;
figHeight = 500;
figSize = [0 0 figWidth figHeight];
set(gcf, 'position', figSize);

% ���ƻ�׼�ߣ���ɫ����
if drawFpsBaseline == true
    hold on;
    n = get(gca,'Xlim');
    z = linspace(n(1),n(2));
    zy = fpsBaseline*ones(1,numel(z));
    plot(z,zy,'r--');
end

for i=1:length(FpsBar)
    text(i,FpsBar(i),sprintf('%.2f', FpsBar(i)),'VerticalAlignment','bottom',...
        'HorizontalAlignment','center','fontsize',fontSize,'color','k','fontname','Times New Roman','FontWeight','normal')
end % ֱ��ͼ������ʾ��
tightfig;

if saveFpsFig == true
    saveDir = [FPS_path, 'FPS_avg_' num2str(num_tracker) '.pdf'];
    print(gcf,'-dpdf',saveDir);
    fprintf('������FPS��״ͼ��λ�� %s\n', saveDir);
end
rmpath('.\util\');

% ������seq��FPS��ֵ�õ�����FPS
function [FPS_all, FPS_avg_all, rowSeq, colTrk] = CalFps(seqs, trackers, rpAll)
numTrk = length(trackers);
numSeq = length(seqs);
FPS_all = zeros(numTrk,numSeq);
FPS_avg_all = zeros(numTrk,1);
allFrames = 0;
rowSeq = cell(length(seqs),1);
colTrk = cell(1, numTrk);
for idxSeq=1:length(seqs)
    s = seqs{idxSeq};
    rowSeq{idxSeq} = s.name;
    s.len = s.endFrame - s.startFrame + 1;
    allFrames = allFrames + s.len;
    for idxTrk = 1:numTrk
        t = trackers{idxTrk};
        colTrk{idxTrk} = t.namePaper;
        trk_result = load([rpAll t.name '\' s.name '_' t.name '.mat']);
        FPS_all(idxTrk,idxSeq) = trk_result.results{1}.fps;
    end
    FPS_avg_all = sum(FPS_all,2) ./ numSeq;
end

