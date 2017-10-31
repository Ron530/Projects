function df = centre_deriv(f, h)
%% returns the centred derivative approximation to f'(0)

df = (f(h) - f(-h))/(2*h);

