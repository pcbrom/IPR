resp.1<-function(U,a,D){
  U<-U #entrada de velocidade inicial # (02 pontos)
  a<-a #entrada de aceleracao # (02 pontos)
  D<-D #entrada de distancia percorrida # (02 pontos)
  V = sqrt(U^2 + 2 * a * D) #calculo da equacao de Torricelli
  print(paste("O valor da velocidade inicial e: ",U))
  print(paste("O valor da aceleracao e:",a))
  print(paste("O valor da distancia percorrida e:",D))
  
  return(V - U)
}
resp=resp.1(5,2,6) # (02 pontos)
print(paste("O valor da variavel resp e:",round(resp,2))) # (02 pontos)

# Observação: O arredondamento poderia ter sido realizado direto dentro da função.

# Nota final: 10 pontos.
