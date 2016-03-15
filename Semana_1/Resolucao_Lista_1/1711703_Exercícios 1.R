# 01_ A conversão de graus Farenheit para Centígrados é obtida 
#por C = 5 (F – 32) / 9. Faça um programa que leia uma temperatura em 
#graus Farenheit e imprima o valor dessa temperatura em graus Centígrados.

F=scan(n=1)
C=5*(F-32)/9
print(paste(C,"ºC",sep =" ")) 

#02_ Faça um programa para calcular a média ponderada das notas de três provas. 
#Os pesos são constantes iguais a 2.0, 2.5 e 3.0, para a primeira, 
#segunda e terceira prova respectivamente. 
#O usuário deve entrar com os valores das notas.

p1=2.0 ; p2=2.5 ; p3=3

n.1=8 ; n.2=7 ; n.3=7.5

n1=n.1*p1
n2=n.2*p2
n3=n.3*p3

nf=(n1+n2+n3)/(p1+p2+p3)

print(nf)

#03_ Faça um programa que entre com o valor da população de um país e de sua taxa
#de crescimento (em porcentagem) por ano. 
#O programa deve escrever o valor da população depois de 3 anos.

#montante=(capital*(1+taxa))


#Utilizar taxa em decimal

KP=10000
taxa=0.1
t=3

KF=(KP*(1+taxa)^t)
print(KF)

#UTILIZANDO CALCULO EXPONENCIAL
# montante=(capital*(exp(k*t))

KF=(KP*(exp(taxa*t)))
print(KF)

#04_ Faça um programa que leia 5 números reais e calcule a média desses números,
#usando apenas duas variáveis.

Q=c(1,2,3,4,5)
print(mean(Q))

#PARA DESCOBRIR O COMPRIMENTO DO VETOR: length(Q)


#05_ Faça um programa para ler dois valores reais e imprimir a sua soma,
#seu produto, a subtração do primeiro menos o segundo, 
#e a divisão do primeiro pelo segundo.

x5
x5=c(1,2)

print(sum(x5))


print(paste0("A soma é ",sum(x5),","," o produto é ",x5[1]*x5[2]," e a subtração do primeiro menos o segundo é ",x5[1]-x5[2])) 

#print(paste(C,"ºC",sep =" ")) 


#06_ Escreva um programa que leia o raio de uma circunferência e imprima o
#seu perímetro e a sua área. Todos os valores são reais.

r=5
p=2*3.14*r
a=3.14*r^2

print(p)
print(a)
