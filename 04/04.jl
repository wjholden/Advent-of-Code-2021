module AdventOfCode202104

Ai = readlines("input.txt")
game = parse.(Int, split(Ai[1], ","))
n = length(Ai) ÷ 6
boards = []
i = 2
while i < length(Ai)
    global i
    s = Ai[i+1:i+5]
    b = reshape(parse.(Int, reduce(vcat, split.(strip.(s), r" +"))), 5, 5)'
    push!(boards, b)
    i += 6
end

@assert all(b -> length(unique(b)) == 25, boards)

function score(board, draws)
    draws_s = Set(draws)
    rc = union([Set(board[i, :]) for i in 1:5], [Set(board[:, j]) for j in 1:5])
    for line in rc
        if line ⊆ draws_s
            return (sum(board) - sum(board ∩ draws_s)) * last(draws)
        end
    end
    return 0
end

haswon = Set()
for i ∈ 1:length(game), b in boards
    if b ∉ haswon
        s = score(b, game[1:i])
        if s > 0
            if isempty(haswon)
                println("Part 1: ", s)
            end
            if length(haswon) == length(boards) - 1
                println("Part 2: ", s)
            end
            push!(haswon, b)
        end
    end
end

end