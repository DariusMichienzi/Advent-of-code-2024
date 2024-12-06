@time begin
f = "/home/er19801/julia_code/Advent-of-code-24/Datafiles/Day4Data.txt"
lines = readlines(f)
list = [if i<=length(line) line[i] else "" end for line in lines for i in 1:length(lines)]
data = reshape(list,length(lines),length(lines))

diag1 = 
[[1;;0;;0;;0];
[0;;1;;0;;0];
[0;;0;;1;;0];
[0;;0;;0;;1]]
diag2 = 
[[0;;0;;0;;1];
[0;;0;;1;;0];
[0;;1;;0;;0];
[1;;0;;0;;0]]

vforward = ['X','M','A','S']
vbackward = ['S','A','M','X']
d1forward = 
[["X";;"";;"";;""];
["";;"M";;"";;""];
["";;"";;"A";;""];
["";;"";;"";;"S"]]
d2forward = 
[["";;"";;"";;"X"];
["";;"";;"M";;""];
["";;"A";;"";;""];
["S";;"";;"";;""]]
d1backward = 
[["S";;"";;"";;""];
["";;"A";;"";;""];
["";;"";;"M";;""];
["";;"";;"";;"X"]]
d2backward = 
[["";;"";;"";;"S"];
["";;"";;"A";;""];
["";;"M";;"";;""];
["X";;"";;"";;""]]

total = []
for i in 1:140
    for j in 1:137
    if data[i,j:(j+3)] == vforward
        push!(total,1)
    elseif data[i,j:(j+3)] == vbackward
        push!(total,1)
    end
end
end
for i in 1:140
    for j in 1:137
    if data[j:(j+3),i] == vforward
        push!(total,1)
    elseif data[j:(j+3),i] == vbackward
        push!(total,1)

    end
end
end

for i in 1:137
    for j in 1:137
    if data[j:(j+3),i:(i+3)] .^ diag1 == d1forward
        push!(total,1)
    end
    if data[j:(j+3),i:(i+3)] .^ diag2 == d2forward
        push!(total,1)
    end
    if data[j:(j+3),i:(i+3)] .^ diag1 == d1backward
        push!(total,1)
    end
    if data[j:(j+3),i:(i+3)] .^ diag2 == d2backward
        push!(total,1)
    end
end
end

println("pt1 answer = ",sum(total))
#end of part 1

X =
[[1;;0;;1];
[0;;1;;0];
[1;;0;;1];]

mas1=
[["M";;"";;"S"];
["";;"A";;""];
["M";;"";;"S"];]
mas2=
[["M";;"";;"M"];
["";;"A";;""];
["S";;"";;"S"];]
mas3=
[["S";;"";;"M"];
["";;"A";;""];
["S";;"";;"M"];]
mas4=
[["S";;"";;"S"];
["";;"A";;""];
["M";;"";;"M"];]

total2 = []
for i in 1:138
    for j in 1:138
    if data[j:(j+2),i:(i+2)] .^ X == mas1
        push!(total2,1)
    end
    if data[j:(j+2),i:(i+2)] .^ X == mas2
        push!(total2,1)
    end
    if data[j:(j+2),i:(i+2)] .^ X == mas3
        push!(total2,1)
    end
    if data[j:(j+2),i:(i+2)] .^ X == mas4
        push!(total2,1)
    end
end
end

println("pt2 answer = ",sum(total2))
end