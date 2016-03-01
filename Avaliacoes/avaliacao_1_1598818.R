Conversão.Graus<-function(F) {
C=5*(F-32)/9
return(C)
}

Média.Ponderada<-function(N1,N2,N3){
return((2.0*N1+2.5*N2+3.0*N3)/(2.0+2.5+3.0))
}

Crescimento.Populacional<-function(ValorPopulacao,TaxaCrescimento){
return((TaxaCrescimento/100+1)^3*ValorPopulacao)
}

Média.2Variáveis<-function(numero1,numero2,numero3,numero4,numero5){
número<-c(numero1,numero2,numero3,numero4,numero5)
média=sum(número)/5
return(média)
}

Dois.Valores<-function(x1,x2){
calculo1<-(x1+x2)
calculo2<-(x1*x2)
calculo3<-(x1-x2)
calculo4<-(x1/x2)
calculo<-c(calculo1,calculo2,calculo3,calculo4)
return(calculo)
}

Circunferência<-function(raio){
Perímetro<-2*pi*raio
Área<-pi*raio^2
tela<-c(Perímetro,Área)
return(tela)
}


Conversão.Graus(10)
Média.Ponderada(7,6,8)
Crescimento.Populacional(100,2)
Média.2Variáveis(1,2,3,4,5)
Dois.Valores(5,2)
Circunferência(5)