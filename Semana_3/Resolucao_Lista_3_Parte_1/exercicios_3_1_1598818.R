# Parte 1 de 2

# Exerc�cio 01

cat('Digite apenas um n�mero inteiro:')
Numero=scan(what=integer(),n=1) # Pede o n�mero inteiro

cat('Adivinhe o n�mero? - apenas n�mero inteiro')
Adivinha=scan(what=integer(),n=1) # Pede para adivinhar

while(Numero!=Adivinha) { # Entrar enquando n�o acertar

  if(Adivinha>Numero){ # Se for diferente, entrar� e ir� imprimir o indicativo, onde ao final coletar� o novo "Adivina" - Informa que � MAIOR
  
    print(paste("Voc� indicou um n�mero MAIOR. Tente outra vez!!!"))
    
  }else{ # Informa que � MENOR
  
    print(paste("Voc� indicou um n�mero MENOR. Tente outra vez!!!"))
    
  }
  
  cat('Tente novamente - apenas n�mero inteiro') # Por n�o ter adivinhado, solicita-se novo valor.
  Adivinha=scan(n=1) # Pede para adivinhar
  
}

print(paste("Parab�ns, Voc� acertou. O n�mero correto �:",Numero))

# Exerc�cio 02

Populacao.A=50000000
q.A=1.04
Populacao.B=100000000
q.B=1.02
tempo=0 # Tempo em anos

while(Populacao.B>Populacao.A){# Enquanto a popula��o B for maior esse loop funcionar�

  tempo=tempo+1
  Populacao.A=Populacao.A*q.A
  Populacao.B=Populacao.B*q.B
  
}

print(paste("O tempo ser� de:",tempo,"anos")) # Imprime o calculo a partir do while

# Exerc�cio 03

cat('Digite o n-esimo termo')
N=scan(what=integer(),n=1) # Pede o n�mero inteiro
termo.1=1
termo.2=1

if(N<=0){# Verifica se � um valor inadequado

  print(paste("O termo deve ser maior ou igual a 1"))
  
}else if(N==1 || N==2){# Verifica se � o primeiro ou segundo termo

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

print(paste("O n-esimo termo �:",termo,", estando ele na:",N,"posi��o."))

# Exerc�cio 04

cat('Digite uma sequ�ncia de n�meros. Para sair digite ZERO.')
x=vector() # Cria vetor vazio
i=0 # Inicia a posi��o 0
N=1 # Permite a entrada inicial no "while" e � o valor obtido no terminal

while(N!=0){ # Uma vez tendo entrado no "while" s� sai se digitar ZERO para "N"

  N=scan(what=integer(),n=1) # Pede o n�mero inteiro

  if(N==0){ # Sendo ZERO sai do "if"
  
    next
    
  }else{ # N�o sendo ZERO indica a posi��o no vetor e aplica o termo digitado nele
  
    i=i+1
    x[i]=N
    
  }
  
}

Maior=x[1] # Assumimos que o primeiro termo do vetor x � o maior

for(w in x){ # Navegaremos no vetor x - sendo que w � o valor sequencial de cada termo do vetor

  if(Maior>=w){ # Verificando o valor que deve ser o maior do vetor
  
    Maior=Maior # Mant�m o pr�prio valor
    
  }else{ # Aplica o valor maior caso "Maior" seja menor que "x[i]"
  
    Maior=w # Altera pelo maior naquele momento
    
  }
  
}

print(paste("Voc� digitou",length(x),"n�mero(s) e o maior, entre ele(s) �:",Maior))

# A fun��o "length(x)" conta quantos termos possuem o vetor "x".


# Exerc�cio 05

cat('Digite um n�mero inteiro.')
x=vector() # Cria vetor vazio
x[1]=0 # Primeira posi��o o vetor sempre ser� ZERO
i=1 # Inicia a posi��o 1 do vetor, que por sua vez vale ZERO
N=scan(what=integer(),n=1) # Pede o n�mero inteiro

while(N!=x[i]){ # Uma vez tendo entrado no while s� sai se x[i]=N

  i=(i+1) # Se entrou existe pelo menos um segundo termo, j� que x[1]=0

  if(N<0){ # Verifica se o valor digitado � menor que ZERO, se for cada altera��o de "i" implica em preenchimento de x[i] - at� a valida��o inicial
  
    x[i]=(1-i)
    
  }else{ # Verifica se o valor digitado � maior que ZERO, se for cada altera��o de "i" implica em preenchimento de x[i] - at� a valida��o inicial
  
    x[i]=(i-1)
    
  } 

}

print(x) # Imprime o vetor de ZERO at� o valor inserido

# Exerc�cio 06

cat('Digite um n�mero inteiro e maior que ZERO.')
x=vector() # Cria vetor vazio
N=scan(what=integer(),n=1) # Pede o n�mero inteiro
fatorial=1

if(N<0){ # Retorna texto solicitando o rein�cio do programa
  
  print("O valor deve ser maior que ZERO - reinicie o programa")
  
}else if(N==0 || N==1){ # Retorna se for ZERO ou 1
  
  print(paste("O c�lculo solicitado �:",N,"! =",fatorial)) # Retorna o fatorial para 0! e 1!
  
}else{ # Valida apenas a entrada interia e positiva 

  x[1]=0 # Primeira posi��o o vetor sempre ser� ZERO
  x[2]=1 # Primeira posi��o o vetor sempre ser� 1
  i=2 # Inicia a posi��o 1 do vetor, que por sua vez vale ZERO

  while(N!=x[i]){ # Uma vez tendo entrado no while s� sai se x[i]=N

    i=(i+1) # Se entrou existe pelo menos um terceiro termo, j� que x[1]=0 e x[2]=1
    x[i]=(i-1)
    fatorial= (fatorial * x[i])
    
  }

  print(paste("O c�lculo solicitado �:",N,"! =",fatorial)) # Retorna o valor fatorial de N

}


# Exerc�cio 07

# Exemplificando com o c�lculo de 10!

# for: for�a o loop em repetidas vezes, ou seja, o loop come�a em certo momento e termina em outro momento definido - todos indicados entre par�nteses

fatorial=1 # Valor inicial de fatorial

for(x in 1:10){ # Entra no loop e navega no vetor 1:10, termo a termo
  
  fatorial=(fatorial*x)
  
}

print(fatorial) # Imprime o valor 10!

# repeat: for�a o loop infinito, ou seja, o loop come�a e s� termina se aparecer o "break" - as condi��es de verifica��o l�gica devem estar dentro 

i=1 # Entra na posi��o 1
fatorial=1 # Valor inicial de fatorial

repeat{ # Entra no loop e navega at� aparecer uma condi��o l�gica para parar

  if(i>=10){# Condi��o l�gica para "parar"
  
    break
    
  }else{ # Calcula o fatorial a partir de "i" e "fatorial"
  
    fatorial=(fatorial*i) # Calcula o fatorial
    i=i+1 # Aumenta 1 n�vel
    
  }
  
}

print(fatorial) # Imprime o valor 10!


# while: fica condicionada a uma quest�o l�gica. Toda vez em que for verdadeiro entraremos para executar, caso o questionamento retorne falso n�o passar� pelo while

i=1 # Entra na posi��o 1
fatorial=1 # Valor inicial de fatorial

while(i<=10){ # Entra e executa at� o questionamento se manter verdadeiro

    fatorial=(fatorial*i) # Calcula o fatorial
    i=i+1 # Aumenta 1 n�vel
  
}

print(fatorial) # Imprime o valor 10!


