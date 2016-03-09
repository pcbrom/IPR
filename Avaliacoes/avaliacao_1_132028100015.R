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
u=5 # (01 ponto - problema: deveria ser letra maiúscula)
d=6 # (01 ponto - problema: deveria ser letra maiúscula)
a=2 # (01 ponto - problema: fora da ordem solicitada)
v=(round(sqrt((u^2)+2*a*d),2)) # (02 pontos - arredondamento ok, mas deveria ser feito apenas no final)
resp=v-u # (02 pontos)
print(resp)

# ======================================================================

# Nota final: 07 pontos.
