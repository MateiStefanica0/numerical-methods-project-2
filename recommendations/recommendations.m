function recoms = recommendations(path, liked_theme, num_recoms, min_reviews, num_features)
  # TODO: Get the best `num_recoms` recommandations similar with 'liked_theme'.
  mat = read_mat(path);
  preprocessed_mat = preprocess(mat, min_reviews);
  [U S V]  = svds(preprocessed_mat, num_features);
  liked_theme_index = liked_theme;
  liked_theme = V(liked_theme_index, :);
  
  % creare vector indici
  [m n] = size(V);
  indici = 1 : m
  indici = indici';
  
  % sortare
  
  for i = 1 : m - 1
    for j = i + 1 : m
      if (cosine_similarity(V(i, :)', liked_theme') < cosine_similarity(V(j, :)', liked_theme'));
        aux = V(i, :);
        V(i, :) = V(j, :);
        V(j, :) = aux;
        aux = indici(i);
        indici(i) = indici(j);
        indici(j) = aux;
      endif
    endfor
  endfor
  recoms = [];
  for i = 1 : num_recoms
    recoms = [recoms indici(i + 1)];
  endfor
end
