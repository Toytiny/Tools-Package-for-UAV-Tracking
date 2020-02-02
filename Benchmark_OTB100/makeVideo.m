% д��ͼƬ֡������Ƶ���ļ�

close all;
clear,clc;

fps = 30; % ��Ƶ֡�ʣ�Ĭ����30����Ϊ�õ���DTB70���ݼ�������ѡ30
paperTitle = 'ECCV2020'; % ��ԵĻ�����ڿ����ƺ�����
framesPath = ['.\dataAnaly\', paperTitle, '\videoImgs\']; % ͼ����������·��
videosPath = ['.\dataAnaly\', paperTitle, '\videos\']; % ������Ƶ�ļ���
if ~exist(videosPath, 'dir')
    mkdir(videosPath);
end
files_struct = dir(fullfile(framesPath));
files_struct(1:2) = []; % ɾ��.��..�ļ���
num_seqs = length(files_struct);

fprintf('Total number of videos: %d\n', num_seqs);

t_video_make_st = clock;

parfor seq_count = 1 : num_seqs
    video_name = files_struct(seq_count).name;
    target_frames = dir([framesPath video_name '/*.png']); % ͼƬ��׺��png
    start_frame = 1; % ��ʼ֡
    end_frame = length(target_frames); % ����֡
    video = [videosPath video_name '.avi']; % ������������Ƶ
    if exist(video, 'file') % �ļ����ڷ���2
        delete(video); % ��֤������Ƶ����ʱ��ʼʱ��Ϊ��
    end
    fprintf('Start making video %d: %s', seq_count, video_name);
    video_object = VideoWriter(video);  % ����avi��Ƶ�ļ�����
    video_object.FrameRate = fps;
    open(video_object); % ���ļ��ȴ�д��
    for frame = start_frame : end_frame % ����ͼƬ
        % fileName=sprintf('%04d',i); % �����ļ�������
        file_name=num2str(frame);
        frames = imread([framesPath video_name '/' file_name,'.png']);
        writeVideo(video_object, frames); % д������
    end
    close(video_object); % �ر��ļ�
    fprintf(' End!\n');
end
t_video_make_end = clock;
t_video_make = etime(t_video_make_end, t_video_make_st);
fprintf('End making videos, total time spent: %.2fs. All videos are in: %s\n', t_video_make, videosPath);
