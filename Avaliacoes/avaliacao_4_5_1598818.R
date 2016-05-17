# ======================================================================

# CURSO: INTRODUCAO A PROGRAMACAO COM R.
# AVALIACAO: 04 E 05.
# URL: goo.gl/jfYqtN

# ======================================================================

# SEJA A BASE DE DADOS "specdata.zip" QUE PODE SER OBTIDA DIRETAMENTE
# EM "https://www.dropbox.com/s/irdf8oxjv30cbwy/specdata.zip?dl=0"

# 01) PESQUISE COMO CRIAR UMA PASTA NO SISTEMA DIRETAMENTE PELO R.
#     CRIE A PASTA NOMEADA DE "dados_avaliacao_04_05".
# 02) FACA O DOWNLOAD DIRETAMENTE PELO R PARA A PASTA CRIADA NOMEANDO
#     O ARQUIVO DESTINO PARA "specdata.zip".
# 03) PESQUISE O COMANDO DO R: "system".
# 04) PESQUISE COMO DESCOMPACTAR DIRETAMENTE POR LINHA DE COMANDO
#     EM TERMINAL E DESCOMPACTE O ARQUIVO DENTRO DA PASTA CRIADA,
#     NO ITEM 01.
# 05) CRIE UMA FUNCAO CHAMADA "dados.completos", COM OS ARGUMENTOS
#     NECESSARIOS, PARA QUE LEIA TODOS OS 332 ARQUIVOS DESCOMPACTADOS
#     E GERE APENAS UM OBJETO NA MEMORIA COM O CONTEUDO.
# 06) CRIE OUTRA FUNCAO CHAMADA "estatisticas" QUE CALCULE MEDIDAS DE
#     POSICAO CENTRAL (media, moda e mediana) E DISPERSAO DE DADOS
#     (variancia), RETORNANDO UMA TABELA DE DUAS COLUNAS, "sulfate" E
#     "nitrate", CONTENDO AS ESTATISTICAS OPERADAS.
# 07) EXPORTE, PARA O SEU WORK DIRECTORY, A TABELA CRIADA NO ITEM 06
#     COMO UM ARQUIVO TXT SEPARADO POR TABULACOES E COM DECIMAL DO 
#     TIPO "VIRGULA".

# DEVERA SER ENTREGUE SOMENTE NO DIA 17/05/16.

# ======================================================================

#  Observacoes:
  
# 1. Seu programa a ser enviado para:
#     github.com/pcbrom/IPR/tree/master/Avaliacoes
#   E deve ser salvo com a seguinte mascara:
#     avaliacao_[0-7]_[numero de matrÃ­cula/SIAPE].R

# ======================================================================

# A RESOLUCAO DEVE SER FEITA ABAIXO DA LINHA 44.

# ======================================================================

rm(list=ls(all=T)) # Limpa a área de trabalho.

# Criando a pasta.
pasta <- "F:\\dados_avaliacao_04_05" # Define o caminho que se pretende criar.
dir.create(pasta) # Cria a pasta de trabalho. Nesse caso, criamos no pendrive a pasta solicitada.
setwd(pasta) # Define o caminho para manusear a pasta. 
getwd() # Verifica a pasta de trabalho atual.

# Baixando diretamente.
URL <- "https://www.dropbox.com/s/irdf8oxjv30cbwy/specdata.zip?dl=1" # Direcionando o link para download.
arquivo <- "specdata.zip"
download.file(URL, arquivo) # Baixando o arquivo, com o nome desejado.

# Verificando as informações de sistema.
dir(pasta) # Verificando quais arquivos existem no diretório "pasta"
file.exists(arquivo) # Verificando se o "arquivo" existe.

# Descompactando
unzip("specdata.zip") # Descompactando dentro da "pasta".


# Navegando na pasta descompactada.
pasta.1 <- "F:\\dados_avaliacao_04_05\\specdata" # Define o caminho que se pretende criar.
setwd(pasta.1) # Define o caminho para manusear a pasta.1.
nome.arquivos <- dir(pasta.1) # Atribuíndo ao vetor "nome.arquivos" todos os arquivos existentes na pasta.
length(nome.arquivos) # Verifica a quantidade de arquivos na pasta, separados pelos nomes.

# Criando um objeto único.
dados.completos <- NULL # Criando dados.completos.
csv <- NULL # Criando um auxiliar.
for (i in 1:length(nome.arquivos)){ # Função para escrever todos os arquivos em um único.
csv <- read.csv(nome.arquivos[i], sep=",", encoding="UTF8")
dados.completos <- rbind(dados.completos, csv)
}

# Cálculos estatísticos.
estatisticas <- function(sulfate, nitrate){# cálculos estatísticos.

	## funções:
		moda<-function(x){ # função para moda.
			dados=na.omit(x)	# para omitir os NA.
			uniqv <- unique(dados) # remover os duplicados.
			uniqv[which.max(tabulate(match(dados, uniqv)))]
		}

		varianca<-function(x){ # função para variança.
			media=mean(x, na.rm=TRUE)
			dados=na.omit(x)	# para omitir os NA.
			disvquad=(dados-media)^2
			calculo=sum(disvquad)/(length(dados)-1)
			return(calculo)
		}
	## fim das funções.

	medias <- c(mean(sulfate, na.rm=TRUE), mean(nitrate, na.rm=TRUE))# determinação das médias
	modas <- c(moda(sulfate), moda(nitrate)) # determinação das modas
	medianas <- c(median(sulfate, na.rm=TRUE), median(nitrate, na.rm=TRUE)) # determinação das medianas
	variancas <- c(varianca(sulfate), varianca(nitrate)) # determinação das varianças

	tabela <- matrix(c(c("sulfate", "nitrate"), medias, modas, medianas, variancas), 5, 2, byrow = TRUE)

	return(tabela)
}
tabela <- estatisticas(dados.completos[,2],dados.completos[,3])

# Escrita
tabela <- gsub(".", ",", tabela, fixed=TRUE)
setwd(pasta) # Define o caminho para manusear a pasta.
write.table(tabela, file="Resolucao.txt", sep="\t", row.names=F, col.names=F, quote =F, append=F)
