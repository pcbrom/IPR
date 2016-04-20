<img align="left" img src="https://cloud.githubusercontent.com/assets/10408245/13290324/022a1f82-daf2-11e5-8179-00d828bf27a0.jpg" width="249px" height="147px" />

<p align="center">
###################################################################<br>
INSTITUTO FEDERAL DE EDUCAÇÃO, CIÊNCIA E TECNOLOGIA DE BRASÍLIA<br>
INTRODUÇÃO À PROGRAMAÇÃO COM R<br>
MATERIAL DE LEITURA - SEMANA_5<br>
###################################################################
</p>

<br>

**Objetivos do capítulo e Introdução**

Leitura e escrita de sistema de arquivamento consiste em importação de dados brutos e exportação de dados tratados "tidy data". Atualmente temos funções nativas do R que fazem a importação e exportação de diversos formatos de modo fácil. Em geral é útil para análise exploratória de dados, produção de relatórios e pesquisa passível de reprodução.


**Obtendo bases de dados**

Bases de dados podem ser raspadas diretamente da internet, conforme vimos na aula anterior, ou podemos verificar a sua disponibilidade. Por exemplo, se queremos dados sobre o portal tranparência, basta procurar diretamente em transparencia.gov.br/ Dados do censo: ces.ibge.gov.br/base-de-dados/metadados/ibge/censo-demografico.html ou qualquer outra base que seja de interesse, inclusive diretamente do Google Docs e Dropbox.

O grande ponto não é apenas aonde e como obter as bases de dados e sim como efetuar a leitura.

No caso do R o acesso e leitura é feito diretamente na memória ram do computador. Isso emplica em um problema que pode ocorrer. A base de dados não cabe na memória e precisará de uso de paginação no caso de Windows ou Swap em sistemas de núcleo Unix.

Vejamos alguns comandos mais simples:

**Definindo a pasta de trabalho**
> getwd() # Verifica a pasta de trabalho atual<br>
> setwd(...) # Define a pasta de trabalho.

**Baixando uma base de dados**
Vamos trabalhar com a base de dados dos Servidores Federais - Militares, obtidos diretamente do Portal da Transparência:
https://www.dropbox.com/s/tiwa53zcifv48qm/20150930_ObservacoesMilitares.csv?dl=1

**Localizando o arquivo**
> file.choose() # faz a busca do arquivo.

**Lendo a prévia do arquivo**
> readLines(..) # Efetua a leitura prévia de algumas linhas da base de dados para que seja avaliado o tipo de separador, se há rótulos de variáveis e outros atributos.

**Comando read.csv()**
> args(read.csv) <br>
> function (file, header = TRUE, sep = ",", quote = "\"", dec = ".", fill = TRUE, comment.char = "", ...)

Aqui temos alguns argumentos:
* file -> Indica o endereço do arquivo obtido com file.choose()
* header -> Se TRUE então será feita a leitura dos rótulos
* sep -> Forma que as entradas estão separadas, no caso é por vírgula
* dec -> Formato do sistema de numeração do arquivo para que seja considerado decimal ao caregar os dados

Argumentos adicionais:
* skip -> Indica quantas linhas deseja pular antes de iniciar o carregamento.
* skipNul -> Se TRUE indica que deve pular lihnas em branco.

Outros tipos de read nativos podem ser vistos com **read.** onde o RStudio abrirá uma lista de formatos, cada um com uma especificação.

Agora faça o teste de carregamento da base de dados baixada e peçam o seu View(...)

**Escrita**

Do mesmo modo que carregamos uma base de dados, também podemos escrever utilizando o comando **write.**, onde os argumentos seguem a mesma linha de interpretação de **read.**.

**Formatos "especiais"**

**Excel**

Podemos praticar o pacote **xlsx**

> args(read.xlsx)<br>
> function (file, sheetIndex, sheetName = NULL, rowIndex = NULL, startRow = NULL, endRow = NULL, colIndex = NULL, as.data.frame = TRUE, header = TRUE, colClasses = NA, keepFormulas = FALSE, encoding = "unknown", ...) 

Façam um teste para: https://www.dropbox.com/s/p6va0lxu9w9izmu/Aval1.xlsx?dl=1

**SPSS, Stata e SAS**

Utilize o pacote **haven**

**SAS**

Outras alternativas para sistema de arquivamento SAS são:
* sas7bdat -> SAS Database Reader (experimental)
* SAScii -> Import ASCII files directly into R using only a SAS input script
* SASxport -> Read and Write 'SAS' 'XPORT' Files

**XML**

Pacote recomendado: **xml** e para detalhes de uso recomendo o material explicativo: https://www.dropbox.com/s/dgjheh0f1mhm820/01_07_readingXML.pdf?dl=1

**JSON - Javascrip Object Notation**

Pacote recomendado: **jsonlite** e para detalhes de uso recomendo o material explicativo: https://www.dropbox.com/s/71wj0zpof18gqen/01_08_readingJSON.pdf?dl=1

**Google Docs**

Vamos carregar uma base de dados diretamente do Docs. Para tanto temos uma alternativa direta, o googlesheets, disponível no CRAN: https://cran.r-project.org/web/packages/available_packages_by_name.html ou podemos utilizar RCurl que é um pacote mais genérico para acesso de bases de dados por link e/ou acesso restrito por login e senha.

Seja o endereço: https://docs.google.com/spreadsheets/d/1kQtaGw9E1RgDIVUKvjwnhhEHmOBND0iObBcZBUj0uBA/pub?gid=2135646837&single=true&output=csv
> require(RCurl)<br>
> fileUrl = "https://docs.google.com/spreadsheets/d/1kQtaGw9E1RgDIVUKvjwnhhEHmOBND0iObBcZBUj0uBA/pub?gid=2135646837&single=true&output=csv"<br>
> fileCSV = getURL(fileUrl, .opts = list(ssl.verifypeer = FALSE))<br>
> dados = read.csv(textConnection(fileCSV), header = T, encoding = "UTF-8")

Mas como se obtém este link?
* Abra a planilha no docs.
* Clique em Arquivo.
* Clique em Publicar para web.
* Ajuste as opções para o formato de arquivo desejado e confirme a operação.

**Dropbox**

Podemos utilizar o pacote **repmis** e o comando:
> source_DropboxData("NOME_BD.csv", key = "CHAVE_DROPBOX")

Ou podemos fazer diretamente pela url. Todo endereço Dropbox tem o final **0** ou **1**. Se **0** então abrirá indiretamente e ocorre o erro no sistema. Portanto a solução é alterar para **1** e o download ocorrerá diretamente.

Por exemplo:
> https://www.dropbox.com/s/tiwa53zcifv48qm/20150930_ObservacoesMilitares.csv?dl=0 # final zero<br>
> https://www.dropbox.com/s/tiwa53zcifv48qm/20150930_ObservacoesMilitares.csv?dl=1 # final um

Logo usamos RCurl:
> require(RCurl)<br>
> fileUrl = "https://www.dropbox.com/s/tiwa53zcifv48qm/20150930_ObservacoesMilitares.csv?dl=1"<br>
> fileCSV = getURL(fileUrl, .opts = list(ssl.verifypeer = FALSE))<br>
> dados = read.csv(textConnection(fileCSV), header = T, encoding = "UTF-8")

Em geral, qualquer serviço de arquivamento em nuvem, se há a opção de download direto então podemos ler o arquivo pela url.

**Leitura e escrita em alto desempenho**

Pacote **feather** que deve ser instalado usanto o pacote **devtools**
> devtools::install_github("wesm/feather/R") # instalação do pacote<br>
> library(feather)<br>
> x <- runif(1e7)<br>
> x[sample(1e7, 1e6)] <- NA # 10% NAs<br>
> df <- as.data.frame(replicate(20, x)) # criando uma base de dados com aproximadamente 1.6GB<br>
> write_feather(df, 'test.feather') # gravando o arquivo

Para invocar um arquivo **.feather** utilize **read_feather**.

Se a base de dados for convencional, em csv temos o pacote **data.table** que também serve para bases de dados mais pesadas.

O **data.table** é exteenso em suas funcionalidades portanto recomendo a leitura do material adicional: https://www.dropbox.com/s/bzxd4nc0jp2cc37/01_09_dataTable.pdf?dl=1

**Grandes bases de dados**

Soluções mais utilizadas:

* Hadoop usando **HadoopStreaming** e **hive**
* SQL usando o pacote **sqldf** ou o **RSQLite**
* Mongo usando **mongolite**, **RMongo** e **rmongodb**

**Problemas de codificação de arquivo**

Em geral ao invocar a base de dados é adequado informar o tipo de codificação com **encoding = "UTF-8"** nos argumentos da função de leitura.

Em situações de erro na codificação persistentes podemos ajustar para o formato específico usando a função **iconv(..)**
> iconv(bd$variavel, from = "ISO-8859-1", to = "UTF-8") # por exemplo

Para exportar considera-se uma boa prática também informar o encoding adequado.

**Conclusão**

Neste tópico vimos como invocar e criar arquivos usando a linguagem R.

E os formatos trabalhados foram:
* read.csv
* Excel
* SPSS, Stata e SAS
* XML
* JSON - Javascrip Object Notation
* Google Docs
* Dropbox
* feather
* Hadoop usando *HadoopStreaming* e *hive*
* SQL usando o pacote *sqldf* ou o *RSQLite*
* Mongo usando *mongolite*, *RMongo* e *rmongodb*


.................................................................................................................................<br><br>
**Fontes consultadas:**
* Introduçao à Ciência da Computação, Universidade de Brasília.
    * Prof. Dr. Homero Luiz Piccolo;
* Computação em Estatística 1 e 2, Universidade de Brasília.
    * Profa. Dra. Juliana Betini Fachini;
    * Prof. Dr. Donald Matthew Pianto;
* R Programming, Data Science Specialization, Johns Hopkins University.
    * Prof. PhD. Roger Peng;
    * Prof. PhD. Jeff Leek;
    * Prof. PhD. Brian Caffo.
* Uso de Ponteiros, Wikipedia (abordagem informal)
