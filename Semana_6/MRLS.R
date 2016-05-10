# REGRESSAO LINEAR SIMPLES USANDO NOTACAO MATRICIAL

# limpar area de trabalho
rm(list=ls(all=T))

# elementos do problema
cid =	seq(1:19)
massa	= c(62.0,62.9,36.1,54.6,48.5,42.0,47.4,
          50.6,42.0,48.7,40.3,33.1,51.9,42.4,
          34.5,51.1,41.2,51.9,46.9)
taxa = c(1792,1666,995,1425,1396,1418,1362,1502,
         1256,1614,1189,913,1460,1124,1052,1347,
         1204,1867,1439)

# definindo as matrizes Y e X
Y = as.matrix(taxa); rownames(Y) = NULL; colnames(Y) = NULL
X = as.matrix(cbind(rep(1,19),massa)); rownames(X) = NULL; colnames(X) = NULL

# Y'Y
Yl.Y = t(Y)%*%Y
Yl.Y # note que e o mesmo valor de sum(Y^2)
sum(Y^2)

# Y'X
Yl.X = t(Y)%*%X
Yl.X # note que col1 = sum(Y)
sum(Y)

# X'X
Xl.X = t(X)%*%X
Xl.X

# Bhat = (X'X)^(-1)*(X'Y)
Bhat = solve(Xl.X)%*%t(X)%*%Y
Bhat

# Yhat = XBhat
Yhat = X%*%Bhat
Yhat

# erro = Y - XB.hat
erro = Y - X%*%Bhat
erro

# SSE = Y'Y - Bhat'X'Y
SSE = Yl.Y - t(Bhat)%*%t(X)%*%Y
SSE

# S2hat = SSE/(n-2) = MSE
S2hat = MSE = SSE/(dim(X)[1]-2)
S2hat

# E.Bhat = Bhat
E.Bhat = Bhat
E.Bhat

# V.Bhat = S2.Bhat = MSE*(X.X')^(-1)
V.Bhat = S2.Bhat = MSE[1]*solve(t(X)%*%X)
S2.Bhat

# IC.Bi = Bhati -+ t(1-alpha/2)*sqrt(S2.Bhati)
# Funcao para intervalo de confianca dos coeficientes
IC.Bi = function(i = i, alpha = alpha) {
  df.t = dim(X)[1]-1
  inf = Bhat[i] - dt(1-alpha/2, df.t)*sqrt(S2.Bhat[i,i])
  sup = Bhat[i] + dt(1-alpha/2, df.t)*sqrt(S2.Bhat[i,i])
  Bhat.i = Bhat[i]; resp = cbind(inf,Bhat.i,sup)
  return(resp)
}
# Chamar o intervalo de confianca para o coeficiente
IC.Bi(1,0.05)
# Chamar o intervalo de confianca para todos os coeficientes
ICs = NULL; for (i in 1:dim(Bhat)[1]) {ICs = rbind(ICs, IC.Bi(i,0.05))}; print(ICs)

# IC.S2 = SSE/Qui2_(1-alpha/2) a SSE/Qui2_(alpha/2)
# Funcao para intervalo de confianca de S2
IC.S2 = function(alpha = alpha) {
  df.qui = dim(X)[1]-1
  inf = SSE/dchisq(1-alpha/2, df.qui)
  sup = SSE/dchisq(alpha/2, df.qui)
  resp = c("inf" = inf,"S2hat" = S2hat,"sup" = sup); return(resp)
}
# Chamar o intervalo de confianca para S2
IC.S2(0.05)

# SSTO = SSE + SSR
# SSTO = Y'(I - (1/n)*J)Y
# M = (I - (1/n)*J)
M = diag(dim(Y)[1]) - (1/dim(Y)[1])*(matrix(rep(1,dim(Y)[1]*dim(Y)[1]),dim(Y)[1],dim(Y)[1]))
SSTO = t(Y)%*%M%*%Y
SSTO

# SSR = SSTO - SSE
SSR = SSTO - SSE
SSR

# MSR = SSR/1
MSR = SSR/1
MSR

# MSE = SSE/(n-2)
MSE = SSE/(dim(Y)[1]-2)
MSE

# Teste de ausencia de regressao
# est.F = MSE/MSE
est.F = MSR/MSE
est.F
pvalor.est.F = 1-pf(est.F, 1, (dim(Y)[1]-2))
pvalor.est.F


# USANDO FUNCOES DO R

# carregar os pacotes necessarios
require(lmtest); require(car)

# base de dados
dados = as.data.frame(cbind(cid, massa, taxa))

# ajuste do modelo com as variaveis estatisticamente significativas
regres = aov(dados$taxa ~ dados$massa, data = dados)
summary.lm(regres)

# teste de Breusch-Pagan para homocedasticidade dos erros
bptest(regres)

# avaliacao do ajuste do novo modelo
coefficients(regres) 
confint(regres, level = 0.95) 
anova(regres) 
plot(fitted(regres), residuals(regres)); abline(h = 0, col = "red")
influenceIndexPlot(regres, id.n = 3)
plot(regres)
