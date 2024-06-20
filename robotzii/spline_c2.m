function coef = spline_c2 (x, y)
  y = y';
	% Remember that the indexes in Matlab start from 1, not 0
  n = length(x);
	% si(x)   = ai + bi(x - xi) + ci(x - xi)^2 + di(x - xi)^3
	% si'(x)  =      bi         + 2ci(x - xi)  + 3di(x - xi)^2
	% si''(x) =                   2ci          + 6di(x - xi)
  mat_size = (n - 1) * 4;
  A = zeros(mat_size);
	% TOOD 1: si(xi) = yi, i = 0 : n - 1
  for i = 1 : n - 1
    A(i, 4 * (i - 1) + 1) = 1;
  endfor
	% TODO 2: s_n-1(xn) = yn
  A(n, 4 * (n - 1)) = 1;
  A(n, 4 * (n - 2) + 1 : 4 * (n - 1)) = x(n) - x(n - 1);
	% TODO 3: si(x_i+1) = s_i+1(x_i+1), i = 0 : n - 1
  for i = 1 : n - 2
    A(4 * i, i) = 1;
    A(4 * i, i + 1) = x(i + 1) - x(i);
    A(4 * i, i + 2) = (x(i + 1) - x(i)) ^ 2;
    A(4 * i, i + 3) = (x(i + 1) - x(i)) ^ 3;
    A(4 * i, i + 4) = -1;
    
    A(4 * i + 1, i + 1) = 1;
    A(4 * i + 1, i + 2) = 2 * (x(i + 1) - x(i));
    A(4 * i + 1, i + 3) = 3 * ((x(i + 1) - x(i)) ^ 2);
    A(4 * i + 1, i + 5) = -1;
    
    A(4 * i + 2, i + 2) = 2;
    A(4 * i + 2, i + 3) = 6 * (x(i + 1) - x(i));
    A(4 * i + 2, i + 6) = -2;
  endfor
	% TODO 4: si'(x_i+1) = s_i+1'(x_i+1), i = 0 : n - 1

	% TODO 5: si''(x_i+1) = s_i+1''(x_i+1), i = 0 : n - 1

	% TODO 6: s0''(x0) = 0
  A(4 * (n - 1) - 1, 3) = 2;
	% TODO 7: s_n-1''(x_n) = 0
  A(4 * (n - 1), 4 * (n - 1) - 1) = 2;
  A(4 * (n - 1), 4 * (n - 1)) = 6 * (x(n) - x(n - 1));
	% Solve the system of equations

  b(1 : n) = y;
  b(n + 1 : 4 * (n - 1)) = zeros(1, 3 * n - 4);
  b = b';
  coef = inv(A) * b;


end
