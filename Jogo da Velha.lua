list = {
  A1 = "_", A2 = "_", A3 = "_", 
  B1 = "_", B2 = "_", B3 = "_", 
  C1 = " ", C2 = " ", C3 = " ",
}

function map()
  for i = 1, 3 do
    local txt = string.char(64 + i)
    print(list[txt..1].."|"..list[txt..2].."|"..list[txt..3])
  end
end

print("[[JOGO DA VELHA]] versão teste de mapeamento\npara jogar apenas digite de A a C mais um número de 1 a 3, exemplo: C3")
map()
local p = "X"
while 1 == 1 do
  resp = io.read():upper()
  list[resp] = p
  map()
  if p == "X" then
    p = "O"
  else
    p = "X"
  end
end