# ======================================================================

# CURSO: INTRODUCAO A PROGRAMACAO COM R.
# AVALIACAO: 04 E 05.
# URL: goo.gl/jfYqtN

# ======================================================================

# SEJA A BASE DE DADOS "specdata.zip" QUE PODE SER OBTIDA DIRETAMENTE
# EM "https://www.dropbox.com/s/irdf8oxjv30cbwy/specdata.zip?dl=0"

# 01) PESQUISE COMO CRIAR UMA PASTA NO SISTEMA DIRETAMENTE PELO R.
#     CRIE A PASTA NOMEADA DE "dados_avaliacao_04_05".

getwd()

dir.create("C:\\Users\\lfcvi\\Desktop\\dados_avaliacao_04_05")

setwd("C:\\Users\\lfcvi\\Desktop\\dados_avaliacao_04_05")


# 02) FACA O DOWNLOAD DIRETAMENTE PELO R PARA A PASTA CRIADA NOMEANDO
#     O ARQUIVO DESTINO PARA "specdata.zip".

fileUrl = "https://www.dropbox.com/s/irdf8oxjv30cbwy/specdata.zip?dl=1"
download.file(fileUrl, "specdata.zip")

# 03) PESQUISE O COMANDO DO R: "system".

args(system)
?system

# 04) PESQUISE COMO DESCOMPACTAR DIRETAMENTE POR LINHA DE COMANDO
#     EM TERMINAL E DESCOMPACTE O ARQUIVO DENTRO DA PASTA CRIADA,
#     NO ITEM 01.

Destino <- "C:\\Users\\lfcvi\\Desktop\\dados_avaliacao_04_05\\specdata.zip"

unzip(Destino)

# 05) CRIE UMA FUNCAO CHAMADA "dados.completos", COM OS ARGUMENTOS
#     NECESSARIOS, PARA QUE LEIA TODOS OS 332 ARQUIVOS DESCOMPACTADOS
#     E GERE APENAS UM OBJETO NA MEMORIA COM O CONTEUDO.

Destino2 <- "C:\\Users\\lfcvi\\Desktop\\dados_avaliacao_04_05\\specdata"
lista = list.files(Destino2, full.names = TRUE)

w = NULL
comp = NULL

dados.completos <- function(x)
  
  for (i in 1:length(x)){
    
    w = read.csv(x[1])
    comp = rbind(comp, w)  
    
    return(comp)
    
}

completo <- dados.completos(x = lista)
print(completo)

# 06) CRIE OUTRA FUNCAO CHAMADA "estatisticas" QUE CALCULE MEDIDAS DE
#     POSICAO CENTRAL (media, moda e mediana) E DISPERSAO DE DADOS
#     (variancia), RETORNANDO UMA TABELA DE DUAS COLUNAS, "sulfate" E
#     "nitrate", CONTENDO AS ESTATISTICAS OPERADAS.

getmode <- function(x) {
  
  dados=na.omit(x)	# para omitir os NA.
  uniqv <- unique(dados)
  uniqv[which.max(tabulate(match(dados, uniqv)))]
}

estatisticas <- function(completo){
  
  sulfato = c(mean(completo$sulfate, na.rm = T), median(completo$sulfate, na.rm = T), var(completo$sulfate, na.rm = T), getmode(completo$sulfate))
  nitrato = c(mean(completo$nitrate, na.rm = T), median(completo$nitrate, na.rm = T), var(completo$nitrate, na.rm = T), getmode(completo$nitrate))
  tabela <- matrix(c(c("Média", "Mediana", "Variância", "Moda"), sulfato, nitrato), 4, 3, byrow = FALSE)
  colnames(tabela) <- c("Item", "Sulfate", "Nitrate")

  return(tabela)
  
}

dados.finais <- estatisticas(completo)
print(dados.finais)

# 07) EXPORTE, PARA O SEU WORK DIRECTORY, A TABELA CRIADA NO ITEM 06
#     COMO UM ARQUIVO TXT SEPARADO POR TABULACOES E COM DECIMAL DO 
#     TIPO "VIRGULA".

dados.finais <- gsub(".", ",", dados.finais, fixed=TRUE)
write.table(dados.finais, file ="estatisticas.txt", sep = "\t", dec = "," , row.names = FALSE)

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
