for epsilon=[1, 0.1, 0.01, 0.0001]
    a = 1 / 2;
    n = 50;
    h = 1 / n;

    % getting the coefficient array
    A = zeros(n, n);
    i = 1;
    while i <= n
        A(i, i) = - (2 * epsilon + h);
        i = i + 1;
    end
    i = 1;
    while i < n
        A(i, i + 1) = epsilon + h;
        A(i + 1, i) = epsilon;
        i = i + 1;
    end

    % getting the right side vector
    b = ones(n, 1) * a * h^2;
    b(n) = b(n) - epsilon - h;

    % transforming Matrix
    trans = A + (2 * epsilon + h) * eye(n);
    
    % getting the x of the functions
    xs = ((1 - a) / (1 - exp(- (1 / epsilon))) * (1-exp(- (1/n : 1/n : 1) / epsilon)) + a * (1/n : 1/n : 1)).';
    
    % Jacobi
    ykk = zeros(n, 1);
    yk = ones(n, 1);
    while sum(abs(yk - ykk)) > 0.0001
        yk = ykk;
        ykk = (trans * yk - b) / (2 * epsilon + h);
    end
    y_jacobi = ykk;

    % G-S
    ykk = zeros(n, 1);
    yk = ones(n, 1);
    while sum(abs(yk - ykk)) > 0.0001
        yk = ykk;
        i = 1;
        while i <= n
            tmp = ((trans * yk - b) / (2 * epsilon + h));
            ykk(i) = tmp(i);
            i = i + 1;
        end
    end
    y_gs = ykk;

    % SOR
    omega = 0.8;
    ykk = zeros(n, 1);
    yk = ones(n, 1);
    while sum(abs(yk - ykk)) > 0.0001
        yk = ykk;
        i = 1;
        while i <= n
            tmp = ((trans * yk - b) / (2 * epsilon + h));
            ykk(i) = omega * tmp(i) + (1 - omega) * yk(i);
            i = i + 1;
        end
    end
    y_sor = ykk;

    disp("epsilon: " + epsilon + " n: " + n);
    disp("Jacobi's relative error: " + mean(abs((y_jacobi - xs)./ xs)));
    disp("GS's relative error: " + mean(abs((y_gs - xs)./ xs)));
    disp("SOR's relative error: " + mean(abs((y_sor - xs)./ xs)));
    fprintf("\n");
end