l=1500.00 #laptops
i=1000.00 #ipads

ul=2 #unidades laptops
ui=1 #unidades ipads
op.1=(ul*l+ui*i)

x=ifelse(ul+ui>=3,op.1-500.00,op.1) #quantidade

d=4 #dia

y=if(d>=1&&d<=15){
  x*0.90
}else if(d>=16&&d<=31){
  x*0.95
}else{
  "erro"
}

z=if(d>=1&&d<=15){
  x*1.008
}else if(d>=16&&d<=31){
  x*1.01
}else{
  "erro"
}

s=50#s=distancia percorrida

t=if(s>=50){
  y+100.00
}else{
  y+200.00
}

t2=if(s>=50){
  z+100.00
}else{
  z+200.00
}

print (c("Compra"=x,"Pagamento a vista"=y,"Pagamento a prazo"=z,"Frete a vista"=t, "Frete a prazo"=t2)) 




