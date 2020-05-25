for n = [8, 10, 12]
    Hn = hilb(n);
    x = ones(n,1);
    b = Hn * x;
    L = cholesky(Hn);
    x_hat = L.' \ (L \ b);
    r = b - Hn * x_hat;
    delta_x = x_hat - x;
    
    disp("n: " + n);
    disp("||r||: " + norm(r, inf));
    disp("||delta_x||: " + norm(delta_x, inf));

    b_disturb = b + ones(n,1) * 1e-7;
    x_hat_disturb = L.' \ (L \ b_disturb);
    r_disturb = b_disturb - Hn * x_hat_disturb;
    delta_x_disturb = x_hat_disturb - x;
    
    disp("||r_disturb||: " + norm(r_disturb, inf));
    disp("||delta_x_disturb||: " + norm(delta_x_disturb, inf));
    fprintf("\n");
end