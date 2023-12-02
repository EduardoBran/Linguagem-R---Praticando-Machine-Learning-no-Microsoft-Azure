# Lista de Exercícios - Capítulo 12 - Parte 2

# Configurando o diretório de trabalho
setwd("C:/Users/Julia/Desktop/CienciaDeDados/1.Big-Data-Analytics-com-R-e-Microsoft-Azure-Machine-Learning/12.Microsoft-Azure-Machine-Learning")
getwd()



# Carregando pacotes

library(datasets)
library(cluster) # visualização dos clusters
library(ggplot2) # Gráficos para Análise Exploratória
library(caTools)   # contém a função sample.split() que cria uma amostra que irá fazer a divisão entre dados de treinos e testes



# Carregando Dados

# - Usaremos o dataset iris neste exemplo
# - O dataset iris possui observações de 3 especies de flores (Iris setosa, Iris virginica e Iris versocolor)
# - Para cada flor, 4 medidas sao usadas: 
#   comprimento (length) e largura (width) do caule (sepal) e comprimento e largura da petala (petal)

dados = iris
head(dados)

## Verificando dados ausentes
any(is.na(dados))
colSums(is.na(dados))

## Tipo de dados
str(dados)
summary(dados)
dim(dados)

## Visualizando os dados
head(dados)
View(dados)

## Veja que os dados claramente possui grupos com caracteristcas similares
ggplot(dados, aes(Petal.Length, Petal.Width, color = Species)) + geom_point(size = 3)




## Agora usaremos o K-Means para tentar agrupar os dados em clusters
set.seed(101)
help(kmeans)



# Exercício 1 - Usando a função kmeans(), crie um modelo de clustering (aprendizagem não supervisionada). 
#               Use a documentação, para fazer sua pesquisa.
#               Neste caso, ja sabemos quantos grupos (clusters) existem em nossos dados (3)
#               Perceba também que o dataset iris possui 5 colunas, mas estamos usando as 4 primeiras

# a) Crie o mdelo e obtennha informação sobre os clusters

modelo_kmeans <- kmeans(dados[, c("Sepal.Length", "Sepal.Width", "Petal.Length", "Petal.Width")], centers = 3)
modelo_kmeans

# -> Foram criados 3 clusters: cluster 1, 2 e 3


# Plot
help(clusplot)
clusplot(dados, modelo_kmeans$cluster, color = TRUE, shade = TRUE, labels = 0, lines = 0, )

# -> Perceba que apesar o algoritmo ter feito a divisão dos dados em clusters, houve problema em dividir alguns dos dados, 
#    que apesar de terem caracteristicas diferentes, ficaram no mesmo cluster













#### REALIZANDO PREVISÕES E DIVINDO EM TREINO E TESTE

## Dividindo os dados em treino e teste
amostra <- sample.split(dados$Species, SplitRatio = 0.80)

treino <- subset(dados, amostra == TRUE)
teste <- subset(dados, amostra == FALSE)

# -> Lembrando sempre que: Treinamos o modelo com dados de TREINO e fazemos predições com dados de TESTE

