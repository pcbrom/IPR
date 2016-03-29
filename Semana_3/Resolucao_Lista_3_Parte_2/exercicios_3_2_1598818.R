# Parte 2 de 2

# Exercício 01

data(iris) # Para ler um conjunto de dados
View(iris) # Carregar o conteúdo - abre a tabela
summary(iris) # Resumo dos dados
names(iris) # Descrição das colunas - atributo = nome dos elementos
str(iris) # Estrutura interna de "iris"
unique(iris[["Species"]]) # Demonstra as "espécies"

# Nesse conjunto os dados da "virginica" estão organizados da linha 101 até 150
iris.virginica=iris[c(101:150),c(1:4)] # Transferindo as 4 colunas para uma nova matriz
# Caso coloque a última coluna dará erro, pois ele continuará indexando as outras espécies...
str(iris.virginica) # Estrutura interna de "iris.virginica"
m.iris.virginica=apply(iris.virginica, MARGIN = 2, FUN = mean) # Determina a média em cada coluna da matriz
m.iris.virginica # Plota os valores

# Efetuando os cálculos com base na indexação da coluna "espécie"
mean.sepal.lenght=tapply(iris[,1],INDEX=iris[["Species"]],mean) # Indexa a primeira coluna aos nomes das espécies
mean.sepal.lenght # Plota os valores

# Exercício 02

data(iris) # Para ler um conjunto de dados
# Comando que retorna um vetor de médias
iris.virginica=iris[c(101:150),c(1:4)] # Transferindo as 4 colunas para uma nova matriz
m.iris.virginica=apply(iris.virginica, MARGIN = 2, FUN = mean) # Cria matriz para calcular a média de cada coluna e indexado pelas "espécies"
m.iris.virginica # Plota os valores

# Exercício 03

data(mtcars) # Para ler um conjunto de dados
View(mtcars) # Carregar o conteúdo - abre a tabela
summary(mtcars) # Resumo dos dados
names(mtcars) # Descrição das colunas - atributo = nome dos elementos
str(mtcars) # Estrutura interna de "mtcars"

# Efetuando os cálculos com base na indexação da coluna "cyl"
mean.mpg=tapply(mtcars[,"mpg"],INDEX=mtcars[["cyl"]],mean) # Indexa as "milhas por galão - mpg" aos "número de cilindros - cyl"
mean.mpg # Plota os valores

# Exercício 04

data(mtcars) # Para ler um conjunto de dados

mean.hp=tapply(mtcars[,"hp"],INDEX=mtcars[["cyl"]],mean) # Indexa as "horsepower - hp" aos "número de cilindros - cyl"
mean.hp # Plota os valores
diferenca=mean.hp[1]-mean.hp[3]
abs(diferenca)

# Exercício 05

# Exemplificando com o banco de dados "iris"
data(iris) # Para ler um conjunto de dados

# apply: aplica função (FUN) na MARGIN (linha ou coluna) - apenas para argumentos numéricos ou lógicos
iris.SemEspecie=iris[c(1:150),c(1:4)] # Transferindo as 4 colunas para uma nova matriz, sendo ignorada a última - já que por ser texto não funciona com "apply"
iris.exercicio05=apply(iris.SemEspecie,2,mean)
iris.exercicio05

# lapply: aplica uma mesma função (FUM) na MARGIN (linha ou coluna) - apenas para argumentos numéricos ou lógicos - trabalha com listas de qualquer tamanho
iris.SemEspecie=iris[c(1:150),c(1:4)] # Transferindo as 4 colunas para uma nova matriz, sendo ignorada a última - já que por ser texto não funciona com "lapply"
iris.exercicio05=lapply(iris.SemEspecie,mean,2)
iris.exercicio05


# mapply: aplica função (FUN) nos vetores desejados (colunas), com o diferencial de manipular diferentes tamanhos - apenas para argumentos numéricos ou lógicos
iris.SemEspecie=iris[c(1:150),c(1:4)] # Transferindo as 4 colunas para uma nova matriz, sendo ignorada a última - já que por ser texto não funciona com "mapply"
iris.exercicio05=mapply(mean,iris.SemEspecie)
iris.exercicio05

# tapply: aplica função (FUN) no vetor desejado (coluna) para sofre indexação, manipular apenas vetores de mesmo tamanho - pode incluir textos para indexação
iris.coluna1=iris[c(1:150),c(1:1)] # Transferindo a 1ª coluna para um novo vetor
iris.Especie=iris[c(1:150),c(5:5)] # Transferindo a coluna das espéces para um novo vetor
iris.exercicio05=tapply(iris.coluna1,iris.Especie,mean)
iris.exercicio05


# Exercício 06

# Exemplificando com o banco de dados "iris"
data(iris) # Para ler um conjunto de dados

# split: agrupa dois vetores por grupo de fatores - pode ser texto
iris.coluna1=iris[c(1:150),c(1:1)] # Transferindo a 1ª coluna para um novo vetor
iris.Especie=iris[c(1:150),c(5:5)] # Transferindo a coluna das espéces para um novo vetor
iris.exercicio05=split(iris.coluna1,iris.Especie)
iris.exercicio05

# aggregate: agrupa e executa FUN (cálculos) por grupo de fatores
iris.exercicio05=aggregate(iris[["Petal.Length"]],list(iris$Species),mean,na.rn=T)
iris.exercicio05

# Exercício 07

ls() # Visualiza o que está executando na área de trabalho
debug(ls) # Abre o console para depurar
ls()