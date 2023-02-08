using Plots
using DelimitedFiles
initial=readdlm("initial.txt")
initialv=readdlm("initial2.txt")
E=zeros(100,100)
for i in 1:100
    for j in 1:100
        E[i,j]=0.5*initialv[i,j]^2
    end
end
heatmap(E,c = :greys,dpi=300)
savefig("initial_E")
endp=readdlm("final.txt")
endv=readdlm("finalv.txt")
E=zeros(100,100)
for i in 1:100
    for j in 1:100
        
        E[i,j]=0.5*endv[i,j]^2
      
    end
end
heatmap(E,c = :greys,dpi=300)
savefig("end_E")
heatmap(endp,c = :greys,dpi=300)
savefig("endp")
