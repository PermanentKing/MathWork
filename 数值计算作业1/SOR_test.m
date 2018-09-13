n = [10 50 100 200];
s = zeros(1, 19);
p = linspace(0.1, 1.9, 19);

for i=1:4
    [ A2, A, b, x0, N, wb ] = generic( n(i), n(i) );
    while(A(1,1)==0)
        [ A2, A, b, x0, N, wb ] = generic( n(i), n(i) );
    end
    
    for k=1:19
        START=clock;
        mySOR(A, b, x0, k/10, 1.0e-6, n(i)*10);
        FINISH=clock;
        s(k)=datenum(FINISH)-datenum(START);
    end
    figure(i)
    plot(p, s)
    
end