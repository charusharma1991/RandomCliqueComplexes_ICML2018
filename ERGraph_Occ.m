function [Graph1,Graph2] = ERGraph_Occ(data1,data2,nv1,nv2,p,k)
nonZero1 = find(sum(data1,2));
nonZero2 = find(sum(data2,2));
newdata1=data1(nonZero1,:);
newdata2=data2(nonZero2,:);
nnv1=length(nonZero1);
nnv2=length(nonZero2);
dis11 = pdist2(newdata1,newdata1);
dis22 = pdist2(newdata2,newdata2);
[~,id1] = sort(dis11,2);
[~,id2] = sort(dis22,2);
maxR=-1;
for r = 1:100
    G1=zeros(nnv1,nnv1);
    G2=zeros(nnv2,nnv2);
    for i=1:nnv1
        for j=2:k
            x1=rand;
            if x1<p
                G1(i,id1(i,j))=1;
                G1(id1(i,j),i)=1;
            end
        end
    end
    for i=1:nnv2
        for j=2:k
            x2=rand;
            if x2<p
                G2(i,id2(i,j))=1;
                G2(id2(i,j),i)=1;
            end
        end
    end
    if nnv1~=nv1
        newG1 = zeros(nv1,nnv1);
        k2=1;
        for k1=1:nv1
            if ~ismember(k1,nonZero1)
                newG1(k1,:)=0;
            else
                newG1(k1,:)=G1(k2,:);
                k2=k2+1;
            end
        end
        newG1 = [newG1 zeros(nv1, nv1-nnv1)];
        for k1=1:nv1
            if ~ismember(k1,nonZero1)
                newG1=[newG1(:,1:k1-1) circshift(newG1(:,k1:nv1),[0,1])];
            end
        end
        G1=newG1;
    end
    if nnv2~=nv2
        newG2 = zeros(nv2,nnv2);
        k2=1;
        for k1=1:nv2
            if ~ismember(k1,nonZero2)
                newG2(k1,:)=0;
            else
                newG2(k1,:)=G2(k2,:);
                k2=k2+1;
            end
        end
        newG2 = [newG2 zeros(nv2, nv2-nnv2)];
        for k1=1:nv2
            if ~ismember(k1,nonZero2)
                newG2=[newG2(:,1:k1-1) circshift(newG2(:,k1:nv2),[0,1])];
            end
        end
        G2=newG2;      
    end
    R = corrcoef(G1,G2);
    nz1 = find(sum(G1,2));
    nz2 = find(sum(G2,2));
    if R(1,2)>maxR && length(nz1)==length(nonZero1) && length(nz2)==length(nonZero2) 
        maxR=R(1,2);
        Graph1=G1;
        Graph2=G2;
    end
end
