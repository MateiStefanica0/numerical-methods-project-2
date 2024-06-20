function signal = low_pass(x, fs, cutoff_freq)
  four = fft(x);
  n = length(x);
  %  calculam frecventele posibile, de la 0, la fs
  step = fs / n;
  for i = 0 : n - 1
    frecv_pos(i + 1) = i * step; % s-ar putea sa fie de la i
  endfor
  % creez masca
  masca = zeros(n, 1);
  for i = 1 : n
    if frecv_pos(i) <= cutoff_freq
      masca(i) = 1;
    endif
  endfor
  % am umplut masca
  %hadamard
  semnal_nou = masca .* four;
  %inversa fourier
  semnal_filtrat = ifft(semnal_nou);
  %normalizare
  signal = semnal_filtrat / max(abs(semnal_filtrat));
endfunction

