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


#Elaine

C=50.00 #Preço da unidade da cadeira
dc=30.00 #Preço da unidade da cadeira com desconto
M=150.00 #Preço da unidade da mesa
dm=120.00 #Preço da unidade da mesa com desconto
B=10.00 #Preço da unidade do banco
db=8.00 #Preço da unidade do banco com desconto

qc=3 #Quantidade de cadeiras
qm=6 #Quantidade de mesas
qb=5 #Quantidade de bancos

op.1=(C*qc)
op.2=(dc*qc)
op.3=(M*qm)
op.4=(dm*qm)
op.5=(B*qb)
op.6=(db*qb)

ifelse(qc<=3,op.1,op.2)+ifelse(qm<=4,op.3,op.4)+ifelse(qb<=5,op.5,op.6)
