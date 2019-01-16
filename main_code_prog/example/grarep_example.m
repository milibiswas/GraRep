%
% Short example of GraRep Model
% Program Written By : Mili Biswas (MSc Computer Sc., UniFr)
%
%

%------------------------- 
%  Input Section
%-------------------------

S=[0,1,0,0,0,0;
   1,0,1,1,1,0;
   0,1,0,0,0,1;
   0,1,0,0,0,1;
   0,1,0,0,0,1;
   0,0,1,1,1,0
   ]; % Adjacency Matrix of a Graph.

K=3;                   % k-step value
d=4;                   % dimension of each k-step


%-------------------------
%  Processing
%-------------------------

D = diag(sum(S), 0);    %degree matrix

A_1= D^(-1)*S;

A_2=A_1*A_1;

A_3=A_2*A_1;

[num_nodes, q] = size(S);
A_k = GetCoOccMatFromGraph(S, num_nodes, K);

RepMat = zeros(num_nodes, K*d);
for i = 1:K
    disp(['run the ', num2str(i), ' times...']);
    probTranMat = GetProbTranMat(A_k(:,:,i));
    Rk = GetRepUseSVD(probTranMat, d, 0.5);              %defalut value 0.5
    Rk = Rk./ ( repmat( sqrt(sum(Rk.^(2), 2)), 1, d) );  %scale by l2 norm
    RepMat(:, 1+d*(i-1):d*i) = Rk;                     %concatenation
end

RepMat(isnan(RepMat)==1) = 1;



W=GraRep(S,K,d);