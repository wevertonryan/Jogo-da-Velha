cfg = 3
list = { --as 9 casa de um jogo da velha, as letras são linhas horizontais, e os números as colunas verticais, ex: A1 seria a superior esquerda
  afl = 64 + cfg, nml = 48 + cfg,
  A1 = "_", A2 = "_", A3 = "_", 
  B1 = "_", B2 = "_", B3 = "_", 
  C1 = " ", C2 = " ", C3 = " ",
}
function vald() --valida a resposta que o jogador deu de uma forma que o codigo entenda
  local val = false --variavel criada para determinar se resposta dada pelo jogador é valida
  repeat
    local resp = io.read():upper() --resposta do jogador com função que deixa respota maiuscula para poder corresponder a variavel list
    l = string.sub(resp, 1, 1) --pega o primeiro caracter da resposta do jogador presumindo que é uma letra, já que o formato padrão é letra depois número
    n = string.sub(resp, 2, 2) --pega o segundo caracter, presumindo que seja um número
    if n == "" then
      n = " "
    end
    if l == "" then
      l = " "
    end
    if string.byte(l) >= 65 and string.byte(l) <= list["afl"] and string.byte(n) >= 48 and string.byte(n) <= list["nml"] then
      --65 é A em byte, 90 é Z em byte, assim ele verifica se é realmente uma letra
      --é a mesma coisa com o número
      val = true -- está validando como verdadeiro que o valor que temos está padronizado para funcionar no código
    elseif string.byte(l) >= 48 and string.byte(l) <= list["nml"] and string.byte(n) >= 65 and string.byte(n) <= list["afl"] then
      --é para caso o jogador tenha colocado primeiro número e depois letra
      --só inverte os valores e valida como verdadeiro
      l = string.sub(resp, 2, 2)
      n = string.sub(resp, 1, 1)
      val = true
    else --caso o jogador tenha dado uma resposta muito diferente, é falado que é resposta invalida e dá a opção do jogador responder novamente
      print("resposta inválida!")
      val = false
    end
  until val == true
  return l .. n --retorna valor padronizado
end

function map() --mapeia o jogo em tela como jogo da velha
  print("  1 2 3")
  for i = 1, 3 do
    local txt = string.char(64 + i)
    print(txt.." "..list[txt..1].."|"..list[txt..2].."|"..list[txt..3])
  end
end

function rule()
  repeat
    local resp = vald()
    local val = false
    if list[resp] == "X" or list[resp] == "O" then
      print("resposta inválida")
      val = false
    else
      list[resp] = p
      endgame = verf(resp)
      val = true
    end
  until val == true
  if p == "X" then
    p = "O"
  else
    p = "X"
  end
end

function verf(m)
  local le = string.byte(string.sub(m, 1, 1))
  local nu = string.byte(string.sub(m, 2, 2))
  local x = {-1, 0, 1, 1}
  local y = {-1, -1, -1, 0}
  for i = 1, 4 do
    --print(string.char(le+x[i]*-1)..string.char(nu+y[i]*-1))
    --print(string.char(le+x[i])..string.char(nu+y[i]))
    if list[string.char(le+x[i])..string.char(nu+y[i])] == p then
      print("check1")
      if list[string.char(le+x[i]*2)..string.char(nu+y[i]*2)] == p then
        return p
      elseif list[string.char(le+x[i]*-1)..string.char(nu+y[i]*-1)] == p then
        return p
      end
    elseif list[string.char(le+x[i]*-1)..string.char(nu+y[i]*-1)] == p then
      print("check2")
      if list[string.char(le+x[i]*-2)..string.char(nu+y[i]*-2)] == p then
        print("check3")
        return p
      end
    end
  end  
end


print("[[JOGO DA VELHA]] versão teste de mapeamento\npara jogar apenas digite de A a C mais um número de 1 a 3, exemplo: C3")
map()
p = "X"
endgame = ""
repeat
  print(endgame == p)
  rule()
  os.execute("clear")
  map()
until endgame == "X" or endgame == "O"
if endgame == "X" then
  print("O vencedor é o jogador 1")
elseif endgame == "O" then
  print("O vencedor é o jogador 2")
else
  print("empate")
end

--(feito) impossibilitar mandar respostas que não estejam em letra número
--(feito) não permitir colocar um simbolo em uma casa já ocupada
--(feito) printar mapeamento ABC/123
--regra para vencedor e perdedor
--mensagem de vítoria/derrota
--IA para jogar contra
--possibilidade de jogo multiplayer ou singleplayer
--possibilidade de aumento de campo de jogo
--diferentes modos de jogo(clássico, pontuação)