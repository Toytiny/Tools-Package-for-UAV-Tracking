% ���ɸ��������������Ե�error��overlap���ע�����£�
% - ��Ҫ�� .\util\plotDrawSave.m ���ʵ�֣�˼·Ϊ���ɸ����Զ�Ӧ��.mat�ļ���Ȼ����ж�ȡ��
% - �����excel��ʽ���б���

function AboutAtt()

paperTitle = 'CVPR2020'; % ��ԵĻ�����ڿ����ƺ�����
evalType = 'OPE'; % 'SRE', 'OPE'

AttPerfDataPath = ['.\dataAnaly\', paperTitle, '\data_', evalType, '\'];
AboutAttPath = ['.\dataAnaly\', paperTitle, '\AboutAtt\'];
if ~exist(AboutAttPath, 'dir')
    mkdir(AboutAttPath);
end

typeOPE = {'Precision','Success'};

for typeNum = 1:length(typeOPE)   
	fprintf('Start making attributes table: %s.', typeOPE{typeNum});
    OJFiles = dir([AttPerfDataPath typeOPE{typeNum} '*OPE - *(*).mat']);
    len=length(OJFiles);
    temp = load([AttPerfDataPath num2str(OJFiles(1).name)]);
    OJ(1,:) = temp.rankingValues(1,:); % ��1�У�����������
    
    for ii = 1:len % ��2��-��13�У������Ե����ܵ÷�
        temp = load([AttPerfDataPath num2str(OJFiles(ii).name)]);
        row_count = ii+1;
        OJ(row_count,:) = temp.rankingValues(2,:);  %rankingValues����������ΪplotDrawSave���ñ�������ı���
    end
    
    overall = load([AttPerfDataPath typeOPE{typeNum} ' plots of ' evalType ' - ' typeOPE{typeNum} ' plots.mat']);
    OJ(row_count+1,:) = overall.rankingValues(2,:); % ���һ�У��������ܵ÷�
    
%     attName={'Scale variation' 'Aspect ratio variation' 'Occlusion'	'Deformation' 'Fast camera motion'	'In-plane rotation' 'Out-of-plane rotation'  'Out-of-view'	'Background clutter' 'Similar objects around' 'Motion blur'};
    attFigName={'Trackers' 'ARC' 'BC' 'CM' 'FM' 'FOC'	'IV' 'LR' 'OV' 'POC' 'SV' 'SOB'	'VC' 'Overall'}; % �б�
    
    OJ_1 = OJ'; % ԭ�� �б�Ϊtrakers���ݱ�Ϊ����threshold�����Լ���ת��
    OJ_1 = [attFigName;OJ_1(1:end,:)];
    
    saveDir = AboutAttPath; % ���浽24+2����ļ����µ�Mat��
    
    save([saveDir typeOPE{typeNum} '_att.mat'],'OJ_1');

    plot_table = importdata([saveDir typeOPE{typeNum} '_att.mat']);
    for ii = 2:size(plot_table,1)
        rowLabels{ii-1} = plot_table{ii, 1};
        for jj = 2:size(plot_table,2)
            aa = plot_table{ii,jj};
            matrix(ii-1,jj-1) = str2num(aa); % ע��matrix���Ԫ����char���ͣ�Ҫ�仯��
            columnLabels{jj-1} = plot_table{1, jj};
        end
    end
    
%     matrix = 100*matrix; % ת�ɰٷֺű�ʾ
    OJ_1(2:end, 2:end) = num2cell(matrix);
    xlswrite([saveDir typeOPE{typeNum} '_att.xlsx'], OJ_1);
	fprintf(' End!\n');
end
fprintf('All excel tables are in: %s\n', saveDir);
end