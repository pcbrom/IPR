getwd()
setwd()

# carregando o pacote
require(data.table)

# criando uma matriz 10000 x 10000
M = matrix(1, nrow = 10000, ncol = 10000)
# convertendo M para um data.frame
DF = as.data.frame(M)
# convertendo M para um data.table
DT = as.data.table(M)

# usando loop em condicoes convencionais

# loop com o DF
system.time(
  for (i in 1:10000) {
    DF[i, i] = 0
  }
)

# loop com o DT
system.time(
  for (i in 1:10000) {
    DT[i, i:= 0, with = F]
  }
)

# loop com M
system.time(
  for (i in 1:10000) {
    M[i, i] = 0
  }
)

# usando loop com o comando set()

args(set)
?set

# loop com o DF
system.time(
  for (i in 1:10000) {
    set(DF, i, i, 0)
  }
)

# loop com o DT
system.time(
  for (i in 1:10000) {
    set(DT, i, i, 0)
  }
)

# loop com M, usando o comando set() nao e possivel por ser matriz
