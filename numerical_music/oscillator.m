function x = oscillator(freq, fs, dur, A, D, S, R)
    % Create vector t
    t = linspace(0, dur, dur * fs + 1);
    
    %sine wave
    sinewave = sin(2*pi*freq*t);
    
    %samples
    A_sample = floor(fs * A);
    D_sample = floor(fs * D);
    R_sample = floor(fs * R);
    S_sample = dur * fs - A_sample - D_sample - R_sample;
    
    A_env = linspace(0, 1, A_sample + 1);
    D_env = linspace(1, S, D_sample + 1);
    S_env = S * ones(1, S_sample + 1);
    R_env = linspace(S, 0, R_sample + 1);

    
    % concatenare
    envelope = [A_env, D_env, S_env, R_env];
    
    
    [m n] = size(sinewave);
    envelope = envelope(:, 1:n);
    x = sinewave .* envelope;
    x = x';
    x = x(1:length(x) - 1, :);
end
