txt = readlines("input.txt")
j = first(findall(==(""), txt))
xys = split.(txt[1:(j-1)], ",")
x = parse.(Int, first.(xys))
y = parse.(Int, last.(xys))

using DataFrames
df = DataFrame(x = x, y = y)

function f(d:DataFrame, axis:Symbol, value:Int)
    @assert nrow(filter(axis => ==(value), df)) == 0 
    lower = filter(axis => <(value), df)
    upper = filter(axis => >(value), df)

end
