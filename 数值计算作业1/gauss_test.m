n=[10 50 100 200];
time1=[0 0 0 0];
time2=[0 0 0 0];
s=0;
for i=1:4
    for k=1:20
        [ A2, A, b, x0, N, wb ] = generic( n(i), n(i) );
        while(A2(1,1)==0)
            [ A2, A, b, x0, N, wb ] = generic( n(i), n(i) );
        end
        START=clock;
        GaussXQByOrder(A2, b);
        FINISH=clock;
        s=s+datenum(FINISH)-datenum(START);
    end
    time1(i)=s/20;
    for k=1:20
        [ A2, A, b, x0, N, wb ] = generic( n(i), n(i) );
        while(A2(1,1)==0)
            [ A2, A, b, x0, N, wb ] = generic( n(i), n(i) );
        end
        START=clock;
        EMCP(A2, b);
        FINISH=clock;
        s=s+datenum(FINISH)-datenum(START);
    end
    time2(i)=s/20;
end

plot(n, time1, n, time2)
legend('1.1Gauss', '1.2EMCP')

