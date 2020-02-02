function plotDrawSave(numTrk,plotDrawStyle,aveSuccessRatePlot,idxSeqSet,rankNum,rankingType,rankIdx,nameTrkAll,thresholdSet,titleName,xLabelName,yLabelName,paperTitle,evalType)

% legend �õ���tex�﷨��Ҳ������ .\util\configTrackers.m
% ���Ӧtracker��namePaper����tex�﷨������ʵ�ּӴ�Ч�� \bf{}
% ͬʱע���»�����Ҫת�����\

legendLocAda = true; % true:legend��λ������Ӧ; false:legendͳһ�����Ͻ�
showGrid = true; % true:ͼƬ�л�ɫ������; false:û��������

for idxTrk=1:numTrk
    %each row is the sr plot of one sequence
    tmp=aveSuccessRatePlot(idxTrk, idxSeqSet,:);
    aa=reshape(tmp,[length(idxSeqSet),size(aveSuccessRatePlot,3)]);
    aa=aa(sum(aa,2)>eps,:);
    
    if idxSeqSet == 1 % ֻ��һ��seq�Ľ��
        bb = aa;
    else
        bb = mean(aa,1);
    end
    
    switch rankingType
        case 'AUC'
            perf(idxTrk) = mean(bb);
            saveScore = mean(bb);
            saveScore = sprintf('%.3f', saveScore);
        case 'threshold'
            perf(idxTrk) = bb(rankIdx);
            saveScore = bb(rankIdx);
            saveScore = sprintf('%.3f', saveScore);
    end
    rankingValues{1,idxTrk} = nameTrkAll{idxTrk}; % ��ø���������
    rankingValues{2,idxTrk} = saveScore; % ��øø�������ĳ��att�¶�ӦrankingType��ֵ
end

saveDir = ['.\dataAnaly\', paperTitle, '\data_', evalType, '\'];
if ~exist(saveDir, 'dir')
    mkdir(saveDir);
end
save([saveDir titleName], 'rankingValues'); % ����ø��������Ƽ�����ĳ��att�¶�ӦrankingType��ֵ

[tmp,indexSort]=sort(perf,'descend');

% indexSort = [7, 6, 3, 4, 5, 1, 2];

i=1;
AUC=[];
bb_set = [];

fontSize = 25;
fontSizeLegend = 18;  %18  15
lineWidth = 4; % ���ߵ��ߴ�

for idxTrk=indexSort(1:rankNum)
    
    tmp=aveSuccessRatePlot(idxTrk,idxSeqSet,:);
    aa=reshape(tmp,[length(idxSeqSet),size(aveSuccessRatePlot,3)]);
    aa=aa(sum(aa,2)>eps,:);
    
    if idxSeqSet == 1 % ֻ��һ��seq�Ľ��
        bb = aa;
    else
        bb = mean(aa,1);
    end
    
    switch rankingType
        case 'AUC'
            score = mean(bb);
            tmp = sprintf('%.3f', score);
        case 'threshold'
            score = bb(rankIdx);
            tmp = sprintf('%.3f', score);
    end
    bb_set = [bb_set; bb];
    tmpName{i} = [nameTrkAll{idxTrk} ' [' tmp ']'];
    h(i) = plot(thresholdSet,bb,'color',plotDrawStyle{i}.color, 'lineStyle', plotDrawStyle{i}.lineStyle,'lineWidth', lineWidth);
    hold on
    % ����ٴθ��ǻ�1�飬��֤����Խ��ͼ��Խ��
    if i == rankNum
        for ii = rankNum:-1:1
           funcName = ['h(', num2str(ii), ') = plot(thresholdSet,bb_set(', num2str(ii), ',:),', '''color'',', 'plotDrawStyle{', num2str(ii), '}.color,', '''lineStyle'',', 'plotDrawStyle{', num2str(ii), '}.lineStyle,', '''lineWidth'',', num2str(lineWidth), ');'];
           eval(funcName);
        end
    end
    i=i+1;
end

if legendLocAda == true
    switch rankingType % ����ͼʱ legend ��λ�������½ǣ�southwest�������½ǣ�southeast��
            case 'AUC'
            legend1 = legend(tmpName,'Interpreter', 'tex', 'fontsize', fontSizeLegend,'location', 'southeast');
            case 'threshold'
            legend1 = legend(tmpName,'Interpreter', 'tex', 'fontsize', fontSizeLegend,'location', 'southeast');
    end
else
    legend1=legend(tmpName,'Interpreter', 'tex','fontsize',fontSizeLegend);
end
set(legend1, 'Fontname', 'Times New Roman','FontWeight','normal'); % ����legend����

token = strfind(titleName,' - '); if ~isempty(token), subst = token(1)+3; else, subst = 1; end % yu
title(titleName(subst:end),'fontsize',fontSize,'fontname','Times New Roman','fontweight','bold'); % ͼƬ����
xlabel(xLabelName,'fontsize',fontSize,'fontname','Times New Roman','fontweight','bold'); % ��������
ylabel(yLabelName,'fontsize',fontSize,'fontname','Times New Roman','fontweight','bold'); % ��������
set(gca,'FontName','Times New Roman','fontSize',fontSize,'fontweight','bold'); % ����������ֵ����
ylim([0 0.91]);
if showGrid == true
    grid on;
end
end