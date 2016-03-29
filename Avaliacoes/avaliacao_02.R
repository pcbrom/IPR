lap=1500 # valor do laptop
ipad=1000 # valor do ipad
qlap=scan(1) # entrar com a quantidade de laptop
qipad=scan(1) # entrar com a quantidade de ipad
fpag=scan(1) # entrar com a forma de pagamento
dpag=scan(1) # entrar com o dia do pagamento
frete=scan(1) # distancia do frete
print ("entre com a quantidade de laptops:",qlap)
print ("entre com a quantidade de ipads:",qipad)
print ("entre com a forma de pagamento 0 para pagamento a vista, 1 para pagamento a prazo:"fpag)
print ("entre com o dia do pagamento:",dpag)
if (qlap+qipad>=3){ #calculo do primeiro desconto
  Total=(qlap*lap)+(qipad*ipad)
  TotalDesc=Total-500
  if (fpag=0){ # pagamento a vista
    if(dpag>=1&&dpag<=15){
      TotalDesc=TotalDesc-(TotalDesc*0.1)
    else
      TotalDesc=TotalDesc-(TotalDesc*0.05)
    }
  else (fpag=1) # forma de pagamento a prazo
    if(dpag>=1&&dpag<=15){
      TotalDesc=TotalDesc+(TotalDesc*0.08)
      else
       TotalDesc=TotalDesc+(TotalDesc*0.1)
    }
  }
  if (frete>=50){ # calculo do frete
    TotalDesc=TotalDesc+100
    else{
      TotalDesc=TotalDesc+200
    }
  }  
}

