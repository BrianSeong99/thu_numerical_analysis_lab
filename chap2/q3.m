l = 0.0000000000000000000001;
r = l;
off = 0.0001;

i = 1;
while i <= 10
    while besselj(0,l) * besselj(0,r) > 0
        r = r + 0.01;
    end
    r = fzerotx(@ (Z) besselj(0,Z),[l,r]);
    fprintf("%d: %f\n",i,r);
    l = r + off;
    r = l;
    i = i + 1;
end