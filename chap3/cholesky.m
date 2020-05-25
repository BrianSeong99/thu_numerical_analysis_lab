function L = cholesky(A)
    n = size(A, 1);
    L = zeros(n, n);
    L(1, 1) = sqrt(A(1, 1));
    for j = 1 : n
        for k = 1 : j - 1
            A(j, j) = - A(j ,k) * A(j, k) + A(j, j);
        end
        L(j, j) = sqrt(A(j, j));
        A(j, j) = L(j, j);
        for i = j + 1 : n
            for k = 1 : j - 1
                A(i, j) = - A(i, k) * A(j, k) + A(i, j);
            end
            L(i, j) = A(i, j) / A(j, j);
            A(i, j) = L(i, j);
        end
    end
end