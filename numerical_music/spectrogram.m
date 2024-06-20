function [S f t] = spectrogram(signal, fs, window_size)
	S = [];
  f = 0;
  t = 0;
  signal_size = length(signal);
  nr_of_windows = floor(signal_size / window_size);
  
  hann = hanning(window_size); % i
  for i = 0 : nr_of_windows - 1
    window = signal(i * window_size + 1 : i * window_size + window_size);
    window = window .* hann;
    four = fft(window, 2 * window_size); %ii
    four = four(1 : length(four) / 2, :); %iii
    S = [S abs(four)];
  endfor

  resolution = fs / (2 * window_size);
  f = 0 : resolution : fs / 2;
  f = f';
  f = f(1 : length(f) - 1); % asa e in datele de ref
  
  step = window_size / fs;
  t = 0 : step : (nr_of_windows - 1) * step;
  t = t';
endfunction

