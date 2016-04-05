#milton
vc = 30 #valor de compra
vv = 0   #valor de venda
if(vc<10) {vv = vc+(70*vc/100)}
if(vc>=10 && vc<30) {vv= vc+(50*vc/100)}
if(vc>=30 && vc < 100) {vv = vc+(40*vc/100)}
if(vc>=100) {vv = vc+(30*vc/100)}
print(vv)

#FERNANDO

compra=35

venda=if(compra<10){
  
  print(compra*1.7)
  
  }else if(compra>=10 && compra<30){
   
    print(compra*1.5)
    
    }else if(compra>=30 && compra<100){
    
      print(compra*1.4)
      
      }else if(compra>=100){
        
        print(compra*1.3)

        }
