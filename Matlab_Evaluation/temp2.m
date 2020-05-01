%% Non-shuffled
clc, clear
list = {'01','02','03','04','05','06','07','08','09','10','11','12','13','14','15'};
for i = 1:length(list)
    seq = load(['C:\Users\Thomas Kil\Desktop\supp_v2\gtFiles\sequence_' list{i} '.txt']);
    idxs = [];
    times = [];
    for j = 1:size(seq,1)
        curr = seq(j,:);
        if (sum(isnan(curr)) == 0)
           idxs(end+1) = j;
           times(end+1) = curr(1);
        end
    end

    idxs = idxs';
    times = times';

   pred = load(['C:\Users\Thomas Kil\Desktop\supp_v2\pred\sequence_' list{i} '_0.txt']);
   
   new_pred = [times, pred];
   
   fid = fopen(['C:\Users\Thomas Kil\Desktop\supp_v2\new_pred\sequence_' list{i} '_0.txt'], 'wt');
   for j = 1:size(new_pred,1)
       fprintf(fid,'%f %f %f %f %f %f %f %f\n',new_pred(j,:));
   end
   fclose(fid);
end

%% Shuffled
clc, clear
list = {'01','02','03','04','05','06','07','08','09','010','011','012','013','014','015'};
orig_list = {'01','02','03','04','05','06','07','08','09','10','11','12','13','14','15'};
for i = 1:length(list)
    seq = load(['C:\Users\Thomas Kil\Desktop\supp_v2\gtFiles\sequence_' orig_list{i} '.txt']);
    data = [];
    for j = 1:size(seq,1)
        curr = seq(j,:);
        if (sum(isnan(curr)) == 0)
           data(end+1,:) = curr;
        end
    end
    % Shuffled GT
    shuffled = load(['C:\Users\Thomas Kil\Desktop\supp_v2\pred2\gt_sequence_' list{i} '.txt']);
    data_no_time = data(:,2:end);
    idxs = [];
    for j = 1:size(shuffled,1)
        curr = shuffled(j,:);
        difference = data_no_time - curr;
        l2norm = vecnorm(difference,2,2);
        [~, idx] = min(l2norm);
        idxs(end+1) = idx;
    end
    idxs = idxs';
%     [sorted_idx,idxs] = sort(idxs);
    % Shuffled predictions
    pred = load(['C:\Users\Thomas Kil\Desktop\supp_v2\pred2\sequence_' list{i} '.txt']);
    times = data(:,1);
    times = times(idxs);
    new_pred = [times, pred];

    [~,idx] = sort(times);
    sorted_pred = new_pred(idx,:);
    fid = fopen(['C:\Users\Thomas Kil\Desktop\supp_v2\new_pred2\sequence_' list{i} '_0.txt'], 'wt');
    for j = 1:size(new_pred,1)
       fprintf(fid,'%f %f %f %f %f %f %f %f\n',sorted_pred(j,:));
    end
    fclose(fid);
end
