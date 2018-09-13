function y=rader(x,N)
    n=[0:N-1];
    bn=dec2bin(n);
    rbn=fliplr(bn);
    rn=bin2dec(rbn);
    y = x(rn+1);
end