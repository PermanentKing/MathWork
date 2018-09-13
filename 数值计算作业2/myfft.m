function X=myfft(x)
    N=length(x);
    h=log2(N);
    for i=1:h
        s=[];
        for j=1:2^(i-1)
            M=2^(h-i+1);
            xj=x([1:M]+(j-1)*M);
            [y,z]=disbutterfly(xj);
            s=[s,y,z];
        end
        x=s;
    end

X=rader(x,N);
end

