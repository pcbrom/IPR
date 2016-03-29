# Exercício 01

TotalLocacao=function(Tipo,Quantidade){ # função para determinar o tipo e quantidade de DVD`s locados
  if(Tipo == 1){ #converte a entrada do tipo em texto
    Tipo=5
    print(paste("Você optou pelo DVD clássico"))
  }else if(Tipo == 2){
    Tipo=7
    print(paste("Você optou pelo DVD regular"))
  }else if(Tipo == 3){
    Tipo=10
    print(paste("Você optou pelo DVD lançamento"))
  }else{
    print(paste("Você não utilizou um argumento válido"))
  }
  
  print(paste("Você locou ",Quantidade," DVD`s")) #expressa a quantidade selecionada
    
  return(Tipo*Quantidade) #retorna o valor total da locação
}

Locacao=TotalLocacao(scan(n=1),scan(n=1)) #converte em variável

print(paste("O valor total da locação é: R$",Locacao)) #retorna texto com a solução do problema

# Exercício 02

Pagamento=function(Dia,Produto){ # função para determinar o dia e o valor do produto adquirido
  if(Dia > 0 && Dia < 10){ #converte a entrada do dia no desconto
    Dia=0.80
    print(paste("Você receberá um desconto de 20%"))
  }else if(Dia >= 10 && Dia <= 31){
    Dia=1.00
    print(paste("Você não receberá desconto"))
  }else{
    print(paste("Dia inválido"))
  }
  
  print(paste("O valor do produto é: R$",Produto)) #expressa a quantidade selecionada
    
  return(Dia*Produto) #retorna o valor total do pagamento
}

ValorPago=Pagamento(scan(n=1),scan(n=1)) #converte em variável

print(paste("O valor a ser pago é: R$",ValorPago)) #retorna texto com a solução do problema

# Exercício 03

Caractere=1

if(is.numeric(Caractere)){ # avalia se é algarismo
  print(paste("O caracter é algarismo"))
}else if( is.character(Caractere) && ( Caractere=="a" || Caractere=="e" || Caractere=="i" || Caractere=="o" || Caractere=="u" || Caractere=="A" || Caractere=="E" || Caractere=="I" || Caractere=="O" || Caractere=="U")){ # avalia se é vogal 
  print(paste("O caracter é vogal"))
}else{ # retorna valor diferente de algarismo e vogal
  print(paste("O caracter é outro qualquer"))
}

# Exercício 04

Compra=function(Cadeiras,Mesas,Bancos){ # função para determinar a quantidade de objetos adquiridos

# Aquisição das Cadeiras
  if(Cadeiras<=3){
    quant.1=50
  }else{
    quant.1=30
  }

# Aquisição das Mesas
  if(Mesas<=4){
    quant.2=150
  }else{
    quant.2=120
  }
  
# Aquisição das Bancos
  if(Bancos<=5){
    quant.3=10
  }else{
    quant.3=8
  }
  
  print(paste("Você solicitou",Cadeiras,"cadeira(s),",Mesas,"mesa(s) e",Bancos,"banco(s).")) # retorna texto com os móveis solicitados
  return(quant.1*Cadeiras+quant.2*Mesas+quant.3*Bancos) #retorna o valor total do pagamento
}

ValorPago=Compra(scan(n=1),scan(n=1),scan(n=1)) #converte em variável

print(paste("O valor a ser pago é: R$",ValorPago)) #retorna texto com a solução do problema


# Exercício 05

# Não disponível na lista

# Exercício 06

Pagamento=function(Dia,Produto){ # função para determinar o dia e o valor do produto adquirido
  if(Dia >= 1 && Dia < 6){ # converte a entrada do dia no desconto - entre os dias 1 e 5 do mês
    Dia=0.94
    print(paste("Você receberá um desconto de 6%"))
  }else if(Dia >= 6 && Dia < 11){ # converte a entrada do dia no desconto - entre os dias 6 e 10 do mês
    Dia=0.96
    print(paste("Você receberá um desconto de 4%"))   
  }else if(Dia >= 11 && Dia < 16){ # converte a entrada do dia no desconto - entre os dias 11 e 15 do mês
    Dia=0.98
    print(paste("Você receberá um desconto de 2%"))   
  }else if(Dia >= 16 && Dia < 21){ # converte a entrada do dia no desconto - entre os dias 16 e 21 do mês
    Dia=1
    print(paste("Você não receberá desconto"))   
  }else if(Dia >= 21 && Dia < 26){ # converte a entrada do dia no acréssimo - entre os dias 21 e 25 do mês
    Dia=1.02
    print(paste("Você receberá um aumento de 2%"))   
  }else if(Dia >= 26 && Dia <= 31){ # converte a entrada do dia no acréssimo - entre os dias 26 e 31 do mês
    Dia=1.04
    print(paste("Você receberá um aumento de 4%"))   
  }else{
    print(paste("Dia inválido"))
  }
  
  print(paste("O valor do produto é: R$",Produto)) # expressa a quantidade selecionada
    
  return(Dia*Produto) #retorna o valor total do pagamento
}

ValorPago=Pagamento(scan(n=1),scan(n=1)) #converte em variável

print(paste("O valor a ser pago é: R$",ValorPago)) #retorna texto com a solução do problema

# Exercício 07

Compra=scan(n=1)
print(paste("O valor de compra da mercadoria é R$",Compra)) # expressa o valor de compra da mercadoria

if(Compra<10){
  Lucro=1.70
}else if(Compra>=10 && Compra<30){
  Lucro=1.50
}else if(Compra>=30 && Compra<100){
  Lucro=1.40
}else {
  Lucro=1.30
}

Venda=Compra*Lucro # calcula o valor de venda

print(paste("Já o valor de venda dessa mercadoria é R$",Venda)) # expressa o valor de venda da mercadoria

# Exercício 08

print(paste("Indique sua altura, em metros"))
altura=scan(n=1) # Obtem a altura, em metros, da pessoa
print(paste("Você mede:",altura,"metros"))

print(paste("Indique seu sexo: (M) para masculino ou (F) para feminino")) # Obtem o sexo da pessoa
Sexo=readLines(n=1)
if(Sexo=="M"){ # Apenas para imprimir o sexo selecionado
  print(paste("O sexo selecionado é o MASCULINO"))
}else if(Sexo=="F"){
  print(paste("O sexo selecionado é o FEMININO"))
}else{
  print(paste("Para o programa funcionar, deverá apenas ser indicado: (M) para masculino ou (F) para feminino. Reinicie o programa e tente novamente."))
}
if(Sexo=="M"){ # Efetuar o cálculo de peso ideal
  PesoIdeal=(72.7*altura)-58
}else if(Sexo=="F"){
  PesoIdeal=(62.1*altura)-44.7
}else{
  print(paste("Reinicie o programa e tente novamente."))
}
  print(paste("O peso ideal é:",PesoIdeal))

# Exercício 09

Valores=scan(n=4) # entrada dos 4 valores
  print(paste("O menor e maior valor, respectivamente, são:"))
  print(range(Valores)) # gera automatizado o valor menor e maior da série
