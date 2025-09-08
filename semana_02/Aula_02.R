# Aula 02

# A classe factor é utilizada para criar categorias

move <- c("carro", "a pé", "uber", "metro",
          "carro", "carro", "uber")
move <- factor(move)

# Cria categorias e as ordena em ordem alfabética.
# Quando você quiser alguma ordem diferente da alfabética
# é necessário utilizar o argumento "levels"

table(move)

move1 <- factor(move,
                levels = c("uber", "metro", "carro", "a pé"))

table(move1)

dados <- data.frame(move, move1)

# Conclusão: A classe factor não altera
# a ordem dos elementos dentro do vetor