function [H, neighborhood, neighborCoeff] = Get_Reconstruction_Coeff( pts, E )

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% INPUT
% pts           An N x 2 matrix which represents a N point-set
% E             An N x N 0-1 edge matrix. The ith row records the ith 
%               point's neighbors
% 
% OUTPUT
% H             The N x N reconstruction matrix. H = I - W. 
%               Ideally, H * pts should be an N x 2 zero matrix.
% neighborhood  An N x 1 cell vector. The ith element records the ith point's 
%               neighbors' indices.
% neighborCoeff An N x 1 cell vector. The ith element records the ith point's 
%               neighbors' reconstruction weights.
% trustRegion   An Nm x 4 trust region matrix. The ith row records ith
%               model point's trust region. Each row has a data
%               structure like [x_min x_max y_min y_max]
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

[Nm, d] = size( pts );

neighborCoeff = cell( Nm, 1 );
neighborhood = cell( Nm, 1 );

for i = 1:Nm
    neighborhood{i} = find( E(i,:) ~= 0 );
    
    if length( neighborhood{i} ) < 1
        error('E matrix illegal!\n The %dth point has at most 0 neighbors!\n', i);
    end
end

% Calculate the convex combination
% H = I - W
H = sparse( Nm, Nm );

for i = 1:Nm
     fprintf( 1, 'The %dth point.', i );
    
     % current point
     m = pts(i,:);
     % all neighbors
     n = pts( neighborhood{i}, : );
     % number of three neighbors
     nNum = length( neighborhood{i} );
     
     % set up sum(w) = 1
     A = ones( d+1, nNum );
     % set up d rows to be points
     A( 2:end, : ) = n';
     
     % set up sum(w) = 1
     b = ones( d+1, 1 );
     % set up recovered points
     b( 2:end ) = m;
     
     w = lsqr( A, b, 1e-12, 10 );
     
     neighborCoeff{i} = w;
     %disp(w)
     H( i, neighborhood{i} ) = -w;
     H( i, i ) = 1;
end
%disp(H)
H = sparse(H);
