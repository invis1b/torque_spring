using DelimitedFiles
R=10
a=30

A=[0.5*R*1,0.5*R*(-1),0.5*R*1,0.5*R*(-1)]
neighborlist=[[1,0],[0,1],[-1,0],[0,-1]]
B=2*R^2/(a-2R)
A=A.+B/2
println(A)
println(B)
theta_array=zeros(100,100)
vtheta_array=0.01.*rand(100,100)
atheta_array=zeros(100,100)
dt=0.001

writedlm("initial.txt",theta_array)
writedlm("initial2.txt",vtheta_array)

        
for i in 1:1000
    for j in 2:99
        for k in 2:99
            atheta_array[j,k]=-0.5*(4*(A[1]^2+A[2]^2+A[3]^2+A[4]^2)*theta_array[j,k]^3)
            for m in 1:4

                atheta_array[j,k]=atheta_array[j,k]-0.5*((B^2+2*A[m]^2)*2*theta_array[j,k]*theta_array[j+neighborlist[m][1],k+neighborlist[m][2]]^2+6*A[m]*B*theta_array[j,k]^2*theta_array[j+neighborlist[m][1],k+neighborlist[m][2]]+2*A[m]*B*theta_array[j+neighborlist[m][1],k+neighborlist[m][2]]^3)
            end
        end
    end
    atheta_array_old=atheta_array
    for j in 2:99
        for k in 2:99
            theta_array[j,k]=theta_array[j,k]+vtheta_array[j,k]*dt+0.5*atheta_array[j,k]*dt^2
        end
    end
    for j in 2:99
        for k in 2:99
            atheta_array[j,k]=-0.5*(4*(A[1]^2+A[2]^2+A[3]^2+A[4]^2)*theta_array[j,k]^3)
            for m in 1:4
                atheta_array[j,k]=atheta_array[j,k]-0.5*((B^2+2*A[m]^2)*2*theta_array[j,k]*theta_array[j+neighborlist[m][1],k+neighborlist[m][2]]^2+6*A[m]*B*theta_array[j,k]^2*theta_array[j+neighborlist[m][1],k+neighborlist[m][2]]+2*A[m]*B*theta_array[j+neighborlist[m][1],k+neighborlist[m][2]]^3)
            end
        end
    end
    for j in 2:99
        for k in 2:99
            vtheta_array[j,j]=vtheta_array[j,k]+0.5*(atheta_array_old[j,k]+atheta_array[j,k])*dt
        end
    end
end
writedlm("final.txt",theta_array)
writedlm("finalv.txt",vtheta_array)

    
    
            
            
            