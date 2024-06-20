function y_interp = P_vandermonde (coef, x_interp)
	% P_vandermonde(x) = a0 + a1 * x + a2 * x^2 + ... + an * x^n
	% coef = [a0, a1, a2, ..., an]'
	% y_interp(i) = P_vandermonde(x_interp(i)), i = 0 : length(x_interp) - 1
  n = length(x_interp);
  [lins cols] = size(coef);
  puteri = zeros(1, cols);
  for i = 1 : n
    puteri(1) = 1;
    for j = 2 : cols
      puteri(j) = puteri(j-1) * x_interp(i);
    endfor
    y_interp(i) = coef * puteri(1, :)';
  endfor
	% TODO: Calcualte y_interp using the Vandermonde coefficients
end
