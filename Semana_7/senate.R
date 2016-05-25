###########################################################################
# REGISTROS DE INFORMACOES - NOCOES DE TRATAMENTO DE BASE DE DADOS
###########################################################################

# PROBLEMA:
# 
# Idade dos Senadores dos EUA.
# 
# Muita gente ficou animada com a eleição do Presidente Barack Obama por causa 
# da sua juventude em relação a outros presidentes. Existe uma relação 
# semelhante para os senadores dos EUA? 
# 
# O arquivo 'senate.txt' é separado por tabulações com as seguintes colunas 
# para cada senador do passado e presente: 'Name', o nome do senador; 'start' 
# o primeiro ano que serviu como senador; 'end', o último ano que serviu; 'State', 
# o estado que serviu; 'Party', o partido político dele; e 'Birthday', quando 
# nasceram. 
# 
# 1. Faça um gráfico da idade média dos senadores sobre tempo para todos os 
# anos de dados disponíveis. As variáveis 'start' e 'end' são da forma que 
# um senador é ativo num determinado ano se o ano em questão é maior ou 
# igual 'start' e menor ou igual 'end'. 
# 
# 2. Os senadores estão ficando mais novos com tempo?
# 
# Faça as correções da base de dados, se necessário


# limpar area de trabalho
rm(list=ls(all=T))

# definir area de trabalho
setwd("/home/pcbrom/Dropbox/Trabalho e Estudo/IFB/IPR - Introdução à Programação com R/Registros_de_Informacoes")

# avaliação da base de dados antes de invocar seus valores como tabelamento
#bd.local = file.choose()
db.local ="senate.txt"
db.raw = readLines(db.local)
head(db.raw, 30)
tail(db.raw, 30) # aparentemente está tudo ok, vamos chamar a base de dados.

# chamar a base de dados
dados = read.table(db.local, sep = "\t", header = T, quote="\"", blank.lines.skip = T)

# verificando se temos na ou nan
for (i in 1:ncol(dados)) {print(dados[is.na(dados[,i]), ])} # na
for (i in 1:ncol(dados)) {print(dados[is.nan(dados[,i]), ])} # nan
# caso houvessem na's ou nan's usariamos o comando complete.cases

# sem dados faltantes, entao podemos avancar

# qual é a str do banco de dados? ela está adequada?
str(dados)

# bday tem problemas
dados[,6] = as.character.Date(dados[,6])
dados[,6] = trimws(dados[,6], which = "right")
dados[136, 6] = gsub("September 17, 1818", "", dados[136, 6])

# alterando bday
dados[,6] = gsub(".*,", "", dados[,6])
dados[,6] = trimws(dados[,6], which = "left")
dados[,6] = as.integer(dados[,6])
mode(dados[,6]); class(dados[,6]) # ficou ok!

# avaliar se as outras entradas possuem problemas
for (i in 1:6) print(table(dados[,i])) # de 1:5

# avaliacao geral da base de dados
summary(dados)

# qual e a idade media dos senadores?

# a variavel bday dos senadores ate yr1 parece ser uma boa proxy
bday.yr1 = dados$yr1 - dados$bday

# a variavel bday dos senadores ate yr1 parece ser uma boa proxy
bday.yr2 = dados$yr2 - dados$bday

# calculando a idade media de mandato
id.m = (bday.yr1 + bday.yr2)/2

# anexar bday.yr1, bday.yr2 e id.m na base de dados
dados = cbind(dados, bday.yr1, bday.yr2, id.m)

# existe algum valor discrepante?
plot(dados$id.m)

# temos dados discrepantes que devem ser filtrados

outs = boxplot.stats(dados$id.m)
sort(outs$out)

# a idade minima para ser senador nos EUA e 30 anos
dados = subset(dados, dados$id.m >= 30)
outs = boxplot.stats(dados$id.m)
sort(outs$out)

# qual seria a idade maxima aceitavel? suponha 85 anos
dados = subset(dados, dados$id.m < 82.5)
outs = boxplot.stats(dados$id.m)
sort(outs$out)

# avaliacao visual
plot(dados$id.m) # parece tudo ok
hist(dados$id.m) # agora sim...

# calculando a media das idades por yr1
id.m.ano = aggregate(dados$id.m, by = list(dados$yr1), mean)

# avaliacao visual
plot(id.m.ano$Group.1, id.m.ano$x, main = "ano de entrada e idade media")
modelo = lm(id.m.ano$x ~ id.m.ano$Group.1, data = id.m.ano)
summary.lm(modelo)
mod.g2 = function(x) modelo$coefficients[1] + modelo$coefficients[2]*x
plot(id.m.ano$Group.1, id.m.ano$x, main = "ano de entrada e idade media")
par(new = T)
curve(mod.g2, axes = F, xlab = "", ylab = "", col = "red")

# calculando a media das idades por yr2
id.m.ano2 = aggregate(dados$id.m, by = list(dados$yr2), mean)

# avaliacao visual
plot(id.m.ano2$Group.1, id.m.ano2$x, main = "ano de termino e idade media")
modelo = lm(id.m.ano2$x ~ id.m.ano2$Group.1, data = id.m.ano2)
summary.lm(modelo)
mod.g2 = function(x) modelo$coefficients[1] + modelo$coefficients[2]*x
plot(id.m.ano2$Group.1, id.m.ano2$x, main = "ano de saida e idade media")
par(new = T)
curve(mod.g2, axes = F, xlab = "", ylab = "", col = "red")
