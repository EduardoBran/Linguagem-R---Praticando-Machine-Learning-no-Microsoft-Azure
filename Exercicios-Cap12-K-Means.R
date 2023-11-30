# Lista de Exercícios - Capítulo 12 - Parte 2

# Configurando o diretório de trabalho
setwd("C:/Users/Julia/Desktop/CienciaDeDados/1.Big-Data-Analytics-com-R-e-Microsoft-Azure-Machine-Learning/12.Microsoft-Azure-Machine-Learning")
getwd()



# Carregando pacotes

library(datasets)
library(cluster) # visualização dos clusters
library(ggplot2) # Gráficos para Análise Exploratória


# Carregando Dados

# - Usaremos o dataset iris neste exemplo
# - O dataset iris possui observações de 3 especies de flores (Iris setosa, Iris virginica e Iris versocolor)
# - Para cada flor, 4 medidas sao usadas: 
#   comprimento (length) e largura (width) do caule (sepal) e comprimento e largura da petala (petal)

dados = iris
head(dados)


# Veja que os dados claramente possui grupos com caracteristcas similares
ggplot(dados, aes(Petal.Length, Petal.Width, color = Species)) + geom_point(size = 3)


# Agora usarmeos o K-Means para tentar agrupar os dados em clusters
set.seed(101)
help(kmeans)

# Exercício 1 - Usando a função kmeans(), crie um modelo de clustering (aprendizagem não supervisionada). 
#               Use a documentação, para fazer sua pesquisa.

# - Neste caso, ja sabemos quantos grupos (clusters) existem em nossos dados (3)
#   Perceba que o dataset iris possui 5 colunas, mas estamos usando as 4 primeiras

# - Obtendo informação sobre os clusters
#   Foram criados 3 clusters: cluster 1, 2 e 3

# - Perceba que apesar o algoritmo ter feito a divisão dos dados em clusters, houve problema em dividir alguns dos dados, 
#   que apesar de terem caracteristicas diferentes, ficaram no mesmo cluster

help(clusplot)

# Plot
clusplot(iris, irisCluster$cluster, color = TRUE, shade = TRUE, labels = 0, lines = 0, )




