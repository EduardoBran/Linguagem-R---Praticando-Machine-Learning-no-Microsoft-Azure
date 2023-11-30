# Lista de Exercícios - Capítulo 12 - Parte 1

# Configurando o diretório de trabalho
setwd("C:/Users/Julia/Desktop/CienciaDeDados/1.Big-Data-Analytics-com-R-e-Microsoft-Azure-Machine-Learning/12.Microsoft-Azure-Machine-Learning")
getwd()


# Carregando pacotes

library(rpart)       # Um dos diversos pacotes para arvores de recisao em R
library(rpart.plot)  # outro pacote para visualizaco ficar mais legivel



# Carregando dados para o exercício (este dataset é disponibilizado junto com o pacote rpart)
dados = kyphosis
str(kyphosis)
head(kyphosis)



## Exercício 1 - Depois de explorar o dataset, crie um modelo de árvore de decisão

# a) Examine o resultado de uma árvore de decisao, para isso existem diversas funcões, mas você pode usar printcp()
#    ( Exemplo: " prp(arvore) " )


# b) Visualize a ávore (execute uma função para o plot e outra para o texto no plot).
#    Utilize o zoom para visualizar melhor o gráfico.




