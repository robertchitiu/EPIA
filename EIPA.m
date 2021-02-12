
nx=50;
ny=50;

G = zeros(nx*ny);

for i=1 : nx
    for j=1 : ny
        
        n = i + (j-1)*ny;

        if i==1 || i == nx || j == 1 || j == ny
            G(n,n) = 1;
        elseif i>1 & j>1
             
            nxm = j + (i-2)*ny;
            nxp = j + i*ny;
            nym = j-1 + (i-1)*ny;
            nyp = j + 1 + (i-1)*ny;
            
            G(n,n) = -4;
            G(n,nxm) = 1;
            G(n,nxp) = 1;
            G(n,nyp) = 1;
            G(n,nym) = 1;   
        end
        
    end
    
end

figure (1)
spy(G)


[E,D] = eigs(G,9,'SM')

Vec(nx,ny)=0;




for q=1:9
    for i=1:nx
        for j=1:ny
            n = j +(i-1)*ny;
            EVec(i,j) = E(n,q);
        end
    end
figure (2)
surf (EVec)
pause(0.5)
end

 


