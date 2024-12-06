f = "/home/er19801/julia_code/Advent-of-code-24/Day3Data.txt"
data = read(f, String)

D=zeros(length(data))
for i in eachindex(data)
    if data[i] == 'd'
        D[i] = 1
    end
    if data[i] == 'o'
        D[i] = 2
    end    
    if data[i] == 'n'
        D[i] = 3
    end
    if data[i] == '''
        D[i] = 4
    end
    if data[i] == 't'
        D[i] = 5
    end
    if data[i] == '('
        D[i] = 6
    end
    if data[i] == ')'
        D[i] = 7
    end
end
#Base.Unicode.category_abbrev(data[i]) == "Nd"
Dokern=[1.0,2.0,6.0,7.0]
Dntkern=[1.0,2.0,3.0,4.0,5.0,6.0,7.0]
function create_non_overlapping_ranges(starts::Vector{Int}, ends::Vector{Int})
    # Initialize variables
    ranges = []
    start_idx, end_idx = 1, 1

    while start_idx <= length(starts) && end_idx <= length(ends)
        # Pair the current start with the next valid end
        if starts[start_idx] <= ends[end_idx]
            push!(ranges, starts[start_idx]:ends[end_idx])
            start_idx += 1
            end_idx += 1
        elseif starts[start_idx-1]<starts[start_idx]<ends[end_idx]
        end
    end

    return ranges
end

ranges = create_non_overlapping_ranges(dos, dont)

datavector = [data[r] for r in ranges if r.start <= length(data)]
total=[]

kern12=[1.0,2.0,3.0,4.0,5.0,5.0,5.0,5.0,5.0,5.0,5.0,6.0]
kern11=[1.0,2.0,3.0,4.0,5.0,5.0,5.0,5.0,5.0,5.0,6.0]
kern10=[1.0,2.0,3.0,4.0,5.0,5.0,5.0,5.0,5.0,6.0]
kern9=[1.0,2.0,3.0,4.0,5.0,5.0,5.0,5.0,6.0]
kern8=[1.0,2.0,3.0,4.0,5.0,5.0,5.0,6.0]
datavector
for n in eachindex(datavector)
#n=2 
dataind=datavector[n]
T=zeros(length(dataind))
for i in eachindex(dataind)
    if dataind[i] == 'm'
        T[i] = 1
    end
    if dataind[i] == 'u'
        T[i] = 2
    end    
    if dataind[i] == 'l'
        T[i] = 3
    end
    if dataind[i] == '('
        T[i] = 4
    end
    if Base.Unicode.category_abbrev(dataind[i]) == "Nd"
        T[i] = 5
    end
    if dataind[i] == ','
        T[i] = 5
    end
    if dataind[i] == ')'
        T[i] = 6
    end
end

tot12 = 0
match12 = find_all_matches(T, kern12)
for i in eachindex(match12)
    k = split(filter(c -> !(c in ['m','u','l','(',')']), dataind[match12[i]:match12[i]+11]),",")
    r = parse(Int,k[1])*parse(Int,k[2])
global tot12 = tot12 + r
end

tot11=0
match11 = find_all_matches(T, kern11)
for i in eachindex(match11)
    k = split(filter(c -> !(c in ['m','u','l','(',')']), dataind[match11[i]:match11[i]+10]),",")
    r = parse(Int,k[1])*parse(Int,k[2])
global tot11 = tot11 + r
end

tot10 = 0
match10 = find_all_matches(T, kern10)
for i in eachindex(match10)
    k = split(filter(c -> !(c in ['m','u','l','(',')']), dataind[match10[i]:match10[i]+9]),",")
    r = parse(Int,k[1])*parse(Int,k[2])
global tot10 = tot10 + r
end
tot9 = 0
match9 = find_all_matches(T, kern9)
for i in eachindex(match9)
    k = split(filter(c -> !(c in ['m','u','l','(',')']), dataind[match9[i]:match9[i]+8]),",")
    r = parse(Int,k[1])*parse(Int,k[2])
global tot9 = tot9 + r
end

tot8 = 0
match8 = find_all_matches(T, kern8)
for i in eachindex(match8)
    k = split(filter(c -> !(c in ['m','u','l','(',')']), dataind[match8[i]:match8[i]+7]),",")
    r = parse(Int,k[1])*parse(Int,k[2])
global tot8 = tot8 + r
end

k=tot12+tot11+tot10+tot9+tot8
println(k)
push!(total,k)

end
sum(total)