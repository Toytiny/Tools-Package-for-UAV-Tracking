 % DFQ  2019/11/20

 function LoopsOnUAVDT(save_dir)                                        % û�����룬��Ĭ�ϱ����ڵ�ǰ�ļ����µ�\all_trk_results\
%%  ��ȡ��Ƶ���к�groundtruth
where_is_your_groundtruth_folder = 'D:\BaiduNetdiskDownload\UAVDT\anno';        % �����������ݼ�groundtruth�ļ���·��
where_is_your_UAVDT_database_folder = 'D:\BaiduNetdiskDownload\UAVDT\data_seq\';       % �����������ݼ�ͼƬ���е�·��
%UAVDT���ݼ�����Ƶ���к�groundtruth�Ƿֿ���
%UAVDT���ݼ���50����Ƶ���У��ܹ�37084֡ͼ��ƽ�����г���Ϊ741.68֡
 addpath('.\UAV_Basic_Framework\');
run_trackers_info = struct('AutoTrack',@run_AutoTrack);           %��Ҫ���ε�tracker

%% Read all video names using grouthtruth.txt
ground_truth_folder = where_is_your_groundtruth_folder;
dir_output = dir(fullfile(ground_truth_folder, '\*.txt'));             % ��ȡ���ļ����µ����е�txt�ļ�
contents = {dir_output.name}';  
all_video_name = cell(numel(contents),1);
for k = 1:numel(contents)
    name = contents{k}(1:end-7);                                       % ȥ����׺ .txt
    all_video_name{k,1} = name;                                    % �����������ݼ�����
end
dataset_num = length(all_video_name);                                  % ��groundtruth���ļ����õ����ݼ�����
main_folder = pwd;                                                     % ��ȡ��ǰ·��
all_trackers_dir = '.\tracker_set\';                                   % ��������tracker���ļ���
tracker_name = fieldnames(run_trackers_info);                      % ��ȡtracker_set�ĳ�Ա��
tracker_name=tracker_name{1};
cd(all_trackers_dir);                                                  % �����������tracker���ļ���
addpath(genpath(tracker_name));                                    % ����ļ����Լ��������ļ��е�·��
cd(tracker_name);         
if nargin < 1
    save_dir = [main_folder '\loop_results\UAVDT\'];              % ��������Ľ����ָ���ļ���
end
%%
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
    database_folder = where_is_your_UAVDT_database_folder;
    seq = load_video_info_UAVDT(database_folder, ground_truth_folder, video_name); % ����������Ϣ
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
   
        