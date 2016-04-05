<img align="left" img src="https://cloud.githubusercontent.com/assets/10408245/13290324/022a1f82-daf2-11e5-8179-00d828bf27a0.jpg" width="249px" height="147px" />

<p align="center">
###################################################################<br>
INSTITUTO FEDERAL DE EDUCAÇÃO, CIÊNCIA E TECNOLOGIA DE BRASÍLIA<br>
INTRODUÇÃO À PROGRAMAÇÃO COM R<br>
MATERIAL DE LEITURA - SEMANA_4<br>
###################################################################
</p>

<br>

**Objetivos do capítulo e Introdução**

Ponteiros são diretamente suportados sem restrições em C, C++, D e Pascal, entre outras linguagens. São utilizados para construir referências, elemento fundamental da maioria das estruturas de dados, especialmente aquelas não alocadas em um bloco contínuo de memória, como listas encadeadas, árvores ou grafos.

Ao lidar com arranjos, uma operação crítica é o cálculo do endereço para o elemento desejado no arranjo, o que é feito através da manipulação de ponteiros. De fato, em algumas linguagens (como C), os conceitos de "arranjo" e "ponteiro" são intercambiáveis. Em outras estruturas de dados, como listas encadeadas, ponteiros são usados como referências para intercalar cada elemento da estrutura com seus vizinhos (seja anterior ou próximo).

Ponteiros também são utilizados para simular a passagem de parâmetros por referência em linguagens que não oferecem essa construção (como o C). Isso é útil se desejamos que uma modificação em um valor feito pela função chamada seja visível pela função que a chamou, ou também para que uma função possa retornar múltiplos valores.

Em R não é necessário o uso de ponteiros para criar uma função.

**Criando uma função**

Funções são criadas usando a estrutura **function(var1,var2...)** são armazenadas como um objeto da classe "function"" e tem o seguinte escopo:

>f <- function(<variaveis>) {<br>
> Alguma rotina<br>
>}

E seguem algumas observações que devem ser seguidas:
* Funções podem passar argumentos para outras funções.
* Funções podem ser imbuidas dentro de outras funções.
* Funções podem ser invocadas dentro delas mesmas para fins de recursividade.
* Funções devem ter um valor de retorno, que podem ser: Vetor, matriz, dataframe, lista.

**Compatibilizando variáveis e os argumentos da função**

Vamos criar uma base de dados para facilitar a interpretação.

> mydata <- rnorm(100)<br> 

Supunha que queremos calcular o desvio-padrão de mydata, então o primeiro passo é verificar os seus argumentos.

> args(sd)<br>
> function (x, na.rm = FALSE) <br>
> NULL<br>

Podemos calcular diretamente e ver o resultado.

> sd(mydata)  <br>

Neste caso o sistema assume que mydata será usado como argumento de x.

Ou podemos declarar diretamente.

> sd(x = mydata)<br>

Quando declaramos, ganhamos uma vantagem, pois os argumentos estão em uma ordem pré-definida e se digitarmos múltiplos argumentos declaradamente, ainda que fora da ordem, o sistema insere corretamente os valores.

> sd(x = mydata, na.rm = FALSE)<br>
> sd(na.rm = FALSE, x = mydata)<br>
> sd(na.rm = FALSE, mydata)

Vejamos outra função nativa e algumas considerações.

> args(lm)<br>
> function (formula, data, subset, weights, na.action,<br>
> method = "qr", model = TRUE, x = FALSE,<br>
> y = FALSE, qr = TRUE, singular.ok = TRUE,<br>
> contrasts = NULL, offset, ...)<br>
> The following two calls are equivalent.<br>

Novamente podemos invicar a função na ordem que sugere, sem declarar.

> lm(y ~ x, mydata, 1:100, model = FALSE)

Ou podemos declarar e colocar em uma ordem qualquer.
> lm(data = mydata, y ~ x, model = FALSE, 1:100)

**Lazy Evaluation** (Avaliação Preguiçosa - tradução literal)

Argumentos das funções são avaliados "preguiçosamente", ou seja apenas se necessário.

Exemplos:

> f <- function(a, b) {<br>
> a^2<br>
> }<br>
> f(2)

> f <- function(a, b) {
> print(a)
> print(b)
> }
> f(45)
>  [1] 45
>  Error: argument "b" is missing, with no default

**O argumento "..."**

O argumento **...** indica a passagem de argumentos para outra função. É indicado em casos que uma função tem vários agumentos de entrada e você não quer copiar um por um para uma nova função.

> myplot <- function(x, y, type = "l", ...) {<br>
> plot(x, y, type = type, ...)<br>
> }

Criando uma função de ajuste de texto.

Vamos acessar:
* [Manipulação de texto](https://github.com/pcbrom/IPR/blob/master/Semana_4/aula_funcoes.R)

**Conclusão**

Neste tópico vimos como criar uma função em R e sua principal finalidade é integrar variáveis de entradaa com variáveis de saída utilizando alguma regra operatória.

E as observações que devem ser seguidas são:
* Funções podem passar argumentos para outras funções.
* Funções podem ser imbuidas dentro de outras funções.
* Funções podem ser invocadas dentro delas mesmas para fins de recursividade.
* Funções devem ter um valor de retorno, que podem ser: Vetor, matriz, dataframe, lista.

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
* Uso de Ponteiros, Wikipedia (abordagem informal)
