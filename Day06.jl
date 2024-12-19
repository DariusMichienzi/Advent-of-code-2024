# Part 2 takes a while to run. about 8 min on typhon
f = "/home/er19801/julia_code/Advent-of-code-24/Datafiles/Day6Data.txt"
lines = readlines(f)
list = [if i<=length(line) line[i] else "" end for line in lines for i in 1:length(lines)]
data = rotr90(reshape(list,length(lines),length(lines)))
coord = findfirst(x->x=='^',data)
state=0
while coord[1] != 1
    if data[coord[1]-1,coord[2]] == '#'
        data = rotr90(data)
        state += 1
    else
        data[coord[1]-1,coord[2]] = '^'
        data[coord[1],coord[2]] = 'X'
    end
    coord = findfirst(x->x=='^',data)
end
ans1 = length(findall(x->x=='X',data))+1
println("part 1 answer = ",ans1)

#end of part 1 

data1 = rotr90(data,(4-state%4))

change = findall(x->x=='X',data1)
push!(change, findfirst(x->x=='^',data1))
loops = Int[]


Threads.@threads for i in eachindex(change)
data = rotr90(reshape(list,length(lines),length(lines)))
if data[change[i][1],change[i][2]] == '.'
data[change[i][1],change[i][2]] = 'O'
end
coord = findfirst(x->x=='^',data)
coordlist = Vector{Int}[]
loop = false  
state = 0

while loop == false && coord[1] != 1
    if data[coord[1]-1,coord[2]] == '#' || data[coord[1]-1,coord[2]] == 'O'
        data = rotr90(data)
        state +=1
    else
        data[coord[1]-1,coord[2]] = '^'
        data[coord[1],coord[2]] = 'X'
    end
    coord = findfirst(x->x=='^',data)
    push!(coordlist,Int.([coord[1];coord[2];state%4]))
    if length(coordlist) != length(unique(coordlist))
        push!(loops, 1)
        loop = true
    end
end
end 

ans2 = length(loops)
println("part 2 answer = ",ans2)