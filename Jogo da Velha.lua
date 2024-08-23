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

function map(x) --mapeia o jogo em tela como jogo da velha
  if x == 1 then --apresenta o guia de linha(letra) e coluna(número)
    print("  1 2 3")
    for i = 1, 3 do
      local txt = string.char(64 + i)
      print(txt.." "..list[txt..1].."|"..list[txt..2].."|"..list[txt..3])
    end
  else --para o jogo real
    for i = 1, 3 do
      local txt = string.char(64 + i)
      print(list[txt..1].."|"..list[txt..2].."|"..list[txt..3])
    end
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
      val = true
    end
  until val == true
  if p == "X" then
    p = "O"
  else
    p = "X"
  end
end

print("[[JOGO DA VELHA]] versão teste de mapeamento\npara jogar apenas digite de A a C mais um número de 1 a 3, exemplo: C3")
map(1)
p = "X"
while 1 == 1 do
  rule()
  map(2)
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