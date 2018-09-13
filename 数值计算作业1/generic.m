function [ A2, A, b, x0, N, wb ] = generic( n, w )
N =n;
wb = w;
V = diag(rand(N, 1));
M = orth(rand(N));
A = M*V*M';
b = normrnd(0, 1, N, 1);
A2 = normrnd(0, 1, N, N);
x0 = zeros(N, 1);

end

