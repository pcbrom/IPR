#milton
pg = 500 #valor do pagamento
d = 2 #dia
if(d>=26 && d<=31) {pg = (4*pg/100)+pg}
if(d>=21 && d<=25) {pg = (2*pg/100)+pg}
if(d>=16 && d<=20) {pg = pg}
if(d>=11 && d<=15) {pg = pg - (2*pg/100)}
if(d>=6 && d<=10) {pg = pg - (4*pg/100)}
if(d>=1 && d<=5) {pg = pg - (6*pg/100)}
print(pg)
