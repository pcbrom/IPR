
install.packages("Rcpp")
install.packages("httpuv")
install.packages(c("rdrop2", "dplyr"), dependencies = T)
require(rdrop2); require(dplyr); require(Rcpp)


drop_acc() %>% select(uid, display_name, email_verified, quota_info.quota)
drop_dir()
drop_create("dados_avaliacao_04_05")
fileUrl = "https://www.dropbox.com/s/irdf8oxjv30cbwy/specdata.zip?dl=1"
download.file(fileUrl, "dados_avaliacao_04_05")

args(system)
args(unzip)


unzip("specdata.zip", exdir = "C:/Users/PC VAIO/Documents/Documentos/Curso R/dados_avaliacao_04_05", unzip = "internal")

install.packages("csv",dependencies=T)
require(csv)

args(read.csv)
read.csv

dados.completos = list.files("/dados_avaliacao_04_05/specdata")
grep("csv",dados.completos)
comp=NULL
for(i in 1:length(dados.completos)){
  W = read.csv(dados.completos[i], header = TRUE, sep = ",", quote = "\"", dec = ".", fill = TRUE)
  comp=rbind(comp, W)
}

View(comp)
data.frame(length(comp))
Sulfate = mean(comp[,2],na.rm=T)
Nitrate = mean(comp[,3],na.rm=T)
sulfateMo = mode(comp[,2])
nitrateMo = mode(comp[,3])
sulfateMe = median(comp[,2],na.rm=T)
nitrateMe = median(comp[,3],na.rm=T)
sulfateV = var(comp[,2], y=NULL, na.rm = T)
nitrateV = var(comp[,3], y=NULL, na.rm = T)

título=(cbind("Estatistica","Sulfate","Nitrate"))
Mean = as.matrix(cbind("Mean",Sulfate,Nitrate))
Mode = as.matrix(cbind("Mode",sulfateMo,nitrateMo))
Median = as.matrix(cbind("Median",sulfateMe,nitrateMe))
Variance = as.matrix(cbind("Variance",sulfateV,nitrateV))

Mean = gsub(".",",", Mean)
Mode = gsub(".",",", Mode)
Median = gsub(".",",", Median)
Variance = gsub(".",",", Variance)

Estatistica = as.data.frame(rbind("título"=título,"Mean" = Mean, "Mode" = Mode, "Median" = Median, "Variance" = Variance))
View(Estatistica)


write.table(Estatistica,"C:/Users/PC VAIO/Documents/Documentos/Curso R/Estatistica.txt", append=FALSE, quote=FALSE, sep="\t")

