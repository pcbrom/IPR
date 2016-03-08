resp.1<-function(U,a,D){
  U<-U #entrada de velocidade inicial
  a<-a #entrada de aceleracao
  D<-D #entrada de distancia percorrida
  V = sqrt(U^2 + 2 * a * D) #calculo da equacao de Torricelli
  print(paste("O valor da velocidade inicial e: ",U))
  print(paste("O valor da aceleracao e:",a))
  print(paste("O valor da distancia percorrida e:",D))
  
  return(V - U)
}
resp=resp.1(5,2,6)
print(paste("O valor da variavel resp e:",round(resp,2)))