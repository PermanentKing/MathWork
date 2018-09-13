function PageRank( L, eps )

N= size(L,1);   % N即总结点数
q= 0.85;          % 默认阻尼系数
% 构造D
d= sum(L,2);      % d为表示各点出度的列向量
D= diag(d);       

M= L'/D;
e= ones(N,1);
a= (d==0);  % a为用于描述“悬挂网页”的行向量
            % 其第i个分量的取值由第i个网站是否为悬挂网站决定, 若是则为1, 否则为0
% 构造S
S= M + e*a'/N;   
% 构造最终的概率转移矩阵
G= q*S + (1-q)*e*e'/N;     



H0= zeros(N,1);  % 初始化H0
H1= ones(N,1);   % 默认初始权重向量均为1
count= 0;        % 初始化迭代次数
% 随机游走开始

while  norm(H1-H0) >= eps
    H0= H1;
    H1= G*H0;
    count= count+1;
end  % while语句结束

% 将结果H1按照降序排列,sort()中参数'descend'为降序,'ascend'为升序
[Rank,index]= sort(H1,'descend');       
% Rank数组中保存最终降序排列的数组
%index数组中存储着降序排序后对应的原始数组中的序号

% 打印结果
fprintf('After %d steps PageRank finally converges\n', count)
fprintf('Rank               Weight              PageNumber\n')
fprintf('-------------------------------------------------\n')
for  k= 1:N
    fprintf('%-3d                %-.7f            %-3d\n',...
            k, Rank(k), index(k))
end   % for循环结束
end  
% PageRank函数结束

