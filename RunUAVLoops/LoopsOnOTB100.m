 % Fangqiang Ding 2019/2/2

function LoopsOnOTB100(save_dir)                                        % û�����룬��Ĭ�ϱ����ڵ�ǰ�ļ����µ�\loop_results\
%%  ��ȡ��Ƶ���к�groundtruth
where_is_your_OTB100_database_folder = 'D:\BaiduNetdiskDownload\OTB100'; % �����������ݼ�ͼƬ���к�groundtruth��·��
%OTB100���ݼ�����Ƶ���к�groundtruth����һ���
%OTB100����100�����ݼ����ܹ�59040֡ͼ��ƽ�����г���590.4֡
addpath('.\UAV_Basic_Framework\');
run_trackers_info = struct('STAPLE',@run_STAPLE);           %��Ҫ���ε�tracker

%% Read all video names using grouthtruth.txt
dir_output = dir(fullfile(where_is_your_DTB70_database_folder));             % ��ȡ���ļ����µ����е�txt�ļ�
contents = {dir_output.name}';
all_video_name = cell(numel(contents)-2,1);
for k = 3:numel(contents)
    name = contents{k}(1:end);                                       % ȥ����׺ .txt
    all_video_name{k-2,1} = name;                                    % �����������ݼ�����
end
dataset_num = length(all_video_name);                                  % ��groundtruth���ļ����õ����ݼ�����
main_folder = pwd;                                                     % ��ȡ��ǰ·��
trackers_dir = '.\tracker_set\';                                   % ��������tracker���ļ���
tracker_name=fieldnames(run_trackers_info);                      % ��ȡtracker_set�ĳ�Ա��
tracker_name=tracker_name{1};
cd(trackers_dir);                                                  % �������tracker���ļ���
addpath(genpath(tracker_name));                                    % ����ļ����Լ��������ļ��е�·��
cd(tracker_name);                                                  % ����ָ��tracker���ļ���
if nargin < 1
    save_dir = [main_folder '\loop_results\OTB100\'];              % ��������Ľ����ָ���ļ���
end


% ��Ҫ���Ĳ���ϵ��ֵ�Լ�������(�ֶ�����)
set1=[1 2 3 4 5];    name1='p1';
set2=[1 2 3 4 5];    name2='p2';
set3=[1 2 3 4 5];    name3='p3';
set4=[1 2 3 4 5];    name4='p4';

% ��Ҫ�ܵ�����
num_loops=length(set1)*length(set2)*length(set3)*length(set4);

% ��������sequences
for dataset_count =1:dataset_num
    video_name = all_video_name{dataset_count};                    % ��ȡ���ݼ�����
    database_folder = where_is_your_OTB100_database_folder;
    seq = load_video_info_OTB100([database_folder '\' video_name]);% ����������Ϣ
    assignin('base','subS',seq);                                   % ��seqд�빤���ռ䣬����ΪsubS
    % main function
    run_tracker = getfield(run_trackers_info, tracker_name); %#ok<GFLD> % ���run_xxx�ĺ������

    for i=1:length(set1)
        for j=1:length(set2)
            for m=1:length(set3)
                for n=1:length(set4)
                    param1=set1(i);
                    param2=set2(j);
                    param3=set3(m);
                    param4=set4(n);
                    index=(i-1)*length(set2)*length(set3)*length(set4)+(j-1)*length(set3)*length(set4)+(m-1)*length(set4)+n;
                    save_res_dir = [save_dir, tracker_name,num2str(param1),'_',num2str(param2),'_',num2str(param3),'_',num2str(param4),'\']; 
                    if ~exist(save_res_dir, 'dir')
                    mkdir(save_res_dir);
                    end
                    fprintf('%s Loop on %d %s\nindex:%d/%d     ', tracker_name, dataset_count, video_name,index,num_loops);
                    result = run_tracker(seq,param1,param2,param3,param4);               % ִ�и�tracker��������, ע���޸���Ҫ������tracker�Ľӿڵ��������
                    % save results
                    results = cell(1,1);                                           % results�ǰ���һ���ṹ���Ԫ�����ṹ�����type,res,fps,len,annoBegin,startFrame������Ա
                    results{1}=result;
                    results{1}.len = seq.len;
                    results{1}.annoBegin = seq.st_frame;    
                    results{1}.startFrame = seq.st_frame;
                    fprintf('fps: %f\n', results{1}.fps);
                    
                    save([save_res_dir, video_name, '_', tracker_name,num2str(param1),'_',num2str(param2),'_',num2str(param3),'_',num2str(param4),'.mat']);
                    % plot precision figure
%                     show_visualization =false;                                       % ��ʾͼƬ��precision_plot�����
%                     precision_plot_save(results{1}.res, seq.ground_truth, video_name, save_pic_dir, show_visualization);
%                     close all;
                end
            end
        end
    end
end
   