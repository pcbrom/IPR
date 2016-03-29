# Parte 1 de 2

# Exercício 01

cat('Digite apenas um número inteiro:')
Numero=scan(what=integer(),n=1) # Pede o número inteiro

cat('Adivinhe o número? - apenas número inteiro')
Adivinha=scan(what=integer(),n=1) # Pede para adivinhar

while(Numero!=Adivinha) { # Entrar enquando não acertar

  if(Adivinha>Numero){ # Se for diferente, entrará e irá imprimir o indicativo, onde ao final coletará o novo "Adivina" - Informa que é MAIOR
  
    print(paste("Você indicou um número MAIOR. Tente outra vez!!!"))
    
  }else{ # Informa que é MENOR
  
    print(paste("Você indicou um número MENOR. Tente outra vez!!!"))
    
  }
  
  cat('Tente novamente - apenas número inteiro') # Por não ter adivinhado, solicita-se novo valor.
  Adivinha=scan(n=1) # Pede para adivinhar
  
}

print(paste("Parabéns, Você acertou. O número correto é:",Numero))

# Exercício 02

Populacao.A=50000000
q.A=1.04
Populacao.B=100000000
q.B=1.02
tempo=0 # Tempo em anos

while(Populacao.B>Populacao.A){# Enquanto a população B for maior esse loop funcionará

  tempo=tempo+1
  Populacao.A=Populacao.A*q.A
  Populacao.B=Populacao.B*q.B
  
}

print(paste("O tempo será de:",tempo,"anos")) # Imprime o calculo a partir do while

# Exercício 03

cat('Digite o n-esimo termo')
N=scan(what=integer(),n=1) # Pede o número inteiro
termo.1=1
termo.2=1

if(N<=0){# Verifica se é um valor inadequado

  print(paste("O termo deve ser maior ou igual a 1"))
  
}else if(N==1 || N==2){# Verifica se é o primeiro ou segundo termo

  termo=1
  
}else{ # Continua para o terceiro termo em diante

  cont=3 # Primeira possibilidade
  while(N>=cont){# Repete o somatoria ate o momento pretendido
  
    termo=termo.1+termo.2
    termo.1=termo.2
    termo.2=termo
    cont=cont+1
    
  }
  
}

print(paste("O n-esimo termo é:",termo,", estando ele na:",N,"posição."))

# Exercício 04

cat('Digite uma sequência de números. Para sair digite ZERO.')
x=vector() # Cria vetor vazio
i=0 # Inicia a posição 0
N=1 # Permite a entrada inicial no "while" e é o valor obtido no terminal

while(N!=0){ # Uma vez tendo entrado no "while" só sai se digitar ZERO para "N"

  N=scan(what=integer(),n=1) # Pede o número inteiro

  if(N==0){ # Sendo ZERO sai do "if"
  
    next
    
  }else{ # Não sendo ZERO indica a posição no vetor e aplica o termo digitado nele
  
    i=i+1
    x[i]=N
    
  }
  
}

Maior=x[1] # Assumimos que o primeiro termo do vetor x é o maior

for(w in x){ # Navegaremos no vetor x - sendo que w é o valor sequencial de cada termo do vetor

  if(Maior>=w){ # Verificando o valor que deve ser o maior do vetor
  
    Maior=Maior # Mantém o próprio valor
    
  }else{ # Aplica o valor maior caso "Maior" seja menor que "x[i]"
  
    Maior=w # Altera pelo maior naquele momento
    
  }
  
}

print(paste("Você digitou",length(x),"número(s) e o maior, entre ele(s) é:",Maior))

# A função "length(x)" conta quantos termos possuem o vetor "x".


# Exercício 05

cat('Digite um número inteiro.')
x=vector() # Cria vetor vazio
x[1]=0 # Primeira posição o vetor sempre será ZERO
i=1 # Inicia a posição 1 do vetor, que por sua vez vale ZERO
N=scan(what=integer(),n=1) # Pede o número inteiro

while(N!=x[i]){ # Uma vez tendo entrado no while só sai se x[i]=N

  i=(i+1) # Se entrou existe pelo menos um segundo termo, já que x[1]=0

  if(N<0){ # Verifica se o valor digitado é menor que ZERO, se for cada alteração de "i" implica em preenchimento de x[i] - até a validação inicial
  
    x[i]=(1-i)
    
  }else{ # Verifica se o valor digitado é maior que ZERO, se for cada alteração de "i" implica em preenchimento de x[i] - até a validação inicial
  
    x[i]=(i-1)
    
  } 

}

print(x) # Imprime o vetor de ZERO até o valor inserido

# Exercício 06

cat('Digite um número inteiro e maior que ZERO.')
x=vector() # Cria vetor vazio
N=scan(what=integer(),n=1) # Pede o número inteiro
fatorial=1

if(N<0){ # Retorna texto solicitando o reinício do programa
  
  print("O valor deve ser maior que ZERO - reinicie o programa")
  
}else if(N==0 || N==1){ # Retorna se for ZERO ou 1
  
  print(paste("O cálculo solicitado é:",N,"! =",fatorial)) # Retorna o fatorial para 0! e 1!
  
}else{ # Valida apenas a entrada interia e positiva 

  x[1]=0 # Primeira posição o vetor sempre será ZERO
  x[2]=1 # Primeira posição o vetor sempre será 1
  i=2 # Inicia a posição 1 do vetor, que por sua vez vale ZERO

  while(N!=x[i]){ # Uma vez tendo entrado no while só sai se x[i]=N

    i=(i+1) # Se entrou existe pelo menos um terceiro termo, já que x[1]=0 e x[2]=1
    x[i]=(i-1)
    fatorial= (fatorial * x[i])
    
  }

  print(paste("O cálculo solicitado é:",N,"! =",fatorial)) # Retorna o valor fatorial de N

}


# Exercício 07

# Exemplificando com o cálculo de 10!

# for: força o loop em repetidas vezes, ou seja, o loop começa em certo momento e termina em outro momento definido - todos indicados entre parênteses

fatorial=1 # Valor inicial de fatorial

for(x in 1:10){ # Entra no loop e navega no vetor 1:10, termo a termo
  
  fatorial=(fatorial*x)
  
}

print(fatorial) # Imprime o valor 10!

# repeat: força o loop infinito, ou seja, o loop começa e só termina se aparecer o "break" - as condições de verificação lógica devem estar dentro 

i=1 # Entra na posição 1
fatorial=1 # Valor inicial de fatorial

repeat{ # Entra no loop e navega até aparecer uma condição lógica para parar

  if(i>=10){# Condição lógica para "parar"
  
    break
    
  }else{ # Calcula o fatorial a partir de "i" e "fatorial"
  
    fatorial=(fatorial*i) # Calcula o fatorial
    i=i+1 # Aumenta 1 nível
    
  }
  
}

print(fatorial) # Imprime o valor 10!


# while: fica condicionada a uma questão lógica. Toda vez em que for verdadeiro entraremos para executar, caso o questionamento retorne falso não passará pelo while

i=1 # Entra na posição 1
fatorial=1 # Valor inicial de fatorial

while(i<=10){ # Entra e executa até o questionamento se manter verdadeiro

    fatorial=(fatorial*i) # Calcula o fatorial
    i=i+1 # Aumenta 1 nível
  
}

print(fatorial) # Imprime o valor 10!


