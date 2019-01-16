%
% Dataset : Blogcatalog
% Program Description: generates Global Structural Information (W) using
%                      GraRep
% Created By : Mili Biswas (MSc Computer Sc., UniFR)
%

%----------------------------------
% Below code is to import data
%----------------------------------

load('blogcatalog.mat');



%--------------------------------------------------------------------------
% Below code is for running GraRep & finally prepare embedding file for 
% the next task of fidning Macro and Micro F measure
%--------------------------------------------------------------------------

Nn=transpose(0:1:(size(network,1)-1));

for i=1:7

disp(datetime);   
W = GraRep(network,i,128);
disp(datetime);
WK = [Nn W];

%----------------------------------
% Write data into file
%----------------------------------

%dlmwrite(['/Users/milibiswas/Desktop/UNIFR/semester2/Data Science Seminar/matlab_program/blogcatalog_prog/blogcatalog_wk' num2str(i) '.embeddings'], WK, 'delimiter',' ');

end
