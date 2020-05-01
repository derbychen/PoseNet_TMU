clc, clear
load('C:\Users\Thomas Kil\Desktop\evaluation_code_v2\Matlab_Evaluation\pre-evaluated\data.mat')
%% DSO
DSO_Terr_seqs = DSO_LOOP_FWD.LOOPerrT(1:15,:);
DSO_Rerr_seqs = DSO_LOOP_FWD.LOOPerrR(1:15,:);

DSO_Terr_mean = zeros(size(DSO_Terr_seqs,1),1);
DSO_Rerr_mean = zeros(size(DSO_Rerr_seqs,1),1);
for i = 1:size(DSO_Terr_seqs,1)
    % Translation
    DSO_Terr_seq = DSO_Terr_seqs(i,:);
%     DSO_Terr_seq ~= Inf || 
    non_idx = find(DSO_Terr_seq < 1);
    DSO_Terr_seq = DSO_Terr_seq(non_idx);
    DSO_Terr_mean(i) = mean(DSO_Terr_seq);
    % Rotation
    DSO_Rerr_seq = DSO_Rerr_seqs(i,:);
    DSO_Rerr_seq = DSO_Rerr_seq(non_idx);
    DSO_Rerr_mean(i) = mean(DSO_Rerr_seq);
end

%% ORB
ORB_Terr_seqs = ORB_LOOP_FWD.LOOPerrT(1:15,:);
ORB_Rerr_seqs = ORB_LOOP_FWD.LOOPerrR(1:15,:);

ORB_Terr_mean = zeros(size(ORB_Terr_seqs,1),1);
ORB_Rerr_mean = zeros(size(ORB_Rerr_seqs,1),1);
for i = 1:size(ORB_Terr_seqs,1)
    % Translation
    ORB_Terr_seq = ORB_Terr_seqs(i,:);
%     non_Tinf_idx = find(ORB_Terr_seq ~= Inf);
    non_idx = find(ORB_Terr_seq < 5);
    ORB_Terr_seq = ORB_Terr_seq(non_idx);
    ORB_Terr_mean(i) = mean(ORB_Terr_seq);
    % Rotation
    ORB_Rerr_seq = ORB_Rerr_seqs(i,:);
    ORB_Rerr_seq = ORB_Rerr_seq(non_idx);
    ORB_Rerr_mean(i) = mean(ORB_Rerr_seq);
end
