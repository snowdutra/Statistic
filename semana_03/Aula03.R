library(tidyverse)
library(knitr)

# Carregar dados
setwd("C:/Users/gustavo.telles/Desktop/Statistic/csv")
cces <- read_csv("cces_sample.csv")
cces$edloan[is.na(cces$edloan)] <- 2

# Remover linhas com NA
cces1 <- drop_na(cces)

# Ex 1: Filtrar casados que trabalham em tempo integral
cces2 <- filter(cces1, (marstat == 1 | marstat == 6) & employ == 1)

# Ex 2: Selecionar variáveis específicas
cces3 <- select(cces2, region, educ, marstat, employ)

# Ex 3: Encadeando tudo com pipe
cces4 <- cces %>%
  drop_na() %>%
  filter((marstat == 1 | marstat == 6) & employ == 1) %>%
  select(region, educ, marstat, employ) %>%
  rename(
    "Estado Civil" = marstat,
    "Situação de trabalho" = employ
  ) %>%
  mutate(region = recode(region,
                         '1' = 'Northwest',
                         '2' = 'Midwest',
                         '3' = 'South',
                         '4' = 'West'))

# Ex 5: Tabela de frequência da região
table(cces4$region)

# Ex 6: Média de educ por região
tabela <- cces4 %>%
  group_by(region) %>%
  summarise(Média = mean(educ))

options(digits = 3)
kable(tabela)
