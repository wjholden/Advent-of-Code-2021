for s in lpad.(1:25, 2, "0")
    cd(s)
    f = pwd() * "/" * s * ".jl"
    if isfile(f)
        println("Day ", s)
        # All programs included should begin with a module
        # declaration. Otherwise, they'll pollute the global
        # namespace and conflict with each other.
        include(f)
        println()
    end
    cd("..")
end
