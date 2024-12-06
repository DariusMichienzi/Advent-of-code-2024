f = ("/home/er19801/julia_code/Advent-of-code-24/Datafiles/Day2Data.txt")

(v1, v2) = [lists[:,x] for x in 1:size(lists,2)]

ans1 = sum(abs.(sort(v1) .- sort(v2)))
println("pt 1 answer = ",ans1)
#end of part 1 
ans2=0
for i in eachindex(v1)
    for j in eachindex(v2)
        a=0
        if v1[i] == v2[j]
            a += 1
        end
        global ans2 += a*v1[i]
    end
end
println("pt 1 answer = ",ans2)