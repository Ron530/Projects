%Question 2, Lab 1.   Ronney Aovida

%Part (c)

fnc=@(z) z^3 -1;
fnc_deriv=@(z) 3*z^2;

x=linspace(-2,2,1000);
y=linspace(-2,2,1000);
[X,Y]=meshgrid(x,y);
root=zeros(length(X));
z=zeros(length(X));
for i= 1:1000
    for j=1:1000
        z(i,j)=(X(i,j)+1i*Y(i,j));
        temp2=newtons_method(fnc,fnc_deriv,z(i,j),20,.0001);
        root(i,j)=temp2(end);
    end

end
surf(real(z),imag(z),angle(root))
view(2)
shading interp
axis equal
axis([-2 2 -2 2])
