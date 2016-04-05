# Vamos acessar
url = "http://top10mais.org/top-10-maiores-bilheterias-de-cinema-de-cinema-da-historia/"

# Verifique a sua area de trabalho
getwd()

# Defina o endereço correto se necessário
setwd()

# Baixe a página: (se a proxi não permitir, salve do modo convencional)
download.file(url = url, "filmes.html")

# Invocar o arquivo
local = file.choose()
pagina = readLines(local, encoding = "UTF-8")

# Entradas de interesse
# titulos
# bilheteria
# producao
# classificacao

titulos = pagina[grep("list-title", pagina) + 1]
bilheteria = pagina[grep("Bilheteria: \\$", pagina)]
producao = pagina[grep("Produção: ", pagina)]
classificacao = pagina[grep("list-meta", pagina) + 1]

# limpando as variaveis

titulos = gsub("&nbsp;", "", titulos)
titulos = gsub("<h2>", "", titulos)
titulos = gsub("<.*", "", titulos)

bilheteria = gsub(".*Bilheteria: \\$", "", bilheteria)
bilheteria = gsub(" ", "", bilheteria)
bilheteria = gsub("\\.", "", bilheteria)
bilheteria = gsub(",", "", bilheteria)
bilheteria = gsub("<.*", "", bilheteria)

producao = gsub(".*Produção: ", "", producao)
producao = gsub("<.*", "", producao)

classificacao = gsub(".*list-number\">", "", classificacao)
classificacao = gsub("<.*", "", classificacao)

resposta = as.data.frame(cbind(classificacao, titulos, producao, bilheteria))

# CRIANDO UMA FUNÇÃO QUE CRIA A BASE DE DADOS

# Defina o endereço correto se necessário
setwd("/home/pcbrom/Downloads")

url = "http://top10mais.org/top-10-maiores-bilheterias-de-cinema-de-cinema-da-historia/"
nome = "filmes"

lista.filmes = function(url = url, nome = nome) {
  
  # Baixe a página: (se a proxi não permitir, salve do modo convencional)
  # download.file(url = url, "filmes.html")
  
  # Invocar o arquivo
  local = paste0(getwd(), "/", nome, ".html")
  pagina = readLines(local, encoding = "UTF-8")
  
  # Entradas de interesse
  # titulos
  # bilheteria
  # producao
  # classificacao
  
  titulos = pagina[grep("list-title", pagina) + 1]
  bilheteria = pagina[grep("Bilheteria: \\$", pagina)]
  producao = pagina[grep("Produção: ", pagina)]
  classificacao = pagina[grep("list-meta", pagina) + 1]
  
  # limpando as variaveis
  
  titulos = gsub("&nbsp;", "", titulos)
  titulos = gsub("<h2>", "", titulos)
  titulos = gsub("<.*", "", titulos)
  
  bilheteria = gsub(".*Bilheteria: \\$", "", bilheteria)
  bilheteria = gsub(" ", "", bilheteria)
  bilheteria = gsub("\\.", "", bilheteria)
  bilheteria = gsub(",", "", bilheteria)
  bilheteria = gsub("<.*", "", bilheteria)
  
  producao = gsub(".*Produção: ", "", producao)
  producao = gsub("<.*", "", producao)
  
  classificacao = gsub(".*list-number\">", "", classificacao)
  classificacao = gsub("<.*", "", classificacao)
  
  resposta = as.data.frame(cbind(classificacao, titulos, producao, bilheteria))
  resposta$bilheteria = as.character(resposta$bilheteria)
  resposta$bilheteria = as.numeric(resposta$bilheteria)
  
  return(resposta)
  
}

filmes = lista.filmes(url = url, nome = nome)
View(filmes)
