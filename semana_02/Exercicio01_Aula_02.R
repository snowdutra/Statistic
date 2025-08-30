#*Crie um data.frame que contenha duas colunas: 
#*uma chamada "Animais" e a outra chamada "Alimentos". 
#*A primeira coluna deve ser o vetor 
#*(observe os valores repetidos intencionalmente): 
#*Cachorro, Gato, Peixe, Peixe, Lagarto. 
#*A segunda coluna deve ser o vetor: Pão, Laranja, Chocolate, Cenoura, Leite.

# Criando os vetores
Animais <- c("Cachorro", "Gato", "Peixe", "Peixe", "Lagarto")
Alimentos <- c("Pão", "Laranja", "Chocolate", "Cenoura", "Leite")

# Criando o data.frame
df <- data.frame(Animais, Alimentos)

# Exibindo o data.frame
print(df)

# Salvar o data.frame como um arquivo CSV
write.csv(df, file = "dados_animais_alimentos.csv", row.names = FALSE)

write_xlsx(df, path = "dados_animais_alimentos.xlsx")

#* Uma vez instalado precisamos
#* carregar a base toda vez para usar 
library(tidyverse)

#* para descarregar um pacote utilizamos "detach"
detach(packpage: writexl)


cces = read_csv("cces_sample.csv")

#* Resolver o que fazer com os missing values (NA = not available)

sum(is.na(cces))
# Apresenta a quantidade de linhas que possui pelo menos um NA.

colSums(is.na(cces))
# Mostra a quantidade de NA por variável

problema = filter(cces, is.na(edloan))

#* Um olhar rápido na base "problema" indica que a maioria não é
#* de origem hispânica nem é sindicalizado

table(problema$educ)

#* Provalvemente os NA surgiram de respondentes que não são
#* responsaveis por financiamento estudantil

#* 2 Indica que o respondente não é responsável por um financiamento
#* estudantil

problema$edloan = problema$edloan[is.na(problema$edloan)] = 2

#* O processo de inputação pode acontecer utlizando a média
#* a mediana, a moda 

moda <- which.max(table(na.omit(cces$edloan)))
table(cces$edloan)

#* Não é possivel calcular a média de uma variavel que possui NA
#* A função na.omit irá omitir as linhas com NA no campo escolaridade
#* E não faz sentido realizar a inputação pela média

mean(na.omit(cces$edloan))

# Inputação pela moda
cces$edloan[is.na] = moda

table(cces$edloan)

colSums(is.na(cces))

dados = drop_na(cces)
dim(dados)

sum(is.na(cces))