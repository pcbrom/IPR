<img align="left" img src="https://cloud.githubusercontent.com/assets/10408245/13290324/022a1f82-daf2-11e5-8179-00d828bf27a0.jpg" width="249px" height="147px" />

<p align="center">
###################################################################<br>
INSTITUTO FEDERAL DE EDUCAÇÃO, CIÊNCIA E TECNOLOGIA DE BRASÍLIA<br>
INTRODUÇÃO À PROGRAMAÇÃO COM R<br>
MATERIAL DE LEITURA - SEMANA_3 - PARTE 1 E 2<br>
###################################################################
</p>

<br>

**Objetivos do capítulo**

Neste tópico serão estudadas as estruturas de repetição (loops). São mecanismos que permitem que uma parte do programa seja repetida várias vezes.

Todas as linguagens de programação devem ter um mecanismo desse tipo. É muito comum que a resolução de um problema envolva a repetição de um determinado processo.

O programador estabelece quais os trechos de programas que são repetidos, e quais as condições que balizam essas repetições.

**Introdução**

As estruturas de repetição permitem que um comando (simples ou composto) seja executado repetidamente, até que seja satisfeita uma determinada condição.

R possui algumas estruturas de loop que poder invocadas de duas formas: 
  - Comandos (válida para praticamente todas as linguagens): for, repeat e while. (PARTE_1)
  - Funções (nativas do R): apply, lapply, mapply, tapply, split e aggregate. (PARTE_2)

<br><br>**(PARTE_1)**

**FOR**

O comando **for(...)** é praticado quando sabemos a quantidade de ocorrências até o final do loop. Suponhamos a seguite rotina:

> for(i in 1:10) {<br>
>    print(i)<br>
>  }<br>
>[1] 1<br>
>[1] 2<br>
>[1] 3<br>
>[1] 4<br>
>[1] 5<br>
>[1] 6<br>
>[1] 7<br>
>[1] 8<br>
>[1] 9<br>
>[1] 10

Aqui estamos pedindo para imprimir na tela cada **i** dentro da contagem indicada. A leitura do código fica do seguinte modo: **for** indica para entrar em um procedimento onde identificamos o elemento **i** dentro da sequência **1:10** (1, 2, 3, 4, 5, 6, 7, 8, 9, 10). Daí abrimos o comando desejado **{...}** que é imprimir na tela o valor de **i**, com **print(i)**

Agora ao invés de utilizar **print(i)** coloque apenas **i** dentro das chaves. (O que ocorre?)

Novo exemplo:

> for(i in c(2, 4, 6, 7)) {<br>
>   op.1 = i^3<br>
>   print(op.1)<br>
> }<br>
>[1] 8<br>
>[1] 64<br>
>[1] 216<br>
>[1] 343

A leitura segue a mesma linha de pensamento, mas o **i** percorre os valores do vetor **c(2, 4, 6, 7)**, efetua a operação **op.1** e imprime na tela o seu valor **print(op.1)**.

O comando **for** também aceita contrução de loop por níveis, por exemplo a leitura dos elementos de uma matriz.

> x = matrix(1:6, nrow = 2, ncol = 3)<br>
> x<br>
>     [,1] [,2] [,3]<br>
>[1,]    1    3    5<br>
>[2,]    2    4    6<br>
><br>
> for(i in seq_len(nrow(x))) {<br>
>   for(j in seq_len(ncol(x))) {<br>
>     print(x[i, j])<br>
>   }<br>
> }<br>
>[1] 1<br>
>[1] 3<br>
>[1] 5<br>
>[1] 2<br>
>[1] 4<br>
>[1] 6

Na primeira camada o **i** pega a primeira linha e vai para a segunda camada, **j**, fazendo a leitura dos elementos da matriz, ao terminar a última coluna, vai para a segunda linha e retorna na tela a mesma execução efetuada anteriormente.

Cuidado ao adicionar níveis, pois são camadas n-dimensionais que estão sendo criadas, ou seja, chega um ponto que criar um escopo para as operações fica cada vez mais complexo.

Caso seja necessário pular algumas iterações podemos aplicar o comando **next** dentro do loop. Por exemplo:

> for(i in 1:100) {<br>
> if(i <= 20) {<br>
> next # AQUI IRÁ PULAR ATÉ A VIGÉSIMA ITERAÇÃO<br>
> }<br>
> (ALGUMA ROTINA)<br>
> }

O comando **next** também é útil quando ocorre algum tipo de erro durante o loop. Em condições normais o loop é interrompido se durante alguma operação ocorrer algum erro. Com o comando **next** podemos definir uma condição que em caso de erro, compute o próximo a fim de completar o loop. Para este caso em específico usamos **try** e **next**. Exemplo:

> vetor.1 = c(1:5, "a", 7:10) # RODAR ESTE SCRIPT LINHA POR LINHA (segurar Ctrl + ir pressionando Enter)<br>
> mode(vetor.1) # NOTE QUE SEU MODO É DE CARACTERE<br>
> <br>
> for (i in seq_along(vetor.1)) { # IRÁ PASSAR EM CADA POSIÇÃO DO vetor.1<br>
>   <br>
>   resp = try({ # ESTÁ CRIANDO UM OBJETO "resp" PARA TENTAR O COMANDO<br>
>     <br>
>     obj.1 = as.numeric(vetor.1[i]) # ESTÁ FORÇANDO O VALOR DA POSIÇÃO i SER NUMÉRICO<br>
>     obj.2 = obj.1^2 # COLETA O obj.1 E EFETUA A OPERAÇÃO<br>
>     print(obj.2) # IMPRIME NA TELA O RESULTADO<br>
>     <br>
>   })<br>
>   <br>
>   if(inherits(resp, "try-error")) { # SE HOUVER ALGUM TIPO DE ERRO COM O OBJETO resp ENTÃO<br>
>     <br>
>     next # VÁ PARA O PRÓXIMO TERMO DO LOOP<br>
>     <br>
>   }<br>
>   <br>
> }

**REPEAT/BREAK**

**Repeat** inicia um loop "infinito". É comum o uso de loop "infito" em computação de dados. A única forma de parar o comando é invocando **break**. Para este tipo de procedimento não há garantias de que a computação de dados termine. Portanto não é recomendável usar este procedimento.

> x0 = 1<br>
> tol = 1e-8<br>
> <br>
> repeat {<br>
>   <br>
>   x1 = computeEstimate() # NAO INCLUSO NA INSTALACAO DEFAULT DO R<br>
>   <br>
>   if(abs(x1 - x0) < tol) {<br>
>     <br>
>     break<br>
>   <br>
>     } else {<br>
>       <br>
>    x0 = x1<br>
>     <br>
>     }<br>
>   <br>
> }

**WHILE**

**While** precisa de uma condição para ser testada. Enquanto a condição não for verificada o loop continua, ou seja, se a condição estiver com redação ruim então corre o risco do loop não terminar. É indicado quando não sabemos a quantidade de iterações para atingir o resultado esperado.

> count = 0 # DEFINA UM OBJETO count COM VALOR NUMÉRICO 0<br>
> <br>
> while(count < 10) { # ENQUANTO O OBJETO count FOR MENOR DO QUE 10<br>
>   print(count) # IMPRIMA O SEU VALOR<br>
>   count = count + 1 # ADICIONE +1 EM count<br>
> }<br>
>[1] 0<br>
>[1] 1<br>
>[1] 2<br>
>[1] 3<br>
>[1] 4<br>
>[1] 5<br>
>[1] 6<br>
>[1] 7<br>
>[1] 8<br>
>[1] 9 # O VALOR IMPRESSO VAI ATÉ 9 POIS O LOOP SE LIMITA A CONDIÇÃO DE count < 10

Agora refaça o exemplo anterior trocando a ordem das linhas de comando print e count. (O que o corre?)

Mais um exemplo: Simulando uma rotina de passo aleatório. Rode o script algumas vezes e veja os resultados.

> z = 5<br>
> <br>
> while(z >= 3 && z <= 10) { # CONDIÇÕES PARA FUNCIONAMENTO DO LOOP<br>
>   print(z) # IMPRIMA O VALOR DE z<br>
>   moeda = rbinom(1, 1, 0.5) # SIMULAÇÃO DO LANÇAMENTO DE UMA MOEDA EQUILIBRADA<br>
>   if(moeda == 1) { # ROTINA DE PASSO ALEATÓRIO<br>
>     z = z + 1 # CASO SEJA 1 ENTÃO ADICIONE +1 EM z<br>
>   } else {<br>
>     z = z - 1 # CASO CONTRÁRIO ENTÃO ADICIONE -1 EM z<br>
>   }<br>
> }

<br><br>**(PARTE_2)**

**APPLY**

O comando apply é utilizado para aplicar uma função para operar com as linhas ou colunas numa matriz. Em relação ao desempenho não chega a ser tão rápido quanto operar em loop, por outro lado é extremamente fácil sua escrita.

Vejamos seus argumentos:

> args(apply)<br>
> function (X, MARGIN, FUN, ...)<br>
> NULL

Então temos **X** o objeto que será utilizado, **MARGIN** que define se a operação ocorrerá com as linhas **(1)** ou colunas **(2)** e **FUN** a função que será praticada.

Exemplo:

> x <- matrix(seq(1:8), 2, 4)<br>
> print(x)<br>
>     [,1] [,2] [,3] [,4]<br>
>[1,]    1    3    5    7<br>
>[2,]    2    4    6    8<br>
> apply(x, 1, sum) # CALCULAMOS A SOMA DAS LINHAS<br>
> [1] 16 20<br>
> apply(x, 2, prod) # CALCULAMOS O PRODUTO DAS COLUNAS<br>
> [1]  2 12 30 56

Seguem algumas funções do sistema que facilitam as operações:

* rowSums = apply(x, 1, sum)
* rowMeans = apply(x, 1, mean)
* colSums = apply(x, 2, sum)
* colMeans = apply(x, 2, mean)

Aqui temos outra forma de operar o **pply**

> x <- matrix(rnorm(200), 20, 10)<br>
> apply(x, 1, quantile, probs = c(0.25, 0.75))<br>
>           > [,1]       [,2]       [,3]       [,4]       [,5]<br>
> 25% -0.7249996 -0.7936566 -0.2307457 -0.4990161 -0.6046746<br>
> 75% -0.0126197  0.5120955  0.2966554  0.3801510  0.4670831<br>
>           [,6]       [,7]       [,8]        [,9]      [,10]<br>
> 25% -0.6681347 -1.0868505 -0.7157743 -0.05894571 -0.2748485<br>
> 75%  0.8086059  0.5642092  0.6139244  0.85932319  0.3976499<br>
>          [,11]      [,12]      [,13]      [,14]      [,15]<br>
> 25% -0.3737405 -0.9583289 -0.8452042 -0.3845903 -0.3991295<br>
> 75%  0.7187392 -0.3656094  0.2002019  0.2368866  0.2641056<br>
>          [,16]      [,17]      [,18]      [,19]      [,20]<br>
> 25% -0.3426580 -0.1792652 -0.3581542 -0.7515509 0.02499228<br>
> 75%  0.4898111  0.9605446  0.9638863  0.9182874 0.38539324

No comando **apply(x, 1, quantile, probs = c(0.25, 0.75))** adicionamos um novo argumento. Este argumento, probs, é nativo da função **quantile**, que por sua vez é aplicado às linhas, **1**, de **x**. Em outras palavras estamos criando funções compostas que o R pode operar.

**MAPPLY**

O comando **mapply** é semelhante ao **apply** o prefixo **m** indica que serve para atividade multivariada.

Suponhamos:

> list(rep(1, 4), rep(2, 3), rep(3, 2), rep(4, 1))<br>
> [[1]]<br>
> [1] 1 1 1 1<br>
> <br>
> [[2]]<br>
> [1] 2 2 2<br>
> <br>
> [[3]]<br>
> [1] 3 3<br>
> <br>
> [[4]]<br>
> [1] 4

Estas linhas não requerem muito esforço para ver o que ocorre. Portanto deixamos a interpretação por conta do leitor.

Agora vamos utilizar esta lista e aplicar a soma de suas entradas.

> x = list(rep(1, 4), rep(2, 3), rep(3, 2), rep(4, 1))<br>
> mapply(sum, x)<br>
> [1] 4 6 6 4

Então o que diferencia **mapply** de **apply** é a capacidade de lidar com listas onde seus vetores podem ter tamanhos diferentes, enquanto o **apply** necessita de uma matriz.

**TAPPLY**

O comando **tapply** é adequado quando queremos efetuar uma operação em uma base de dados que está indexada por grupos de interesse.

Exemplo:

> x <- c(rnorm(10), runif(10), rnorm(10, 1))<br>
> f <- gl(3, 10)<br>
> f<br>
> [1] 1 1 1 1 1 1 1 1 1 1 2 2 2 2 2 2 2 2 2 2 3 3 3<br>
> [24] 3 3 3 3 3 3 3<br>
> Levels: 1 2 3<br>
> tapply(x, f, mean)<br>
> 1<br>
> 2<br>
> 3<br>
> 0.1144464 0.5163468 1.2463678

Note que **gl** está criando um vetor de fatores com níveis: 1, 3 e 3. Ao efetuar **tapply(x, f, mean)** estamos ajustando esta indexação para cada elemento do vetor **x** aos níveis do vetor **f** e depois pedimos a média de acordo com os níveis solicitados.

**SPLIT**

O comando **split** serve para tomar um vetor e separar por grupos de fatores ou por uma lista de fatores.

Exemplo:

> x <- c(rnorm(10), runif(10), rnorm(10, 1))<br>
> f <- gl(3, 10)<br>
> split(x, f)<br>
> $`1`<br>
>  [1]  0.006695117  0.783765110 -0.259520327 -0.748984705<br>
>  [5] -0.423697067 -1.226409609 -0.896275519  0.563958092<br>
>  [9]  0.575615319 -0.425785351<br>
> <br>
> $`2`<br>
>  [1] 0.35231376 0.35713776 0.49555345 0.63970245 0.58427461<br>
>  [6] 0.03400261 0.28498556 0.05255468 0.20159874 0.95761713<br>
> <br>
> $`3`<br>
>  [1] 0.577302 2.897775 1.251375 1.004082 1.558833 1.256193<br>
>  [7] 1.267426 3.765642 0.654155 1.180660

E pode ser trabalhado juntamente com **lapply**. **lapply** trabalha com listas de ualquer tamanho e forma. Segue a mesma linha de raciocínio dos comandos anteriores.

> lapply(split(x, f), mean)<br>
> $`1`<br>
> [1] -0.2050639<br>
> <br>
> $`2`<br>
> [1] 0.3959741<br>
> <br>
> $`3`<br>
> [1] 1.541344

Também é muito útil para fazer separação de datasets.

> data(airquality)<br>
> head(airquality)<br>
>   Ozone Solar.R Wind Temp Month Day<br>
> 1    41     190  7.4   67     5   1<br>
> 2    36     118  8.0   72     5   2<br>
> 3    12     149 12.6   74     5   3<br>
> 4    18     313 11.5   62     5   4<br>
> 5    NA      NA 14.3   56     5   5<br>
> 6    28      NA 14.9   66     5   6<br>
> s <- split(airquality, airquality$Month)<br>
> lapply(s, function(x) colMeans(x[, c("Ozone", "Solar.R", "Wind")]))<br>
> $`5`<br>
>    Ozone  Solar.R     Wind <br>
>       NA       NA 11.62258 <br>
> <br>
> $`6`<br>
>     Ozone   Solar.R      Wind <br>
>        NA 190.16667  10.26667 <br>
> <br>
> $`7`<br>
>      Ozone    Solar.R       Wind <br>
>         NA 216.483871   8.941935 <br>
> <br>
> $`8`<br>
>    Ozone  Solar.R     Wind <br>
>       NA       NA 8.793548 <br>
> <br>
> $`9`<br>
>    Ozone  Solar.R     Wind <br>
>       NA 167.4333  10.1800 

**AGGREGATE**

O comando **aggregate** segue na mesma linha do **tapply** com a vantagem de usar a base de dados sem a necessidade de separar em subsets com o comando **split**.

Por exemplo:

> data(iris)<br>
> head(iris)<br>
>   Sepal.Length Sepal.Width Petal.Length Petal.Width Species<br>
> 1          5.1         3.5          1.4         0.2  setosa<br>
> 2          4.9         3.0          1.4         0.2  setosa<br>
> 3          4.7         3.2          1.3         0.2  setosa<br>
> 4          4.6         3.1          1.5         0.2  setosa<br>
> 5          5.0         3.6          1.4         0.2  setosa<br>
> 6          5.4         3.9          1.7         0.4  setosa<br>
> aggregate(iris$Sepal.Length, list(iris$Species), 'mean', na.rm = T)<br>
>      Group.1     x<br>
> 1     setosa 5.006<br>
> 2 versicolor 5.936<br>
> 3  virginica 6.588<br>

**Conclusão**

Neste tópico vimos as estruturas de repetição, que permitem que uma parte do programa seja executada várias vezes.

A escolha entre as estruturas ocorre em função do tipo de problema que está sendo resolvido, e também, em muitos casos, em função do estilo de programação do programador.

Na linguagem R o sistema de loop é tomado através dos comandos: **for**, **repeat**, **while**, **apply**, **lapply**, **mapply**, **tapply**, **split** e **aggregate**.

.................................................................................................................................<br><br>
**Fontes consultadas:**
* Introduçao à Ciência da Computação, Universidade de Brasília.
    * Prof. Dr. Homero Luiz Piccolo;
* Computação em Estatística 1 e 2, Universidade de Brasília.
    * Profa. Dra. Juliana Betini Fachini;
    * Prof. Dr. Donald Matthew Pianto;
* R Programming, Data Science Specialization, Johns Hopkins University.
    * Prof. PhD. Roger Peng;
    * Prof. PhD. Jeff Leek;
    * Prof. PhD. Brian Caffo.
