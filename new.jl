a=[31, 32, 96, 97, 127, 128, 129, 191, 192, 229, 255, 256, 257,
    319, 320, 321, 417, 479, 480, 511, 512, 639, 640, 767,768, 769,1000]
for i in 1:27
    A=rand(Uniform(-1,1),a[i],a[i])
    B=rand(Uniform(-1,1),a[i],a[i])
    timeout=0.1
    n_iterations=1
    seconds=-1
    while seconds<timeout
        A*B
        seconds=-1*time_ns()
        for j in 0:n_iterations
            A*B
        end
        seconds=seconds+time_ns()
        n_iterations=n_iterations*2
        seconds=seconds/(1.0e9)
    end
    
    speed=seconds/n_iterations*500
    print("size is ", a[i])
    println("  speed is ",speed)
end
