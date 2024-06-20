function similarity = cosine_similarity(A, B)
  # TODO: Compute the cosine similarity between two column vectors.
  normA = norm(A, 2);
  normB = norm(B, 2);
  similarity = (A' * B) / (normA * normB);
end
