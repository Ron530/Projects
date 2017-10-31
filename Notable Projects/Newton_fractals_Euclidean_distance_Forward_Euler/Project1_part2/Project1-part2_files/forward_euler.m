%forward euler method. Ronney Aovida

function [Y,T] = forward_euler(fyt,y0,t0, Dt, Tf)





T= t0:Dt:Tf;

Y=zeros(length(y0),length(T));
Y(:,1)=y0;

for i=2:length(T)
Y(:,i)= Y(:,i-1)+Dt*fyt(Y(:,i-1),T(i-1));
end

return

end

