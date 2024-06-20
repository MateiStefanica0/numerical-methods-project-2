function reduced_mat = preprocess(mat, min_reviews)
  # TODO: Remove all user rows from `mat` that have strictly less then `min_reviews` reviews.
  [m n] = size(mat);
  i = 1;
  while i <= m
    cnt = 0;
    for j = 1 : n
      if mat(i, j) > 0
        cnt = cnt + 1;
      endif
    endfor
    if cnt < min_reviews
      mat(i, :) = [];
      i = i - 1;
      m = m - 1;
    endif  
    i = i + 1;
  endwhile
  reduced_mat = mat;
end
