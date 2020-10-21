%NOTE THAT our TETCI submission "Unbalanced Incomplete Multi-view Clustering via the Scheme of View Evolution:
%Weak Views are Meat; Strong Views do Eat"
% performs the experiments in MATLAB R2020b and our codes run on a Windows 10 machine with 3:30 GHz E3-1225 CPU, 64 GB main memory.
%This demo is only used to reproduce our experimental results, please do not use it for other purposes.
%
clear;
clc

Dataname = 'Digit';
alpha  = 1e-2;  
beta  = 1e5;
eta  = 1e-1;

% load multi-view dataset
load(Dataname);
truthF = y;  
num_cluster = length(unique(truthF));
num_instance=length(truthF);
num_view = length(X);

%average missing rate
per=0.4;
%the missing rate of each view
perDel=[0.25*per 0.75*per per 1.25*per 1.75*per];
for i = 1:num_view
folds(:,i) = randsrc(num_instance,1,[0 1; perDel(i) (1-perDel(i))]);
end




ind_folds = folds;
sum_miu=sum(sum(folds));


for iv = 1:num_view
    weight(iv)=sum(folds(:,iv))/sum_miu*num_view+1e-8;
    X1 = X{iv}';
    X1 = NormalizeFea(X1,1);
    ind_0 = find(ind_folds(:,iv) == 0);
    X1(ind_0,:) = [];       
    Y{iv} = X1';            
    W1 = eye(size(ind_folds,1));
    W1(ind_0,:) = [];
    M{iv} = W1;
end
clear sum_miu
clear X X1 W1
X = Y;
clear Y

for iv = 1:num_view
    options = [];
    options.NeighborMode = 'KNN';
    options.k = 3;
    options.WeightMode = 'Binary';
    A1 = constructW(X{iv}',options);
    %Initialize A
    A_ini{iv} = full(A1);  
    clear A1;
end

clear sum_miu weight_miu
 %Initialize F
F_ini = Init_F(A_ini,M,num_cluster);
%Set the maximum number of iterations
max_iter = 40;
%perform UIMC to obtain the consensus cluster indicator matrix for
%clustering
F_ast = UIMC(X,M,A_ini,F_ini,num_cluster,alpha,beta,eta,weight,max_iter);
% repeat experiment
repeat = 10;

norm_mat = repmat(sqrt(sum(F_ast.*F_ast,2)),1,size(F_ast,2));
for i = 1:size(norm_mat,1)
    if (norm_mat(i,1)==0)
        norm_mat(i,:) = 1;
    end
end
F_ast = F_ast./norm_mat; 
for iter_c = 1:repeat
    pre_labels    = kmeans(real(F_ast),num_cluster,'emptyaction','singleton','replicates',20,'display','off');
    results = ClusteringMeasure(truthF, pre_labels);   
    ACC(iter_c)    = results(1)*100;
    NMI(iter_c) = results(2)*100;
    Purity(iter_c)= results(3)*100;
end

mean_ACC = mean(ACC)
mean_NMI = mean(NMI)
mean_PUR = mean(Purity)
