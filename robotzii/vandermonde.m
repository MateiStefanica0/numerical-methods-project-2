function coef = vandermonde(x, y)
    x = x';
    y = y';
    % x = [x0, x1, ..., xn]'
    % y = [y0, y1, ..., yn]'
    % coef = [a0, a1, a2, ..., an]'
    n = length(x);
    disp(n);
    A = zeros(n);
    for i = 1 : n
      A(i, 1) = 1;
      A(i, 2) = x(i);
    endfor
    for i = 1 : n
      for j = 3 : n
        A(i, j) = A(i, j - 1) * x(i);
      endfor
    endfor
    coef = A \ y;
    coef = coef';
    % TODO: Calculate the Vandermonde coefficients
endfunction
