function y_interp = P_spline (coef, x, x_interp)
	% si(x)   = ai + bi(x - xi) + ci(x - xi)^2 + di(x - xi)^3, i = 0 : n - 1
	% coef = [a0, b0, c0, d0, a1, b1, c1, d1, ..., an-1, bn-1, cn-1, dn-1]
	% x = [x0, x1, ..., xn]
	% y_interp(i) = P_spline(x_interp(i)), i = 0 : length(x_interp) - 1
	% Be careful! Indexes in Matlab start from 1, not 0

	% TODO: Calculate y_interp using the Spline coefficients
  m = length(x_interp);
  n = length(x);
  n = n - 1;
  y_interp = zeros(n, 1);
  index = 1;
  
  for i = 1 : m
    for  j = index:n
      if x_interp(i) >= x(j) && x_interp(i) < x(j+1)
        index = j;
        break;
      endif
    endfor
    if x(index) > x_interp(i)
      index = index + 1;
    endif
    y_interp(i) = coef(4 * (index - 1) + 1) + coef(4 * (index - 1) + 2) * (x_interp(i) - x(index)) + coef(4 * (index - 1) + 3) * (x_interp(i)- x(index)) ^ 2 + coef(4 * (index - 1) + 4) * (x_interp(i)- x(index)) ^ 3;  
  endfor
end


