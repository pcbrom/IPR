# Parte 2 de 2

# Exerc�cio 01

data(iris) # Para ler um conjunto de dados
View(iris) # Carregar o conte�do - abre a tabela
summary(iris) # Resumo dos dados
names(iris) # Descri��o das colunas - atributo = nome dos elementos
str(iris) # Estrutura interna de "iris"
unique(iris[["Species"]]) # Demonstra as "esp�cies"

# Nesse conjunto os dados da "virginica" est�o organizados da linha 101 at� 150
iris.virginica=iris[c(101:150),c(1:4)] # Transferindo as 4 colunas para uma nova matriz
# Caso coloque a �ltima coluna dar� erro, pois ele continuar� indexando as outras esp�cies...
str(iris.virginica) # Estrutura interna de "iris.virginica"
m.iris.virginica=apply(iris.virginica, MARGIN = 2, FUN = mean) # Determina a m�dia em cada coluna da matriz
m.iris.virginica # Plota os valores

# Efetuando os c�lculos com base na indexa��o da coluna "esp�cie"
mean.sepal.lenght=tapply(iris[,1],INDEX=iris[["Species"]],mean) # Indexa a primeira coluna aos nomes das esp�cies
mean.sepal.lenght # Plota os valores

# Exerc�cio 02

data(iris) # Para ler um conjunto de dados
# Comando que retorna um vetor de m�dias
iris.virginica=iris[c(101:150),c(1:4)] # Transferindo as 4 colunas para uma nova matriz
m.iris.virginica=apply(iris.virginica, MARGIN = 2, FUN = mean) # Cria matriz para calcular a m�dia de cada coluna e indexado pelas "esp�cies"
m.iris.virginica # Plota os valores

# Exerc�cio 03

data(mtcars) # Para ler um conjunto de dados
View(mtcars) # Carregar o conte�do - abre a tabela
summary(mtcars) # Resumo dos dados
names(mtcars) # Descri��o das colunas - atributo = nome dos elementos
str(mtcars) # Estrutura interna de "mtcars"

# Efetuando os c�lculos com base na indexa��o da coluna "cyl"
mean.mpg=tapply(mtcars[,"mpg"],INDEX=mtcars[["cyl"]],mean) # Indexa as "milhas por gal�o - mpg" aos "n�mero de cilindros - cyl"
mean.mpg # Plota os valores

# Exerc�cio 04

data(mtcars) # Para ler um conjunto de dados

mean.hp=tapply(mtcars[,"hp"],INDEX=mtcars[["cyl"]],mean) # Indexa as "horsepower - hp" aos "n�mero de cilindros - cyl"
mean.hp # Plota os valores
diferenca=mean.hp[1]-mean.hp[3]
abs(diferenca)

# Exerc�cio 05

# Exemplificando com o banco de dados "iris"
data(iris) # Para ler um conjunto de dados

# apply: aplica fun��o (FUN) na MARGIN (linha ou coluna) - apenas para argumentos num�ricos ou l�gicos
iris.SemEspecie=iris[c(1:150),c(1:4)] # Transferindo as 4 colunas para uma nova matriz, sendo ignorada a �ltima - j� que por ser texto n�o funciona com "apply"
iris.exercicio05=apply(iris.SemEspecie,2,mean)
iris.exercicio05

# lapply: aplica uma mesma fun��o (FUM) na MARGIN (linha ou coluna) - apenas para argumentos num�ricos ou l�gicos - trabalha com listas de qualquer tamanho
iris.SemEspecie=iris[c(1:150),c(1:4)] # Transferindo as 4 colunas para uma nova matriz, sendo ignorada a �ltima - j� que por ser texto n�o funciona com "lapply"
iris.exercicio05=lapply(iris.SemEspecie,mean,2)
iris.exercicio05


# mapply: aplica fun��o (FUN) nos vetores desejados (colunas), com o diferencial de manipular diferentes tamanhos - apenas para argumentos num�ricos ou l�gicos
iris.SemEspecie=iris[c(1:150),c(1:4)] # Transferindo as 4 colunas para uma nova matriz, sendo ignorada a �ltima - j� que por ser texto n�o funciona com "mapply"
iris.exercicio05=mapply(mean,iris.SemEspecie)
iris.exercicio05

# tapply: aplica fun��o (FUN) no vetor desejado (coluna) para sofre indexa��o, manipular apenas vetores de mesmo tamanho - pode incluir textos para indexa��o
iris.coluna1=iris[c(1:150),c(1:1)] # Transferindo a 1� coluna para um novo vetor
iris.Especie=iris[c(1:150),c(5:5)] # Transferindo a coluna das esp�ces para um novo vetor
iris.exercicio05=tapply(iris.coluna1,iris.Especie,mean)
iris.exercicio05


# Exerc�cio 06

# Exemplificando com o banco de dados "iris"
data(iris) # Para ler um conjunto de dados

# split: agrupa dois vetores por grupo de fatores - pode ser texto
iris.coluna1=iris[c(1:150),c(1:1)] # Transferindo a 1� coluna para um novo vetor
iris.Especie=iris[c(1:150),c(5:5)] # Transferindo a coluna das esp�ces para um novo vetor
iris.exercicio05=split(iris.coluna1,iris.Especie)
iris.exercicio05

# aggregate: agrupa e executa FUN (c�lculos) por grupo de fatores
iris.exercicio05=aggregate(iris[["Petal.Length"]],list(iris$Species),mean,na.rn=T)
iris.exercicio05

# Exerc�cio 07

ls() # Visualiza o que est� executando na �rea de trabalho
debug(ls) # Abre o console para depurar
ls()