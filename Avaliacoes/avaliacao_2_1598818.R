# ======================================================================

# CURSO: INTRODUÃ‡ÃƒO Ã€ PROGRAMAÃ‡ÃƒO COM R.
# AVALIAÃ‡ÃƒO: 02.
# URL: goo.gl/C6pfcb

# ======================================================================

# Uma loja de informatica esta promovendo a venda de 2 produtos:
# laptops a 1500 reais cada, e ipads a 1000 reais cada.

# A loja esta fazendo varias promocoes. A primeira delas e:
# 1) se o cliente comprar 3 ou mais unidades, entre laptops e ipads,
# a loja desconta 500 reais.

# A segunda e:
# 2) sobre o valor resultante depois da primeira promocao, a loja da um 
# desconto ou acrescimo que depende da forma de pagamento:

# Se o cliente pagar a vista:

# a) entre os dias 1 e 15, o desconto sera de 10%
# b) entre os dias 16 e 31, o desconto sera de 5%.

# Se o cliente pagar a prazo:

# a) entre os dias 1 e 15, o acrescimo sera de 8%
# b) entre os dias 16 e 31, o acrescimo sera de 10%.

# Sobre o valor resultante depois das promocoes, sera cobrado o frete, que 
# depende da distancia da entrega:

# a) se a distancia for menor ou igual a 50 km, o frete sera de 100 reais;
# b) se a distancia for maior que 50 km, o frete sera de 200 reais.

# Faca um programa que leia cinco numeros inteiros (nao precisa checar)
# pelo teclado, a respeito de uma compra, nessa ordem: a quantidade de 
# laptops, a quantidade de ipads, o dia do pagamento, um valor que 
# indica como sera efetuado o pagamento:
## 0 para pagamento a vista;
## 1 para pagamento a prazo;
# e a distancia para a entrega.

# O programa deve escrever na tela oa seguintes valores reais:

# a) valor da compra antes da aplicacao das promocoes;
# b) valor depois da aplicacao da primeira promocao;
# c) valor depois da segunda promocao;
# d) valor depois do calculo do frete.

# Os valores devem ser escritos nessa ordem, e podem estar um
# em cada linha, ou na mesma linha mas separados por ao menos um
# espaco em branco.

# Exemplo:

# Entradas:
# 2 4 17 1 200

# Saida:
# 7000.000000
# 6500.000000
# 7150.000000
# 7350.000000


# ======================================================================

#  Observacoes:

# 1. Seu programa a ser enviado para:
#     github.com/pcbrom/IPR/tree/master/Avaliacoes
#   E deve ser salvo com a seguinte mÃ¡scara:
#     avaliacao_[0-7]_[numero de matrÃ?cula/SIAPE].R

# 2. Para formatar o numero de casas decimais use o comando round(x,d), 
#     onde 'x' Ã© o objeto e 'd' Ã© o numero de casas decimais desejado.
#     Exemplo:
#     - Entrada: round(sqrt(2), 3)
#     - SaÃ?da: 1.414

# ======================================================================

# Exemplo:

# Entradas: 5 2 6
# Saida: 2.00

# ======================================================================

# A RESOLUÃ‡ÃƒO DEVE SER FEITA ABAIXO DA LINHA 94.

# ======================================================================


cat('Indique a quantidade de LAPTOPS que deseja comprar!')
laptop=scan(what=integer(),n=1) # Reflete a quantidade de laptops

cat('Indique a quantidade de IPADS que deseja comprar!')
ipad=scan(what=integer(),n=1) # Reflete a quantidade de laptops

compra.0=(laptop*1500+ipad*1000) # Valor sem descontos

if((laptop+ipad)>=3){ # Verifica a quantidade adquirida e dá desconto se for igual ou maior que 3 unidades
  fator=-500
}else{
  fator=0
}

compra.1=(laptop*1500+ipad*1000)+fator # Valor com desconto com base na quantidade de objetos comprados

cat('Indique o dia do pagamento')
dia=scan(what=integer(),n=1) # Indica o dia do pagamento

cat('Seu pagamento será à vista? - 0 para à vista ou 1 para à prazo')
forma.pagamento=scan(what=integer(),n=1) # Indica se é à vista ou à prazo

if(forma.pagamento==0){ # Para compra à vista
  if(dia>=1 && dia<=15){ # Entre os dias 1 e 15
    fator=0.90
  }else{ # Entre os dias 16 e 31 - não estamos validando o dia máximo
    fator=0.95
  }
  
}else{ # Para compra à prazo
  if(dia>=1 && dia<=15){ # Entre os dias 1 e 15
    fator=1.08
  }else{ # Entre os dias 16 e 31 - não estamos validando o dia máximo
    fator=1.10
  }
}

compra.2=compra.1*fator # Valor com base no dia do pagamento

cat('Nos informe sobre o frete. Qual será a distância percorrida? Em km...')
distancia=scan(what=integer(),n=1) # Indica a distância para o frete

if(distancia<=50){ # Distância menor ou igual a 50 km
  fator=100
}else{
  fator=200
}

compra.3=compra.2+fator # Valor com base no frete

print(c(compra.0,compra.1,compra.2,compra.3))