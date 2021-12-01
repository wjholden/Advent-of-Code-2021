A = parse.(Int, readlines("input.txt"))
g = [A[i+1] > A[i] for i in 1:length(A)-1]
println("Part 1: ", sum(g))

w = [sum([A[i], A[i+1], A[i+2]]) for i in 1:length(A)-2]
println("Part 2: ", sum([w[i+1] > w[i] for i in 1:length(w)-1]))
