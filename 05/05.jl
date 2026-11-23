module AdventOfCode202105

using DataStructures

INPUT = "../puzzles/day05.txt"
# INPUT = "example.txt"

struct Point
    x::Int
    y::Int
end

struct Segment
    a::Point
    b::Point
end

function parse_input(FILE)
    segments = []
    for line ∈ readlines(FILE)
        u, _, v = split(line, " ")
        ux, uy = split(u, ",")
        vx, vy = split(v, ",")
        push!(segments, Segment(
            Point(parse(Int, ux), parse(Int, uy)),
            Point(parse(Int, vx), parse(Int, vy))
        ))
    end

    return segments
end

function count_intersections(segments, part)
    area = DefaultDict(0)

    for segment ∈ segments
        dx = 0
        dy = 0
        if segment.a.x < segment.b.x
            dx = 1
        elseif segment.a.x > segment.b.x
            dx = -1
        end
        if segment.a.y < segment.b.y
            dy = 1
        elseif segment.a.y > segment.b.y
            dy = -1
        end
        if part == 1 && (dx != 0 && dy != 0)
            continue # only horizontal and vertical lines for part 1
        end
        x = segment.a.x
        y = segment.a.y
        while true
            p = Point(x, y)
            area[p] = area[p] + 1
            if x == segment.b.x && y == segment.b.y
                break
            end
            x = x + dx
            y = y + dy
        end
    end

    count(>(1), values(area))
end

segments = parse_input(INPUT)
println("Part 1: ", count_intersections(segments, 1))
println("Part 2: ", count_intersections(segments, 2))

end