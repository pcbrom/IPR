# ======================================================================

# CURSO: INTRODU√á√ÉO √Ä PROGRAMA√á√ÉO COM R.
# AVALIA√á√ÉO: 02.
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
#   E deve ser salvo com a seguinte m√°scara:
#     avaliacao_[0-7]_[numero de matr√≠cula/SIAPE].R

# 2. Para formatar o numero de casas decimais use o comando round(x,d), 
#     onde 'x' √© o objeto e 'd' √© o numero de casas decimais desejado.
#     Exemplo:
#     - Entrada: round(sqrt(2), 3)
#     - Sa√≠da: 1.414

# ======================================================================

# Exemplo:

# Entradas: 5 2 6
# Saida: 2.00

# ======================================================================

# A RESOLU√á√ÉO DEVE SER FEITA ABAIXO DA LINHA 94.

# ======================================================================

x <- scan(n=5)

pl = 1500 #preÁo do laptop
pi = 1000 #preÁo do ipad

ql=x[1] #QUANTIDADE DE LAPTOP
qi=x[2] #QUANTIDADE DE IPAD
d =x[3]  #DIA DE PAGAMENTO
fp=x[4] #FORMA DE PAGAMENTO: 0 - A VISTA E 1 - A PRAZO
k =x[5] #DISTANCIA

v=(pl*ql+pi*qi) #VALOR SEM PROMOCAO

#v1=VALOR DA COMPRA DEPOIS DA PRIMEIRA PROMOCAO

v1=if(ql+qi>=3){
  
  v-500
  
}else{
  
  v
  
}

#v2= VALOR DEPOIS DA APLICACAO DA SEGUNDA PROMOCAO

  v2=if(fp==0){
    
    if(d>=1 && d<=15){
      
      v2=v1*0.9
      
    }else if(d>=16 && d<=31){
      
      v2=v1*0.95
      
    }else{
      
    }
    
  }else{
    
    if(d>=1 && d<=15){
      
      v2=v1*1.08
      
    }else{
      
      v2=v1*1.1
      
    }
    
  }

#V3=VALOR DEPOIS DO CALCULO DO FRETE

v3=if(k<=50){
  
  v3=v2+100
  
  
}else{
  
  
  v3=v2+200
  
}

if(d>=32){
  
  "Dia inexistente"

  }else{

  print(c("Valor da compra antes da aplicaÁ„o das promoÁıes"=v,
          "Valor depois da aplicaÁ„o da primeira promoÁ„o"=v1,
          "Valor depois da segunda promoÁ„o"=v2,
          "Valor depois do calculo do frete"=v3))
  
}

