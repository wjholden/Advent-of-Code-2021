directions = Dict("forward" => 1, "down" => -2, "up" => 2)
A = [(d, parse(Int, x)) for (d,x) in split.(readlines("input.txt"))]
v = [0,0]
for (d,x) in A
    i = directions[d]
    v[abs(i)] += (x * i/abs(i))
end
println("Part 1: ", abs(reduce(*, v, init=1)))

v = [0,0]
aim = 0
for (d,x) in A
    global aim
    if d == "down"
        aim += x
    elseif d == "up"
        aim -= x
    elseif d == "forward"
        v[1] += x
        v[2] += x * aim
    else
        throw(d)
    end
end
println("Part 2: ", reduce(*, v, init=1))