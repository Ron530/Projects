%Newtons method.    Ronney Aovida    

function [x1,iteration] = newtons_method(fnc,fnc_deriv,x0, maxiter, tolerance)

   
x1=zeros(maxiter,1);

iteration=1;
x1(1)=x0;
while (iteration<maxiter && abs(fnc(x0)) > tolerance)|| iteration==0
    
    x1(iteration+1)=x0-fnc(x0)/fnc_deriv(x0);
    iteration=iteration+1;
    
    if abs(x1(iteration)-x0)<tolerance
        break;
    else
        x0=x1(iteration);
    end
end
x1= x1(1:iteration);
return
end

            
       
        





