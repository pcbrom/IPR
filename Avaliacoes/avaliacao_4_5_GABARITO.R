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

# limpar area de trabalho

rm(list=ls(all=T))

# criar pasta de trabalho

dir.create("/home/pcbrom/Downloads/dados_avaliacao_04_05")

# definir area de trabalho

setwd("/home/pcbrom/Downloads/dados_avaliacao_04_05")

# baixar o arquivo

url.file = "https://www.dropbox.com/s/irdf8oxjv30cbwy/specdata.zip?dl=1"
download.file(url.file, "specdata.zip")

# descomparctar o arquivo

unzip("specdata.zip") # por comando interno do R
system("unzip file.zip -d destination_folder") # por terminal em Linux
system("meu_descompactador.exe x file.zip") # por CMD em windows

# funcao "dados.completos" para ler os arquivos

dados.completos = function(local.file) {
  
    db.final = NULL
    arquivos = list.files(local.file)
    
    for (i in 1:length(arquivos)) {
      
        db.tmp = read.csv(paste0("specdata/", arquivos[i]), 
                          blank.lines.skip = T, quote = '\\')
        db.final = rbind(db.final, db.tmp)
      
    }
    
    return(db.final)
  
}

db = dados.completos(local.file = "specdata")

# estatisticas
estatisticas = function(db) {
  
    # media
    media = apply(db, 2, mean, na.rm = T)
    
    # funcao para calcular moda
    moda.f = function(x) {
        u = unique(x); u = u[!is.na(u)]; u[which.max(tabulate(match(x, u)))]
    }
    # moda
    moda = apply(db, 2, moda.f)
    
    # mediana
    mediana = apply(db, 2, median, na.rm = T)
  
    # variancia
    variancia = apply(db, 2, var, na.rm = T)
    
    # tabulacao dos dados
    tab = rbind(media, moda, mediana, variancia)
    
    # ajustando os nomes dos rotulos
    colnames(tab) = c("sulfate", "nitrate")
  
    return(tab)
    
}

# chamando a funcao estatisticas
db.tab = estatisticas(db = db[,c(2,3)])

# gravando o arquivo no formato solicitado
write.table(db.tab, "dados_tabulados.txt", sep = "\t", dec = ",")
