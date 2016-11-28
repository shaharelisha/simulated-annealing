function z = my_function(x, y)

z = - 3*(1-x).^3.*exp(-(x.^2) - (y+1).^2) ... 
   + 20*(x/7 - x.^3 - y.^4).*exp(-x.^2-y.^2) ... 
   - 1/2*exp(-(x+1).^2 - 2*y.^2);

end

