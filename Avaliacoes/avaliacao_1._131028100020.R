# ======================================================================

# CURSO: INTRODUÃ‡ÃƒO Ã€ PROGRAMAÃ‡ÃƒO COM R.
# AVALIAÃ‡ÃƒO: 01.
# URL: goo.gl/Xsnujp

# ======================================================================

# PROBLEMA PROPOSTO:

# Esta Ã© a equacao de Torricelli V^2 = U^2 + 2 * a * D, 
# onde V Ã© a velocidade, U Ã© a velocidade inicial, a Ã© a aceleracao, 
# D a distÃ¢ncia percorrida, * significa multiplicaÃ§Ã£o e ^ signifca 
# elevado a.

# FaÃ§a um programa que leia os valores de U, a e D (nessa ordem) 
# e escreva o valor da variÃ¡vel resp = V - U, com 
# precisÃ£o de duas casas decimais. 

# ======================================================================

#  Observacoes:
  
# 1. Para calcular a raiz quadrada de um valor x, utilize a funcao sqrt(x).

# 2. Seu programa a ser enviado para:
#     github.com/pcbrom/IPR/tree/master/Avaliacoes
#   E deve ser salvo com a seguinte mÃ¡scara:
#     avaliacao_[0-7]_[numero de matrÃ­cula/SIAPE].R

# 3. Para formatar o numero de casas decimais use o comando round(x,d), 
#     onde 'x' Ã© o objeto e 'd' Ã© o numero de casas decimais desejado.
#     Exemplo:
#     - Entrada: round(sqrt(2), 3)
#     - SaÃ­da: 1.414

# ======================================================================

# Exemplo:

# Entradas: 5 2 6
# Saida: 2.00

# =====================================================================
# A RESOLUÃ‡ÃƒO DEVE SER FEITA ABAIXO DA LINHA 47.

# ======================================================================

u=5 # (01 ponto - problema: deveria ser letra maiúscula a entrada)
a=2 # (02 pontos)
d=6 # (01 ponto - problema: deveria ser letra maiúscula a entrada)
v=((u^2)+2*a*d) 
operacao.1=round(sqrt(v),2)
print(V)
k=((v^2)-2*a*d)
operacao.2=round(sqrt(k),2)
resp=round((v-k),2) # (02 pontos - Arredondamento ok, mas com objeto errado)


NÃO CONSEGUIR CHEGAR NA SAIDA OFICIAL DE 2.

# Nota final: 06 pontos.

