function signal = apply_reverb(signal, impulse_response)
  mono_signal = stereo_to_mono(signal);
  monoa_impulse = stereo_to_mono(impulse_response);
  conv = fftconv(mono_signal, monoa_impulse);
  signal = conv / max(abs(conv));
endfunction

