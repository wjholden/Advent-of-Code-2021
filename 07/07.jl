module AdventOfCode202107

A = parse.(Int, split(readline("input.txt"), ","))

function loss(X, m)
    sum([abs(x - m) for x ∈ X])
end

function bisect(X, loss_function; lo = minimum(X), hi = maximum(X))
    if lo == hi
        return lo
    else
        m1 = (lo + hi) ÷ 2
        m2 = m1 + 1
        #println("Searching between values $(m1) and $(m2) (from [$(lo) and $(hi)])")
        if loss_function(X, m1) < loss_function(X, m2)
            return bisect(X, loss_function, lo = lo, hi = m1)
        else
            return bisect(X, loss_function, lo = m2, hi = hi)
        end
    end
end

println("Part 1: ", loss(A, bisect(A, loss)))

function loss2(X, m)
    sum(map(x -> x * (x+1) ÷ 2, [abs(x - m) for x ∈ X]))
end

println("Part 2: ", loss2(A, bisect(A, loss2)))

end