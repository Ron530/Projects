function [phi_1,phi_2] = linear_basis(x,center,xcoord)


if (xcoord(center-1)< x) && x < xcoord(center)
phi_1= (x-xcoord(center-1))/(xcoord(center)-xcoord(center-1));

elseif (xcoord(center)< x) && x < xcoord(center+1)
phi_1=(x-xcoord(center+1))/(xcoord(center)-xcoord(center+1));
else 
    phi_1=0;
end


if (xcoord(center-1)< x) && (x < xcoord(center))
phi_2 = 1/(xcoord(center)-xcoord(center-1));

elseif (xcoord(center)< x) && (x < xcoord(center+1))
phi_2 = 1/(xcoord(center)-xcoord(center+1));
else
    phi_2=0;
end


end

