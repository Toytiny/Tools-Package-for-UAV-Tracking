% DFQ 2019/11/20
function trackers=configTrackers
        
    % configTrackers for loops
    %��������ֶ���д
    set1=[1 2 3 4];
    set2=[1 2 3 4] ;
    set3=[1 2 3 4];
    set4=[1 2 3 4];  
    tracker_name='BACF';
    num_loops=length(set4)*length(set1)*length(set2)*length(set3);
    trackers_loop=cell(1,num_loops);
     for i=1:length(set1)
        for j=1:length(set2)
            for k=1:length(set3)
                for p=1:length(set4)
                        Name=[tracker_name,num2str(set1(i)),'_',num2str(set2(j)),'_',num2str(set3(k)),'_',num2str(set4(p))];
                        Paper=[tracker_name,num2str(set1(i)),'\_',num2str(set2(j)),'\_',num2str(set3(k)),'\_',num2str(set4(p))];
                        trackers_loop{length(set3)*length(set2)*length(set4)*(i-1)+length(set4)*length(set3)*(j-1)+length(set4)*(k-1)+p}=struct('name',Name,'namePaper',Paper);
                end
            end
        end
     end
     % configTrackers for loops
     % ÿһ��Ϊһ��������ֶ���д��
     group=[1 2 3 4;2 3 4 1;4 1 2 3;5 6 7 8];
     tracker_name='AutoTrack';
     trackers_group=cell(1,size(group,1));
     for l=1:length(trackers_group)
        Name=[tracker_name,num2str(group(l,1)),'_',num2str(group(l,2)),'_',num2str(group(l,3)),'_',num2str(group(l,4))];
        Paper=[tracker_name,num2str(group(l,1)),'\_',num2str(group(l,2)),'\_',num2str(group(l,3)),'\_',num2str(group(l,4))];
        trackers_group{l}=struct('name',Name,'namePaper',Paper);
     end
     % config Trackers for all method
    trackers_all = {
    struct('name','DCF','namePaper','DCF'),...
  };

trackers= trackers_all;   %trackers_loop��trackers_group
