function mat = read_mat(path)
  # TODO: Parse the .csv file and return the matrix of values (without row and column headers).
  mat = csvread(path);
  [m n] = size(mat);
  mat = mat(2:m, 2:n);
  
end
