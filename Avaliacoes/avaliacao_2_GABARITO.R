cat("Digite a quantidade de laptops:\n")
qtlap = scan(n = 1)

cat("Digite a quantidade de ipads:\n")
qtipad = scan(n = 1)

cat("Digite o dia de pagamento:\n")
diapg = scan(n = 1)

cat("Digite a forma de pagamento: 0 para a vista e 1 para a prazo\n")
formapg = scan(n = 1)

cat("Digite a distancia em km\n")
dist = scan(n = 1)

# valor = valor sem promocao alguma
# valor1 = valor com a primeira promocao (quantidade >= 3) 
# valor2 = valor com a segunda promocao (dia do pagamento)
# valor3 = valor final com o frete

valor = 1500*qtlap + 1000*qtipad;
  
if (qtlap + qtipad >= 3) {
  
  valor1 = valor - 500
  
  if (formapg == 0) {
    
    if (diapg >= 1 && diapg <=15) {
      
        valor2 = 0.9*valor1
        
        if (dist > 0 && dist <= 50) {
          
            valor3 = valor2 + 100
            print(c("antes da promocao" = valor,
                    "depois da primeira promocao" = valor1, 
                    "depois da segunda promocao" = valor2,
                    "depois do calculo do frete" = valor3))
          
        } else if (dist > 50) {
          
            valor3 = valor2 + 200
            print(c("antes da promocao" = valor,
                    "depois da primeira promocao" = valor1, 
                    "depois da segunda promocao" = valor2,
                    "depois do calculo do frete" = valor3))
          
        } else {
          
            print("distancia nao valida")
            stop
          
        }
      
    } else if (diapg >= 16 && diapg <=31) {
      
        valor2 = 0.95*valor1
        
        if (dist > 0 && dist <= 50) {
          
            valor3 = valor2 + 100
            print(c("antes da promocao" = valor,
                    "depois da primeira promocao" = valor1, 
                    "depois da segunda promocao" = valor2,
                    "depois do calculo do frete" = valor3))
          
        } else if (dist > 50) {
          
            valor3 = valor2 + 200
            print(c("antes da promocao" = valor,
                    "depois da primeira promocao" = valor1, 
                    "depois da segunda promocao" = valor2,
                    "depois do calculo do frete" = valor3))
          
        } else {
          
          print("dia nao valido")
          stop
  
        }
        
    } else {
      
      print("quantidade nao valida")
      stop
      
    }
    
  } else if (formapg == 1) {
    
    if (diapg >= 1 && diapg <=15) {
      
      valor1 = valor2
      valor2 = 1.08*valor1
      
      if (dist > 0 && dist <= 50) {
        
        valor3 = valor2 + 100
        print(c("nao houve promocao" = valor,
                "depois da primeira promocao" = valor1, 
                "depois da segunda promocao" = valor2,
                "depois do calculo do frete" = valor3))
        
      } else if (dist > 50) {
        
        valor3 = valor2 + 200
        print(c("nao houve promocao" = valor,
                "depois da primeira promocao" = valor1, 
                "depois da segunda promocao" = valor2,
                "depois do calculo do frete" = valor3))
        
      } else {
        
        print("distancia nao valida")
        stop
        
      }
      
    } else if (diapg >= 16 && diapg <=31) {
      
      valor2 = 1.1*valor1
      
      if (dist >= 0 && dist <= 50) {
        
        valor3 = valor2 + 100
        print(c("nao houve promocao" = valor,
                "depois da primeira promocao" = valor1, 
                "depois da segunda promocao" = valor2,
                "depois do calculo do frete" = valor3))
        
      } else if (dist > 50) {
        
        valor3 = valor2 + 200
        print(c("nao houve promocao" = valor,
                "depois da primeira promocao" = valor1, 
                "depois da segunda promocao" = valor2,
                "depois do calculo do frete" = valor3))
        
      } else {
        
        print("distancia nao valida")
        stop
        
      }
      
    } else {
      
      print("dia nao valido")
      stop
      
    }
    
  } else {
    
    print("distancia nao valida")
    stop
    
  }
    
} else if (qtlap + qtipad >0 && qtlap + qtipad < 3) {
  
  if (formapg == 0) {
    
    if (diapg >= 1 && diapg <=15) {
      
      valor1 = valor
      valor2 = 0.9*valor1
      
      if (dist >= 0 && dist <= 50) {
        
        valor3 = valor2 + 100
        print(c("nao houve promocao" = valor,
                "depois da primeira promocao" = valor1, 
                "depois da segunda promocao" = valor2,
                "depois do calculo do frete" = valor3))
        
      } else if (dist > 50) {
        
        valor3 = valor2 + 200
        print(c("nao houve promocao" = valor,
                "depois da primeira promocao" = valor1, 
                "depois da segunda promocao" = valor2,
                "depois do calculo do frete" = valor3))
        
      } else {
        
        print("distancia nao valida")
        stop
        
      }
      
    } else if (diapg >= 16 && diapg <=31) {
      
      valor1 = valor
      valor2 = 0.95*valor1
      
      if (dist >= 0 && dist <= 50) {
        
        valor3 = valor2 + 100
        print(c("nao houve promocao" = valor,
                "depois da primeira promocao" = valor1, 
                "depois da segunda promocao" = valor2,
                "depois do calculo do frete" = valor3))
        
      } else if (dist > 50) {
        
        valor3 = valor2 + 200
        print(c("nao houve promocao" = valor,
                "depois da primeira promocao" = valor1, 
                "depois da segunda promocao" = valor2,
                "depois do calculo do frete" = valor3))
        
      } else {
        
        print("distancia nao valida")
        stop
        
      }
      
    } else {
      
      print("dia nao valido")
      stop
      
    }
    
  } else if (formapg == 1) {
    
    if (diapg >= 1 && diapg <=15) {
      
      valor1 = valor
      valor2 = 1.08*valor1
      
      if (dist >= 0 && dist <= 50) {
        
        valor3 = valor2 + 100
        print(c("nao houve promocao" = valor,
                "depois da primeira promocao" = valor1, 
                "depois da segunda promocao" = valor2,
                "depois do calculo do frete" = valor3))
        
      } else if (dist > 50) {
        
        valor3 = valor2 + 200
        print(c("nao houve promocao" = valor,
                "depois da primeira promocao" = valor1, 
                "depois da segunda promocao" = valor2,
                "depois do calculo do frete" = valor3))
        
      } else {
        
        print("distancia nao valida")
        stop
        
      }
      
    } else if (diapg >= 16 && diapg <=31) {
      
      valor1 = valor
      valor2 = 1.1*valor1
      
      if (dist >= 0 && dist <= 50) {
        
        valor3 = valor2 + 100
        print(c("nao houve promocao" = valor,
                "depois da primeira promocao" = valor1, 
                "depois da segunda promocao" = valor2,
                "depois do calculo do frete" = valor3))
        
      } else if (dist > 50) {
        
        valor3 = valor2 + 200
        print(c("nao houve promocao" = valor,
                "depois da primeira promocao" = valor1, 
                "depois da segunda promocao" = valor2,
                "depois do calculo do frete" = valor3))
        
      } else {
        
        print("distancia nao valida")
        stop
        
      }
      
    } else {
      
      print("dia nao valido")
      stop
      
    }
    
  } else {
    
    print("quantidade nao valida")
    stop
    
  }
  
} else {
  
  print("quantidade nao valida")
  stop
  
}
