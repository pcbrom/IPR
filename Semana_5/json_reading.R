# enderecamento para download
setwd("/home/pcbrom/Downloads")

# download do arquivo
Url = "www.dropbox.com/s/ldnvzlfeswqs5ci/primer-dataset.json?dl=1"
download.file(Url, "restaurantes.json")

# carregar o pacote JSON
require(jsonlite)

# pegar o arquivo
rest.loc = file.choose()

# criando um objeto com a organizacao do do documento
dados = readLines(rest.loc)

# vendo a organizacao dos dados
head(dados, 3)

# convertendo de JSON para um data.frame
dados = stream_in(file(rest.loc))

# visualizando o resultado
View(dados)
