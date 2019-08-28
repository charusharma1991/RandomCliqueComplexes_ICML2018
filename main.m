function main()
%     d={};
    load('house.mat')
%     for i =1:10
%         d{i} = data{i};
%     end
%     data = d;
    err = GraphMatching(data);
    disp(err)
end
