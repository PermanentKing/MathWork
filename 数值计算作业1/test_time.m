n=[10 50 100 200];
time=zeros(6,4);
s=0;
for i=1:4
    for k=1:20
        [ A2, A, b, x0, N, wb ] = generic( n(i), n(i) );
        while(A(1,1)==0)
            [ A2, A, b, x0, N, wb ] = generic( n(i), n(i) );
        end
        START=clock;
        GaussXQByOrder(A, b);
        FINISH=clock;
        s=s+datenum(FINISH)-datenum(START);
    end
    time(1, i)=s/20;
    
    for k=1:20
        [ A2, A, b, x0, N, wb ] = generic( n(i), n(i) );
        while(A(1,1)==0)
            [ A2, A, b, x0, N, wb ] = generic( n(i), n(i) );
        end
        START=clock;
        EMCP(A, b);
        FINISH=clock;
        s=s+datenum(FINISH)-datenum(START);
    end
    time(2, i)=s/20;
    
    for k=1:20
        [ A2, A, b, x0, N, wb ] = generic( n(i), n(i) );
        while(A(1,1)==0)
            [ A2, A, b, x0, N, wb ] = generic( n(i), n(i) );
        end
        START=clock;
        jacobi(A, b, x0, 1.0e-6, n(i)*10);
        FINISH=clock;
        s=s+datenum(FINISH)-datenum(START);
    end
    time(3, i)=s/20;
    
    for k=1:20
        START=clock;
        guaseidel(A2, b, x0, 1.0e-6, n(i)*10);
        FINISH=clock;
        s=s+datenum(FINISH)-datenum(START);
    end
    time(4, i)=s/20;
    
    for k=1:20
        [ A2, A, b, x0, N, wb ] = generic( n(i), n(i) );
        while(A(1,1)==0)
            [ A2, A, b, x0, N, wb ] = generic( n(i), n(i) );
        end
        START=clock;
        mySOR(A, b, x0, 1.1, 1.0e-6, n(i)*10);
        FINISH=clock;
        s=s+datenum(FINISH)-datenum(START);
    end
    time(5, i)=s/20;
    
    for k=1:20
        [ A2, A, b, x0, N, wb ] = generic( n(i), n(i) );
        while(A(1,1)==0)
            [ A2, A, b, x0, N, wb ] = generic( n(i), n(i) );
        end
        START=clock;
        gongetidu(A, b, x0, 1.0e-6, n(i)*10);
        FINISH=clock;
        s=s+datenum(FINISH)-datenum(START);
    end
    time(6, i)=s/20;
end
plot(n, time(1,:), n, time(2,:), n, time(3,:), n, time(4,:), n, time(5,:), n, time(6,:))
legend('1.1Gauss','1.2EMCP','2.1Jacobi','2.2Gauss-Seidel','2.3SOR','2.4CG')
