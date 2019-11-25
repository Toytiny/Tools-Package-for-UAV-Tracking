 % DFQ  2019/11/20

function run_all_trackers_UAV123(save_dir)                                        % û�����룬��Ĭ�ϱ����ڵ�ǰ�ļ����µ�\all_trk_results\
%%  ��ȡ��Ƶ���к�groundtruth
where_is_your_groundtruth_folder = 'D:\BaiduNetdiskDownload\UAV123\anno\UAV123';        % �����������ݼ�groundtruth�ļ���·��
where_is_your_UAV123_database_folder = 'D:\BaiduNetdiskDownload\UAV123\data_seq\UAV123';       % �����������ݼ�ͼƬ���е�·��
%UAV123���ݼ�����Ƶ���к�groundtruth�Ƿֿ���
%UAV123���ݼ���123����Ƶ���У��ܹ�112578֡ͼ��ƽ�����г���Ϊ915.27֡
tpye_of_assessment = 'UAV123';         % Ҫ���Ե����ͣ�'UAV123_10fps', 'UAV123', 'UAV123_20L'
addpath('.\UAV_Basic_Framework\');

%% Read all video names using grouthtruth.txt
type = tpye_of_assessment;
ground_truth_folder = where_is_your_groundtruth_folder;
dir_output = dir(fullfile(ground_truth_folder, '\*.txt'));             % ��ȡ���ļ����µ����е�txt�ļ�
contents = {dir_output.name}';  
all_video_name = cell(numel(contents),1);
for k = 1:numel(contents)
    name = contents{k}(1:end-4);                                       % ȥ����׺ .txt
    all_video_name{k,1} = name;                                    % �����������ݼ�����
end
dataset_num = length(all_video_name);                                  % ��groundtruth���ļ����õ����ݼ�����
main_folder = pwd;                                                     % ��ȡ��ǰ·��
all_trackers_dir = '.\tracker_set\';                                   % ��������tracker���ļ���
if nargin < 1
    save_dir = [main_folder '\all_trk_results\UAV123\'];              % ��������Ľ����ָ���ļ���
end
run_trackers_info = trackers_info();                                   % ��ȡ����tracker�ĺ�����Ϣ�����������run_xxx(seq, res_path, bSaveImage))������ʽ
tracker_name_set=cell(length(run_trackers_info),1);
for g=1:length(run_trackers_info)
    tracker_name_set(g) = fieldnames(run_trackers_info{g});                      % ��ȡtracker_set�ĳ�Ա��
end
tracker_num = length(tracker_name_set);                                % ��ȡtracker_set�������
cd(all_trackers_dir);                                                  % �����������tracker���ļ���
%%
for tracker_count = 1: tracker_num
    tracker_name = tracker_name_set{tracker_count};
    addpath(genpath(tracker_name));                                    % ����ļ����Լ��������ļ��е�·��
    cd(tracker_name);                                                  % ����ָ��tracker���ļ���
    save_res_dir = [save_dir, tracker_name,'\']; 
    save_pic_dir = [save_res_dir, 'res_picture\'];               
    if ~exist(save_res_dir, 'dir')
        mkdir(save_res_dir);
        mkdir(save_pic_dir);
    end
    
    for dataset_count=1:dataset_num
        video_name = all_video_name{dataset_count};           % ��ȡ���ݼ�����
        database_folder = where_is_your_UAV123_database_folder;
        seq = load_video_info_UAV123(video_name, database_folder, ground_truth_folder, type); % ����������Ϣ
 
        assignin('base','subS',seq);                                   % ��seqд�빤���ռ䣬����ΪsubS
       
        % main function
        run_tracker = getfield(run_trackers_info{tracker_count}, tracker_name_set{tracker_count}); %#ok<GFLD> % ���run_xxx�ĺ������
        fprintf('run %s on %d %s ', tracker_name, dataset_count, video_name);
        result = run_tracker(seq);               % ִ�и�tracker��������
     
        % save results
        results = cell(1,1);                                           % results�ǰ���һ���ṹ���Ԫ�����ṹ�����type,res,fps,len,annoBegin,startFrame������Ա
        results{1}=result;
        results{1}.len = seq.len;
        results{1}.annoBegin = seq.st_frame;
        results{1}.startFrame = seq.st_frame;
        fprintf('fps: %f\n', results{1}.fps);
        
        save([save_res_dir, video_name, '_', tracker_name,'.mat']);
        % plot precision figure
        show_visualization =false;                                       % ��ʾͼƬ��precision_plot�����
        precision_plot_save(results{1}.res, seq.ground_truth, video_name, save_pic_dir, show_visualization);
        close all;
    end
    cd ..;                                                             % �ص���������tracker���ļ�����
    rmpath(genpath(tracker_name));                                     % �Ƴ��ļ����Լ��������ļ��е�·��
end

