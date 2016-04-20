# carregar o pacote XML
require(XML)

# ajustar a url de interesse
url = "http://www.atletx.com.br/vida-de-atleta/treinamento/tabela-gasto-calorico-por-atividade"

# criando um objeto com a organizacao do do documento
dados = htmlParse(url)

# vamos procurar aonde esta o no de interesse.
# estamos procurando o inicio da tabela "table"
dados

# agora que temos a informacao 100% correta, pegamos os nos das tabelas
tableNodes = getNodeSet(dados, "//table")

# que tipo de objeto foi criado?
class(tableNodes)
mode(tableNodes)

# vamos conferir o resultado
tableNodes

# note que temos duas tabelas table[[1]] e table[[2]]
# agora basta pegar o objeto do modo que desejamos
tabela1 = readHTMLTable(tableNodes[[1]])
tabela2 = readHTMLTable(tableNodes[[2]])
