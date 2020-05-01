% set this to the supplementary files folder.
FILEPATH = 'C:\Users\Thomas Kil\Desktop\supp_v2'
%% PoseNet
logPath_fwd = [FILEPATH '/new_pred2/'];
options=0
[ pred_LOOP_BWD ] = evalLOOPdataset( logPath_fwd, options, errorPerSequenceBenchmark(FILEPATH) );
save('pred.mat', 'pred_LOOP_BWD');
%% ORB ALL
logPath_fwd = [FILEPATH '/ORB_SLAM_Forward/'];
logPath_bwd = [FILEPATH '/ORB_SLAM_Backward/'];
logPath_rt = [FILEPATH '/ORB_SLAM_Realtime_v2/'];

options=0:114
[ ORB_LOOP_BWD ] = evalLOOPdataset( logPath_bwd, options, errorPerSequenceBenchmark(FILEPATH) );
[ ORB_LOOP_FWD ] = evalLOOPdataset( logPath_fwd, options, errorPerSequenceBenchmark(FILEPATH) );

save('ORB.mat', 'ORB_LOOP_BWD', 'ORB_LOOP_FWD');

options=100:109
[ ORB_LOOP_RTFIX ] = evalLOOPdataset( logPath_rt, options, errorPerSequenceBenchmark(FILEPATH) );
save('ORB-REALTIME_FIX.mat');
%% MULTI ALL
logPath_fwd = [FILEPATH '/DS-VO_Forward/'];
logPath_bwd = [FILEPATH '/DS-VO_Backward/'];
logPath_rt = [FILEPATH '/DS-VO_Realtime/'];

options=0:374
[ DSO_LOOP_BWD ] = evalLOOPdataset( logPath_bwd, options, errorPerSequenceBenchmark(FILEPATH) );
[ DSO_LOOP_FWD ] = evalLOOPdataset( logPath_fwd, options, errorPerSequenceBenchmark(FILEPATH) );

save('DSO.mat', 'DSO_LOOP_BWD', 'DSO_LOOP_FWD');

options=1000:1019
[ DSO_LOOP_RT ] = evalLOOPdataset( logPath_rt, options, errorPerSequenceBenchmark(FILEPATH) );
save('DSO-REALTIME.mat');


