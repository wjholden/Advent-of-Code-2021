module AdventOfCode202106

A = parse.(Int, split(readline("input.txt"), ","))

# Naive method: actually count the fish
function f(a, t)
    if t > 0
        a2 = copy(a)
        # order of operations matters.
        append!(a2, repeat([9], count(==(0), a2)))
        a2 = [ifelse(ai > 0, ai - 1, 6) for ai in a2]
        #println(a2)
        return f(a2, t - 1)
    else
        return a
    end
end

println("Part 1: ", length(f(A, 80)))

# Observation: you don't need to represent each fish.
# You can use a vector that counts how many copies there are
# of a number. So if you have three fish at 8, then keep
# the 8 and also a [3] to hold all of them at once.
#
# Actually, a Dict will be more convenient in a 1-index language.
function g(c, t)
    if t > 0
        c2 = DefaultDict(0)
        for i in 1:8
            c2[i-1] = c[i]
        end
        c2[6] += c[0]
        c2[8] = c[0]
        #println(c2)
        return g(c2, t - 1)
    else
        return c
    end
end

using DataStructures, StatsBase
A2 = DefaultDict(0, countmap(A))
println("Part 2: ", sum(values(g(A2, 256))))

end