using Distributions
A=rand(Uniform(-1,1),a[i],a[i])
A=rand(Uniform(-1,1),a[i],a[i])
for i in 1:size(A,1)
    for j in 1:size(A,1)
        for k in 1:size(A,1):
            C[i][j]+=A[i][k]*B[k][j]
        end
    end
end
println(C)
println(A*B)
