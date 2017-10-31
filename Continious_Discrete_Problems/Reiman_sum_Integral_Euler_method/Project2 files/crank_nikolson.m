function [Y,T] = crank_nikolson(y0,t0, Dt, Tf,func,dfunc)





T= t0:Dt:Tf;

Y=zeros(length(y0),length(T));
Y(:,1)=y0;

for i=2:length(T)
Y(:,i)= eulerstep(func,dfunc,Y(i-1),T(i),Dt);
end

return

end



