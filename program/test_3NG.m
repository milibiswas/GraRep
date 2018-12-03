%
% This below code is for 20newsgroup preprocess
% Written by Mili Biswas (MSc Computer Sc, UNIFR)
% Seminar on Data Science
%

readFcn = @extractFileText;
fds = fileDatastore('/Users/milibiswas/Desktop/UNIFR/semester2/Data Science Seminar/Dataset/20news-bydate/3NG/1/*','ReadFcn',readFcn);
bag = bagOfWords;
while hasdata(fds)
    str = read(fds);
    document = tokenizedDocument(str);
    bag = addDocument(bag,document);
end

%M1 = tfidf(bag);

readFcn = @extractFileText;
fds = fileDatastore('/Users/milibiswas/Desktop/UNIFR/semester2/Data Science Seminar/Dataset/20news-bydate/3NG/2/*','ReadFcn',readFcn);
%bag = bagOfWords;
while hasdata(fds)
    str = read(fds);
    document = tokenizedDocument(str);
    bag = addDocument(bag,document);
end

%M2 = tfidf(bag);

readFcn = @extractFileText;
fds = fileDatastore('/Users/milibiswas/Desktop/UNIFR/semester2/Data Science Seminar/Dataset/20news-bydate/3NG/3/*','ReadFcn',readFcn);
%bag = bagOfWords;
while hasdata(fds)
    str = read(fds);
    document = tokenizedDocument(str);
    bag = addDocument(bag,document);
end


M = tfidf(bag,'TFWeight','binary');

%M=vertcat(M1,M2,M3);

S1=full(M);
S2 = squareform(1-pdist(S1,'cosine'));

%fileID = fopen('/Users/milibiswas/Desktop/UNIFR/semester2/Data Science Seminar/Dataset/20news-bydate/label_3ng.txt','r');

%formatSpec = '%f';

%Idx1 = fscanf(fileID,formatSpec);

Idx1=zeros(600,1);

   Idx1(1:200)=1; 
   Idx1(201:400)=2;
   Idx1(401:600)=3;

Final_result=zeros(1,2);

for K=16:16:128
%
% Below code is for running GraRep
%
NM=0;
W = GraRep(S2,3,K*2);
for i = 1:10
    
%Calculating the NMI for each consecutive pair
%Idx2=kmeans(W,2);
Idx2=kmeans(W,3,'MaxIter',10000,'Display','final','Replicates',15,'Distance','cosine');

NM=NM+nmi(Idx1,Idx2);

end

NM=NM/10;

Final_result=[Final_result;[K*2,NM]];
end

%------- This is for visualization ---------%
sz=size(Final_result,1);
plot(Final_result(2:sz,1),Final_result(2:sz,2),'-.or');

axis tight; % removes the empty space after 3.3
set(gca,'XTick',32:32:256);% sets the x axis ticks
ylim([0,1]);
xlabel({'Dimension','(3NG)'});
ylabel({'NMI'});

%gscatter(W(:,3),W(:,4),Idx1,'brg','xo+');
%xlabel('X');
%ylabel('Y');