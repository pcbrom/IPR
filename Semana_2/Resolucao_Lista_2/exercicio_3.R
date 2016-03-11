#milton
y=15
if(is.character(y)){
  if(y=="a"||y=="e"||y=="i"||y=="o"||y=="u"){
    "È uma vogal"
  }else {"É um caracter Comum"}
}else if(is.numeric(y)){
  "É um algarismo"
}
