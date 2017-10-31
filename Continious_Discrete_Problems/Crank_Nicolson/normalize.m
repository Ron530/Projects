function X = normalize (X , l , h )

minX = min (X (:) );
maxX = max (X (:) );
%Normalize from 0 to 1
X = X - minX ;
X = X ./ ( maxX - minX ) ;
% Scale from low to high
X = X .* (h -l);
X = X + l;
end

