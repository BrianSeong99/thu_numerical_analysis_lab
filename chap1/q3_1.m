sum = single(0);
previous = single(-1);
i = 0;
while sum - previous ~= 0
    i = i + 1;
    previous = sum;
    sum = sum + single(1/i);
end

disp(i);