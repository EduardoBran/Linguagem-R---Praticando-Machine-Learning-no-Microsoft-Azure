# Estudo de Caso

# Configurando o diretório de trabalho
setwd("C:/Users/Julia/Desktop/CienciaDeDados/1.Big-Data-Analytics-com-R-e-Microsoft-Azure-Machine-Learning/12.Microsoft-Azure-Machine-Learning")
getwd()



# - Neste estudo de caso usaremos o dataset ToothGrowth disponível no pacote datasets em Re carregado quando você inicializa
#   o RStudio.

# - Esse dataset contém um conjunto de registros com informações sobre o comprimento dos dentes de Porcos da Guiné.

# - Pesquisadores ministraram diferentes doses de 2 tipos de suplementos vitamínicos em 60 porquinhos e avaliaram o
#   resultadono crescimento dos dentes dos animais.

# - Com base nesses dados iremos responder à seguinte pergunta:

#  -> Há diferença significativa no crescimento dos dentes de acordo com o tipo de suplemento usado nos Porcos da Guiné ?
#     Um teste estatístico vai nos ajudar a encontrar a resposta!

#   -> H0 = afirma que não há diferença significativa.
#   -> H1 = afirma que há diferença significativa no crescimento dos dentes de acordo com o tipo de suplemento usado.



# Carregando pacotes
library(dplyr)
library(car) # qqplot
library(ggplot2)
library(GGally)



# Carregando dados
dados <- ToothGrowth
head(dados)

# Tipo de dados
str(dados)
summary(dados)

# Histograma da variável len
hist(dados$len)

# GGPairs
ggpairs(dados)

# BoxPlot por tipo de suplemento (supp)
qplot(supp,
      len,
      data = dados,
      main = "Crescimento dos Dentes dos Porcos da Guiné por Tipo de Suplemento",
      xlab = "Tipo de Suplemento",
      ylab = "Comprimento do Dente") +
  geom_boxplot(aes(fill = supp))

# - Analisando o BoxPlot acima podemos interpretar que parece haver uma diferença no crescimento dos dentes,
#   associada ao tipo de suplemento. Será necessário validar.



# Dividindo os dados em dois tipos de suplemento
tipo_OJ <- 
  dados %>% 
  filter(supp == 'OJ') %>% 
  na.omit(tipo_OJ)

tipo_VC <- 
  dados %>% 
  filter(supp == 'VC') %>% 
  na.omit(tipo_VC)



##### Validações


## qqPlot

qqPlot(tipo_OJ$len)
qqPlot(tipo_VC$len)

# - Ambos os grupos estão com a pontos de dados (bolinhas) dentro do intervalo de confiança, o que indica
#   uma distribuição normal



## teste shapiro-wilk

shapiro.test(tipo_OJ$len)             # valor-p = 0.02359 (ou seja, menor que 0.05)
shapiro.test(tipo_VC$len)             # valor-p = 0.4284  (ou seja, maior que 0.05)

# - Para o grupo "OJ", o teste de Shapiro-Wilk tem um valor-p de 0.02359, que é menor que 0.05. Isso sugere uma evidência
#   fraca contra a normalidade. No entanto, em contextos práticos, valores-p ligeiramente abaixo de 0.05 são frequentemente
#   considerados aceitáveis, especialmente com tamanhos de amostra grandes.



## teste f (valor-p precisa ser maior que 0.05)

var.test(tipo_OJ$len, tipo_VC$len) # p-value = 0.2331 

# - O teste F para comparar as variâncias tem um valor-p de 0.2331, que é maior que 0.05. Isso sugere que não há evidência para
#   rejeitar a hipótese nula de homogeneidade de variâncias.



## Aplicando teste t

t.test(tipo_OJ$len, tipo_VC$len, alternative = "two.sided")  # p-value = 0.06063



## Conclusão:

# - Não há diferença significativa no crescimento dos dentes de acordo com o tipo de suplemento usado nos Porcos da Guiné, com base
#   nos dados disponíveis neste estudo. 

# - O valor de p de 0.06063 é maior que 0.05, indicando que não há evidências estatísticas suficientes para concluir que as médias dos
#   grupos "OJ" e "VC" são diferentes em termos de crescimento dos dentes.










