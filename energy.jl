using DelimitedFiles
using Plots
R=10
a=30
A=[0.5*R*1,0.5*R*(-1),0.5*R*1,0.5*R*(-1)]
neighborlist=[[1,0],[0,1],[-1,0],[0,-1]]
B=2*R^2/(a-2R)
A=A.+B/2
for i in 1000:1000:10000
    p=readdlm("step$i.txt")
    v=readdlm("vstep$i.txt")
    E=zeros(100,100)
    for i in 1:100
        for j in 1:100
            E[i,j]=0.5*v[i,j]^2
            for m in 1:4
                neighbor_x=i+neighborlist[m][1]
                neighbor_y=j+neighborlist[m][2]
                if neighbor_x>100
                    neighbor_x-=100
                end
                if neighbor_x==0
                    neighbor_x+=100
                end
                if neighbor_y>100
                    neighbor_y-=100
                end
                if neighbor_y==0
                    neighbor_y+=100
                end
                E[i,j]+=0.5*0.5*(A[m]*p[i,j]^2+A[m]*p[neighbor_x,neighbor_y]^2+2*B*p[i,j]*p[neighbor_x,neighbor_y])^2 
            end
        end
    end
    println(sum(E))
    heatmap(E,c = :greys,dpi=300)
    savefig("step$i")
end
