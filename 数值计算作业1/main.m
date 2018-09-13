global tempf1
global tempf2
global tempf3
global tempf4
n = [10 50 100 200];

for i=1:4
    [ A2, A, b, x0, N, wb ] = generic( n(i), n(i) );
    while(A(1,1)==0)
        [ A2, A, b, x0, N, wb ] = generic( n(i), n(i) );
    end
    
    [x1, n1] = jacobi(A, b, x0, 1.0e-6, n(i)*10);
    [x2, n2] = guaseidel(A, b, x0, 1.0e-6, n(i)*10);
    [x3, n3] = mySOR(A, b, x0, 1.1, 1.0e-6, n(i)*10);
    [x4, n4] = gongetidu(A, b, x0, 1.0e-6, n(i)*10);
    st = 1:1:n(i)*10;
    
    figure(i)
    plot(st, tempf1, '-b', st, tempf2, '-r', st, tempf3, '-g', st, tempf4, '-k')
    legend('2.1Jacobi','2.2Gauss-Seidel','2.3SOR','2.4CG')
    
end

