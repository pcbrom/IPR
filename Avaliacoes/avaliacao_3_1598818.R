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
Avaliacao3<-function(A,N){ # Fun��o para resolver o problema
  
  A=NULL # Cria um objeto nulo
  N=NULL # Cria um objeto nulo
  x=NULL # Cria um objeto nulo
  NMedia=numeric(0) # Cria um objeto nulo
  NMenor=numeric(0) # Cria um objeto nulo
  
  cat('Para terminar esse preenchimento o valor de A tem que ser -1\n')
  cat('Indique o valor de A. Dever� ser um n�mero inteiro de entrada. Ele deve estar entre -1000 e 1000\n')
  A=scan(what=integer(),n=1) # Referente ao primeiro valor de A
  cat('Indique o valor de N. Dever� ser um n�mero inteiro de entrada. Ele deve estar entre -1000 e 1000\n')
  N=scan(what=integer(),n=1) # Referente ao primeiro valor de N

  if(A==-1){ # Valida��o para o primeiro A digitado ser -1
    return('voc� desistiu antes de come�ar')
  }
  
  while(A!=-1 && A>(-1000) && A<1000 && N>(-1000) && N<1000){ # Entra nas condi��es esperadas, se estiver fora j� sai direto. N�o pede um novo preenchimento
    
    if (A %% 2 == 0 && N %% 6 == 0) { # A � par e N � divis�vel por 6
	
	x=c(A,N) # Preenche o vetor x
      NMedia=rbind(NMedia,x) # Substitui em nova linha da matriz "NMedia"
      
    } else if (N %% 2 == 1){ # Verifica N �mpar
      
      x=N # Preenche com valor �mpar
	NMenor=rbind(NMenor,x) # Substitui em nova linha da matriz "NMenor"
      
    }
        
    cat('Para terminar esse preenchimento o valor de A tem que ser -1\n')
    cat('Indique o valor de A. Dever� ser um n�mero inteiro de entrada. Ele deve estar entre -1000 e 1000\n')
    A=scan(what=integer(),n=1) # Referente ao novo valor de A
    cat('Indique o valor de N. Dever� ser um n�mero inteiro de entrada. Ele deve estar entre -1000 e 1000\n')
    N=scan(what=integer(),n=1) # Referente ao novo valor de N
    
    }
  
	NMedia=mean(NMedia[,2]) # Determina a m�dia de N vinculado ao valor de A par
	NMenor=min(NMenor) # Determina o menor dos �mpares de N
	x=c(NMedia,NMenor) # Gera o vetor de rsultado
	return(x) # Retorna o resultado final como dois termos do vetor. O primeiro � a m�dia de N, vinculado com A par, e o segundo � o menor �mpar de N
  
}

Avaliacao3(scan(what=integer(),n=1),scan(what=integer(),n=1)) # Entrada da fun��o para resolver o problema