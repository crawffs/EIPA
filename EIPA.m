%Feb 6, 2019 PA5 Mike Crawford 100952432
nx =15;
ny =15;
G = sparse(nx*ny, nx*ny);


for i = 1:nx
    for j = 1:ny
        n = j + (i-1) * ny;
        if i == 1
            G(n,:) = 0;
            G(n,n) = 1;
        elseif i == nx
            G(n,:) = 0;
            G(n,n) = 1;
        elseif j == 1
            G(n,:) = 0;
            G(n,n) = 1;
        elseif j == ny
            G(n,:) = 0;
            G(n,n) = 1;
        else
        nxm = j + (i-2)*ny;
        nxp = j + (i)*ny;
        nym = j-1 + (i-1)*ny;
        nyp = j+1 + (i-1)*ny;
        G(n,n) = -2;
        G(n,nxm) = 1;
        G(n,nxp) = 1;
        G(n,nym) = 1;
        G(n,nyp) = 1;
        end
    end
end

figure(1)
spy(G)
[E,D] = eigs(G,9,'SM')
Evalues = diag(D)

figure(2)
plot(Evalues, 'o')

EFunction = zeros(nx, ny, 9);
for i = 1:nx
    for j = 1:ny
        n = j + (i-1) * ny;
        EFunction(i, j, :) = E(n,:);
    end
end


for i= 1:9
    figure(i+2)
    surf(EFunction(:,:,i));
end

