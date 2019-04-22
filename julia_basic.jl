using Distributions
using Random
#This is the basic method using julia
println("matrix multiplication using basic Julia")
a=[31, 32, 96, 97, 127, 128, 129, 191, 192, 229, 255, 256, 257,
    319, 320, 321, 417, 479, 480, 511, 512, 639, 640, 767,768, 769,1000]
#shuffle the matrix size array, so that it will always
#randmly pick a size to do the multiplication.
b=shuffle!(a)
function(multiply(A,B,C))
    for i in 1:size(A,1)
        for j in 1:size(A,1)
            for k in 1:size(A,1)
                C[i,j]+=A[i,k]*B[k,j]
            end
        end
    end
end
for i in 1:27
    timeout=0.1
    n_iterations=1
    seconds=-1
    speed=0
    #randomly(uniformly distributed between -1 and 1) get two matrix for a given size
    A=rand(Uniform(-1,1),b[i],b[i])
    #A=rand(Uniform(-1,1),6,6)
    B=rand(Uniform(-1,1),b[i],b[i])
    ind=size(A,1)
    C=zeros(ind,ind)
    while seconds<timeout
        #warm up
        multiply(A,B,C)
        #start timer
        seconds1=time_ns()
        for j in 1:n_iterations
            multiply(A,B,C)
        end
        seconds2=time_ns()
        #end timer
        seconds=(seconds2-seconds1)/(1.0e9)
        #get the time in milliseconds
        speed=seconds/n_iterations*1000
        n_iterations=n_iterations*2
    end
    #print("iterations is", n_iterations/2)
    #speed=seconds/n_iterations*500
    print("size is ", b[i])
    println("  speed is ",speed)
end
println("end of julia_basic")
