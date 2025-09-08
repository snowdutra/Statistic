# Os objetos precisam ser criados

# Texto deve ser inserido com aspas "ola" ou 'ola'
hello <- "ola"

# Números são atribuídos sem aspas
nota <- 7

# A função c() combina elementos dentro de um vetor
hello <- c("olá", "Messi", "Menino Ney")
hello

nota <- c(7, 10, 8)
nota

# Para acessar o conteúdo de alguma posição do vetor
hello[2]
hello[2:3]
hello[c(1, 3)]

# Para criar uma planilha (data.frame), basta usar a função data.frame
dados <- data.frame(hello, nota)

# Como exportar uma base do R?

# Exportando como .csv
write.csv(dados, "aula01_csv.csv", row.names = FALSE)

# Como no Brasil utiliza-se a vírgula como separador de decimal,
# existe um formato brazuca
write.csv2(dados, "aula01_br_csv.csv", row.names = FALSE)

# Para exportar no formato xlsx, precisamos instalar um pacote chamado writexl
library(writexl)
write_xlsx(dados, "aula01.xlsx")

# Outros formatos de atribuição
x <- c(1, 2, 3, 4, 5)
y <- c(6, 7, 8, 9, 10)
z <- x

class(dados)

# Algumas funções só podem ser usadas para determinadas classes
dim(dados)

x <- as.array(x)
dim(x)

hello <- as.numeric(hello) # Vai gerar NAs porque não são números
# NA = not available
nota <- as.character(nota)
nota <- as.numeric(nota)

# Classe logical
h <- c("e", "s", "p", "m") # usar aspas com textos
i <- h == "p"
i
which(i)
