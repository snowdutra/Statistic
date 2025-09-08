# Crie um data.frame que contenha duas colunas: "Animais" e "Alimentos".
# A primeira coluna deve ser o vetor: Cachorro, Gato, Peixe, Peixe, Lagarto.
# A segunda coluna deve ser o vetor: Pão, Laranja, Chocolate, Cenoura, Leite.

# Criando os vetores
animais <- c("Cachorro", "Gato", "Peixe", "Peixe", "Lagarto")
alimentos <- c("Pão", "Laranja", "Chocolate", "Cenoura", "Leite")

# Criando o data.frame
df <- data.frame(Animais = animais, Alimentos = alimentos)

# Exibindo o data.frame
print(df)

# Salvar o data.frame como um arquivo CSV
write.csv(df, file = "dados_animais_alimentos.csv", row.names = FALSE)

# Salvar como Excel (necessário pacote writexl),
install.packages("writexl")
# Execute se não tiver o pacote
library(writexl)
write_xlsx(df, path = "dados_animais_alimentos.xlsx")

# Carregar tidyverse
library(tidyverse)

# Para descarregar um pacote utilizamos "detach"
detach("package:writexl", unload = TRUE)

# Ler base de dados
cces <- read_csv("cces_sample.csv")

# Resolver o que fazer com os missing values (NA = not available)

sum(is.na(cces))
# Apresenta a quantidade de valores NA na base

colSums(is.na(cces))
# Mostra a quantidade de NA por variável

problema <- filter(cces, is.na(edloan))

# Um olhar rápido na base "problema" indica que a maioria não é
# de origem hispânica nem é sindicalizado

table(problema$educ)

# Provavelmente os NA surgiram de respondentes que não são
# responsáveis por financiamento estudantil

# 2 indica que o respondente não é responsável por um financiamento estudantil
cces$edloan[is.na(cces$edloan)] <- 2

# O processo de imputação pode acontecer utilizando a média, mediana ou moda

moda <- as.numeric(names(which.max(table(na.omit(cces$edloan)))))
table(cces$edloan)

# Não é possível calcular a média de uma variável que possui NA
# A função na.omit irá omitir as linhas com NA no campo escolaridade
# E não faz sentido realizar a imputação pela média

mean(na.omit(cces$edloan))

# Imputação pela moda
cces$edloan[is.na(cces$edloan)] <- moda

table(cces$edloan)

colSums(is.na(cces))

dados <- drop_na(cces)
dim(dados)

sum(is.na(cces))
