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

# GABARITO:

# A correcao usa como base 05 itens, cada um valendo 02 pontos.

# Definindo as variáveis de entrada:
U = 5 # Item 01 (02 pontos)
a = 2 # Item 02 (02 pontos)
D = 6 # Item 03 (02 pontos)

# Definindo o objeto de retorno:
resp = sqrt(U^2 + 2*a*D) - U # Item 04 (02 pontos)

# Arredondamento em duas casas decimais:
resp = round(resp, 2) # Item 05 (02 pontos)

# Imprimindo o seu valor no console (este não é necessário, de acordo com o enunciado)
print(resp)
