h = logspace(-16, 0, 100);
trunck = h / 2;
round = 0.0000000000000001 * h.^(-1);
epsilon_tot = trunck + round;
error = abs(((sin(1 + h) - sin(1)) ./ h) - cos(1));
plot(h, trunck, h, round, h, epsilon_tot, h, error);
loglog(h, trunck, '--', h, round, '--', h, epsilon_tot, '--', h, error);
axis([0.0000000000000001 1 0.0000000000000001 10]);