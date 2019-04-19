using Distributions
a=[31, 32, 96, 97, 127, 128, 129, 191, 192, 229, 255, 256, 257,
    319, 320, 321, 417, 479, 480, 511, 512, 639, 640, 767,768, 769,1000]
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
    A=rand(Uniform(-1,1),a[i],a[i])
    #A=rand(Uniform(-1,1),6,6)
    B=rand(Uniform(-1,1),a[i],a[i])
    ind=size(A,1)
    C=zeros(ind,ind)
    while seconds<timeout
        multiply(A,B,C)
        seconds1=time_ns()
        for j in 1:n_iterations
            multiply(A,B,C)
        end
        seconds2=time_ns()
        seconds=(seconds2-seconds1)/(1.0e9)
        speed=seconds/n_iterations*1000
        n_iterations=n_iterations*2
    end
    #print("iterations is", n_iterations/2)
    #speed=seconds/n_iterations*500
    print("size is ", a[i])
    println("  speed is ",speed)
end
