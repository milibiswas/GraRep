%
% This below code is for blogcatalog data preprocess
%

%
% Below code is for running GraRep
%

W = GraRep(network(1:500,1:500),6,128);
%Idx=kmeans(W,15);
%silhouette(W,Idx,'sqeuclidean');

%gscatter(W(:,3),W(:,4),Idx,'brg','xo+');
%xlabel('X');
%ylabel('Y');


%
%The below code is for multiclass 
%

E=label_vector_prep(group);
Y=sparse(W);

model=train(E(1:500),Y(1:500,:),'-s 4');
%[predict_label, accuracy, prob_estimates] = predict(E(1:500),Y(1:500,:), model);

%[ micro, macro ]=micro_macro_PR( predict_label , E(4001:5000));

