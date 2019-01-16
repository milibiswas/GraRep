
%
% This below code is for 20newsgroup preprocess
% Written by Mili Biswas (MSc Computer Sc, UNIFR)
% Seminar on Data Science
%

readFcn = @extractFileText;
fds = fileDatastore('/Users/milibiswas/Desktop/UNIFR/sem2/Data Science Seminar/Dataset/20news-bydate/fulldata/*','ReadFcn',readFcn);
bag = bagOfWords;
while hasdata(fds)
    str = read(fds);
    document = tokenizedDocument(str);
    bag = addDocument(bag,document);
end


M = tfidf(bag,'TFWeight','binary');

%M=vertcat(M1,M2,M3);

S1=full(M);
S2 = squareform(1-pdist(S1,'cosine'));

x1=datetime();
W = GraRep(S2,3,8);
x2=datetime();