for s in lpad.(1:25, 2, "0")
    cd(s)
    f = pwd() * "/" * s * ".jl"
    if isfile(f)
        println("Day ", s)
        include(f)
        println()
    end
    cd("..")
end
