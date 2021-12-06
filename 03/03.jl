module AdventOfCode202103

using DataFrames, StatsBase, DataStructures
Ai = reduce(vcat, [parse.(Int, split(line, "")) for line in readlines("input.txt")]')
A = DataFrame(Ai, :auto)
c = mode.(eachcol(A))
γ = foldl((a, v) -> (a << 1) | v, c)
ϵ = foldl((a, v) -> (a << 1) | (v ⊻ 1), c, init = 0)
println("Part 1: ", γ * ϵ)

function rating(df, criteria::Symbol, i=1)
    if nrow(df) == 1 || i > ncol(df)
        return df
    else
        c = DefaultDict(0, countmap(df[:, i]))
        v = missing
        if c[0] > c[1]
            v = 0
        else
            v = 1
        end
        v = ifelse(criteria == :CO2, v ⊻ 1, v)
        return rating(df[df[:, i] .== v, :], criteria, i + 1)
    end
end

o2 = foldl((a, v) -> (a << 1) | v, rating(A, :O2)[1, :], init = 0)
co2 = foldl((a, v) -> (a << 1) | v, rating(A, :CO2)[1, :], init = 0)
println("Part 2: ", o2 * co2)

# This problem is a little trickier than it might sound at first.
# Requires some bit twiddling, counting, and flow control (if/else statements).
# Being able to reconstruct a binary value from bit strings is important.

end