#milton
qc = 4  #quantidade de cadeiras
qm = 2   #quantidade de mesas
qb =  7   #quantidade de bancos
c = 50 #cadeiras
if ( qc > 3){ c = 30}
m = 150 #mesas
if (qm > 4) {m = 120}
b = 10   #bancos
if (qb > 5) {b = 8}
resp = (qc*c) + (qm*m) + (qb*b)
print(resp)
