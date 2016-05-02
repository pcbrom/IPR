A = N = soma = contn = 0; menor = 1000; Nold = -1000

while (A != -1) {
  
  cat("Digite um valor inteiro A: \n"); A = scan(n = 1, what = integer())
  cat("Digite um valor inteiro N: \n"); N = scan(n = 1, what = integer())
 
  if (A%%2 == 0 && N%%6 == 0) {soma = soma + N; contn = contn + 1}
  if (N%%2 != 0 && N < menor) {menor = N}
  
  media = soma/contn
  
  if (A == -1) {print(c("Media de N" = media, "Menor N" = menor))}
  
}
