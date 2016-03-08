# ======================================================================

# CURSO: INTRODUÇÃO À PROGRAMAÇÃO COM R.
# AVALIAÇÃO: 01.
# URL: goo.gl/Xsnujp

# ======================================================================

# PROBLEMA PROPOSTO:

# Esta é a equacao de Torricelli V^2 = U^2 + 2 * a * D, 
# onde V é a velocidade, U é a velocidade inicial, a é a aceleracao, 
# D a distância percorrida, * significa multiplicação e ^ signifca 
# elevado a.

# Faça um programa que leia os valores de U, a e D (nessa ordem) 
# e escreva o valor da variável resp = V - U, com 
# precisão de duas casas decimais. 

# ======================================================================

#  Observacoes:
  
# 1. Para calcular a raiz quadrada de um valor x, utilize a funcao sqrt(x).

# 2. Seu programa a ser enviado para:
#     github.com/pcbrom/IPR/tree/master/Avaliacoes
#   E deve ser salvo com a seguinte máscara:
#     avaliacao_[0-7]_[numero de matrícula/SIAPE].R

# 3. Para formatar o numero de casas decimais use o comando round(x,d), 
#     onde 'x' é o objeto e 'd' é o numero de casas decimais desejado.
#     Exemplo:
#     - Entrada: round(sqrt(2), 3)
#     - Saída: 1.414

# ======================================================================

# Exemplo:

# Entradas: 5 2 6
# Saida: 2.00

# ======================================================================

# A RESOLUÇÃO DEVE SER FEITA ABAIXO DA LINHA 47.

# ======================================================================
u=5
a=2
D=6
z=((u^2)+2*a*D)
operacao.1
print(z)
v=round(sqrt(z),2)
operacao.2
print(v)
resp=v-u
operacao.3
print(resp)



    


