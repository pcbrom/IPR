# ======================================================================

# CURSO: INTRODUÇÃO À PROGRAMAÇÃO COM R.
# AVALIAÇÃO: 03.
# URL: goo.gl/99RQKQ

# ======================================================================

# Faça um programa que leia uma sequencia de duplas de numeros inteiros do 
# teclado, inteiros entre -1000 a 1000, com os nomes A e N. A quantidade de 
# duplas da sequencia eh desconhecida, mas ela termina quando A for igual a -1. 
# A dupla que contem o -1  NÂO  faz parte da sequencia.

# O programa deve escrever a media (real) de todos os N multiplos de 6 que fazem 
# dupla com A par. Em seguida deve escrever o menor N que seja impar.

# Os valores na saida devem estar na ordem pedida pelo enunciado. Podem estar um
# em cada linha, ou na mesma linha, separados por um espaco. NAO limite o numero
# de casas decimais do numero real.

x = c(1,2)
A1= NULL
N1= NULL
N2= NULL
Nimp = 999
A = x[1]
N = x[2]

cat('Pressione uma sequ�ncia de duplas de n�meros inteiros do teclado, entre -1000 a 1000. Para parar, o primeiro n�mero da dupla deve ser -1')

while(A != -1 && N>=-1000 && N<=1000){
  
  x = scan(what = integer(), n=2)
  A = x[1]
  N = x[2]
  
  if(A != -1){
  A1 = append(A1, x[1])
  N1 = append(N1, x[2])
  
    if(N %% 6 == 0 && A %% 2 == 0){
      
      N2 = append(N2, x[2])
  
      }else if(N %% 2 != 0 && N < Nimp){
        
        Nimp=N 
    
      }
    
    }

  next
  
}

print(paste("A m�dia (real) de todos os N m�ltiplos de 6 que fazem dupla com A par �:",mean(N2)," e o menor N �mpar �: ", Nimp)) # Imprime o calculo a partir do while


# =============
# Observações:

# 1. O exemplo abaixo serve apenas para que o aluno verifique se entendeu 
# o enunciado.
# Para verificar o bom funcionamento do programa, o aluno deve testar o programa
# com varias sequencias diferentes. O Corretor Automatico utilizara sequencias
# diferentes 
# da sequencia do exemplo, na correcao do programa.

# =============
# Exemplo:

# Entrada:
# 1 1
# 2 6
# 3 5
# 4 -12
# 5 -1
# 6 3
# -1   0

# Saida:
# -3.000000 
# -1

# ======================================================================

#  Observacoes:
  
# 1. Seu programa a ser enviado para:
#     github.com/pcbrom/IPR/tree/master/Avaliacoes
#   E deve ser salvo com a seguinte máscara:
#     avaliacao_[0-7]_[numero de matrícula/SIAPE].R

# 2. Para formatar o numero de casas decimais use o comando round(x,d), 
#     onde 'x' é o objeto e 'd' é o numero de casas decimais desejado.
#     Exemplo:
#     - Entrada: round(sqrt(2), 3)
#     - Saída: 1.414

# ======================================================================

# A RESOLUÇÃO DEVE SER FEITA ABAIXO DA LINHA 67.

# ======================================================================


