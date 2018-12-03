function E=label_vector_prep(group)
Z=full(group);
X=bin2dec((int2str(Z(:,:))));
L=0;
T=0;
for j = 1:size(X)
    if j>1
    for k = 1:(j-1)
        if X(j)==X(k)
           E(j)=E(k);
           T=1;
           break;
        end
        T=0;
    end
    else
        L=L+1;
        E(j)=L;
        
        T=1;
    end
    
    if T==0
        L=L+1;
        E(j)=L+1; 

    end
    
    
end

E=transpose(E);