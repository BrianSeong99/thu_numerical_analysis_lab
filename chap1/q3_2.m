sum_single = single(0);
previous = single(-1);
i = 0;

while sum_single - previous ~= 0
    i = i + 1;
    previous = sum_single;
    sum_single = sum_single + single(1/i);
end

sum_double = double(0);
j = 0;
while j - i ~= 0
    j = j + 1;
    sum_double = sum_double + double(1/j);
end

disp(sum_single);
disp(sum_double);
disp((sum_single - sum_double) / sum_double);