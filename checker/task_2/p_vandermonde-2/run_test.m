function run_test()
    fout = fopen("out", "w");

    [x, y] = parse_data("../../input/task_2/input4.txt");
    coef = vandermonde(x, y);
    xlin = linspace(min(x), max(x), 1000)';
    ylin = P_vandermonde(coef, xlin);

    for i = 1 : length(ylin)
        fprintf(fout, "%f ", ylin(i));
    endfor

    fclose(fout);
endfunction

