-- game set
function map()
    c1 = "_"
    c2 = "_"
    c3 = " "
    c4 = " "
    p = "X"
end

map()
print(c1.."|"..c2.."\n"..c3.."|"..c4)

while 1 == 1 do
    resp = io.read("*n")
    if resp == 1 then
        c1 = p
    elseif resp == 2 then
        c2 = p
    elseif resp == 3 then
        c3 = p
    elseif resp == 4 then
        c4 = p
    else
        print("resposta invalida")
    end
    print(c1.."|"..c2.."\n"..c3.."|"..c4)
    if p == "X" then
        p = "O"
    else
        p = "X"
    end
end

--gamerule