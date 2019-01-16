%data visualization using t-sne toolki
% Created by Mili Biswas(MSc. Comp. Sc., UniFr)
% 30-Dec-2018

% Load data
%train_X=load("mnist_train.mat");
%ind = randperm(size(train_X, 1));
%train_X = train_X(ind(1:5000),:); 
%train_labels = train_labels(ind(1:5000));
% Set parameters

train_label=[ones(200,1);2*ones(200,1);3*ones(200,1)];

no_dims = 2; 
initial_dims = 50; 
perplexity = 30;
tmp=W;
% Run t−SNE
mappedX = tsne(W,[], no_dims, initial_dims, perplexity);
% Plot results
gscatter(mappedX(:,1), mappedX(:,2),train_label);
