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
v    x0 = x1<br>
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

**MAPPLY**

**TAPPLY**

**SPLIT**

**AGGREGATE**








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
