function mono = stereo_to_mono(stereo)
  % mono = stereo;
  [m n] = size(stereo);

  mono = zeros(m, 1);
  for i = 1 : m
    sum = 0;
    for j = 1 : n
      sum = sum + stereo(i, j);
    endfor
    sum = 1 / n * sum;
    mono(i) = sum;
  endfor
  %mono = 1/n * mono;
  % Normalize
  mono = mono / max(abs(mono));
endfunction

