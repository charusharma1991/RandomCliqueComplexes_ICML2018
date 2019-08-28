function RelativeError = cRerror_Occ(gs,N,n,ptR,ptC)
tau =[];
trueRelativePerm = [];
n_norm = [];
count = 0;
for i = 1:1
    for j = i+1:N
    tau = [tau; gs{i}{j}];
    tru=1:n;
    if ~isempty(ptR{i})
        tru(ptR{i}(ptR{i}<n+1))=0;
    end
    if ~isempty(ptC{j})
        tru(ptC{j}(ptC{j}<n+1))=0;
    end
    trueRelativePerm = [trueRelativePerm;tru];
    count = count + length(find(tru));
    end
end
%tau(tau>n)=0;
trueRelativePerm(trueRelativePerm>n)=0;
RelativeError = zeros(size(trueRelativePerm));
ind = find(trueRelativePerm-tau);
RelativeError(ind)=1;
RelativeError = sum(sum(RelativeError))/count;
