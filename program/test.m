%
% This below code is for 20newsgroup preprocess
% Written by Mili Biswas (MSc Computer Sc, UNIFR)
% Seminar on Data Science
%

readFcn = @extractFileText;
fds = fileDatastore('/Users/milibiswas/Desktop/UNIFR/semester2/Data Science Seminar/Dataset/20news-bydate/6NG/*','ReadFcn',readFcn);
bag = bagOfWords;
while hasdata(fds)
    str = read(fds);
    document = tokenizedDocument(str);
    bag = addDocument(bag,document);
end

M = tfidf(bag);
S1=full(M);
S2 = squareform(1-pdist(S1,'cosine'));

Final_result=zeros(1,2);

for K=16:16:128
%
% Below code is for running GraRep
%
NM=0;
W = GraRep(S2,3,K*2);
for i = 1:10
    
%Calculating the NMI for each consecutive pair
Idx1=kmeans(W,6);
Idx2=kmeans(W,6);

NM=NM+nmi(Idx1,Idx2);

end

NM=NM/10;

Final_result=[Final_result;[K*2,NM]];
end
sz=size(Final_result,1);
plot(Final_result(2:sz,1),Final_result(2:sz,2),'-.or');

axis tight; % removes the empty space after 3.3
set(gca,'XTick',32:32:256);% sets the x axis ticks
ylim([0,1]);
xlabel({'Dimension','(9NG)'});
ylabel({'NMI'});

