%
% This script will plot the running time data as experimented 
% for 20newsgroup
%
% Created by Mili Biswas (MSc, Comp. Sc, UniFr)
%
%
%  Here input data is the output from newgroup_runtime.m

%------- This is for visualization ---------%

Final_result=[600,1;1200,3;1800,9;3376,64;4189,122];
plot(Final_result(:,1),Final_result(:,2),'-.or');

axis tight; % removes the empty space after 3.3
xlim([500,5000]);
ylim([0,150]);
xlabel({'Number of Nodes'});
ylabel({'Time in Seconds'});

