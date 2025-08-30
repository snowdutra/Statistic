#filter -> reduz o número de linhas
#select -> reduz o número de colunas
#encadeamento -> piping (%>%) encadea funções uma atrás da outra
#renomear colunas
#recodificar uma variável -> recode (no excel, usavámos o PROCV para isso)
#tabela dinâmica: calcular média por grupos -> group_by e summarise

library(tidyverse)

cces = read_csv("cces_sample.csv")
cces$edloan[is.na(cces$edloan)] = 2 #saber a posição
cces1 = drop_na(cces)

#ex 1. Criar uma base, a partir da base anterior que filtre apenas os
#respondentes casadas que trabalham em tempo integral.

cces2 = filter(cces, marstat == 1 & employ == 1 | marstat == 6 & employ == 1)

# Exercício 2. Criar uma base, a partir da anterior que apenas apresente as
# variáveis: region, educ, marstat e employ.

cces3 = select(cces2, region, educ, marstat, employ)

# Exercício 3. Algumas vezes, já temos ideia do que queremos desde o início.
# Encadear os comandos é a solução. Refaça as operações do cces1, cces2 e
# cces3 todas de uma vez só, usando o piping %>%.

cces4 = cces %>%
  drop_na() %>%
  filter(marstat == 1 & employ == 1 | marstat == 6 & employ == 1) %>%
  select(region, educ, marstat, employ)

# ex4. Renomear a variável marstat para Estado Civil e employ para situação
# de trabalho, a partir da base cces4.

cces4 = rename(cces4,Estado Civil= marstat,
               Situação de trabalho = employ)

# ex5. Recodificar a variávgel region, utilizando o codebook.

cces4$region = recode(cces4$region,
                      '1' = 'Northwest',
                      '2' = 'Midwest',
                      '3' = 'South',
                      '4' = 'West')

table(cces4$region)
#para usar ordem diferente da alfabética, é preciso usar o comando factor
#com a ordem em levels.

cces4 = cces %>%
  drop_na() %>%
  filter(marstat == 1 & employ == 1 | marstat == 6 & employ == 1) %>%
  select(region, educ, marstat, employ)
rename(cces4,Estado Civil= marstat, Situação de trabalho = employ)
mutate(region = recode(region,   #mutate= muda a variável na base
                       '1' = 'Northwest',
                       '2' = 'Midwest',
                       '3' = 'South',
                       '4' = 'West'))

# ex6. Criar grupos com base na variável region, utilizando a função group_by.
# após isso, calcular a média da variável educ.

cces4 = group_by(cces4, region)
summarise(cces4, "Média" = mean(educ)) #não se coloca no encadeamento
#summarise cria uma tabela
#segundo modo
cces4 = cces %>%
  drop_na() %>%
  filter(marstat == 1 & employ == 1 | marstat == 6 & employ == 1) %>%
  select(region, educ, marstat, employ)
rename(cces4,Estado Civil= marstat, Situação de trabalho = employ)
mutate(region = recode(region,   #mutate= muda a variável na base
                       '1' = 'Northwest',
                       '2' = 'Midwest',
                       '3' = 'South',
                       '4' = 'West')
       
) %>%
  group_by(region)

tabela =summarise(cces4, "Média" = mean(educ))
# observação: para melhorar o formato da apresentação da tabela, usamos 
# a função kable

library(knitr)

options(digits = 3)
kable(tabela)