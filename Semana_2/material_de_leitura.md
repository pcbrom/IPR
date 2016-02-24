<img align="left" img src="https://cloud.githubusercontent.com/assets/10408245/13283857/11cc6a94-dacf-11e5-9d00-e354256b155b.jpg" width="249px" height="147px" />

<p align="center">
###################################################################<br>
INSTITUTO FEDERAL DE EDUCAÇÃO, CIÊNCIA E TECNOLOGIA DE BRASÍLIA<br>
INTRODUÇÃO À PROGRAMAÇÃO COM R<br>
MATERIAL DE LEITURA - SEMANA_2<br>
###################################################################
</p>

<br>

**Nota introdutória do curso:**

É recomendado NÃO copiar e colar os comandos. Para ganhar fluência na linguagem de programação é necessário digitar para se acostumar com a sintaxe e ganhar boas práticas de codificação. Se já tiver um pouco de prática com outra linguagem, continue digitando para que sua escrita não tenha "sotaque".

Tenha um ótimo aprendizado.<br><br>

**Objetivos do capítulo**

Neste capítulo são apresentadas as estruturas de tomada de decisão, que estão presentes em todas as linguagens de programação.

Uma estrutura de decisão é um mecanismo pelo qual um programa pode escolher um entre dois ou mais caminhos, isto é, entre duas ou mais seqüências de comandos previstos no programa. 

Dessa forma, dependendo dos valores assumidos por variáveis ou expressões no momento da execução do programa, o fluxo de comandos pode seguir por um caminho ou por outro. Tudo ocorre como se o computador estivesse tomando uma decisão. Na verdade as opções para a decisão já estão previstas pelo programador, que estabelece em que condições o programa deve seguir por este ou por aquele caminho.<br><br>

**1. Introdução**

As estruturas condicionais permitem que decisões sejam tomadas ao longo da execução do programa. 

Dependendo de certas condições, o fluxo de execução dos comandos pode seguir uma direção ou outra, permitindo que algumas partes do programa sejam ou não executadas.

R possui algumas estruturas básicas de decisão:

O comando **ifelse** e o comando **if**.

* IFELSE

**ifelse** tem uma condição binária de resposta:
args(ifelse) nos retorna os argumentos utilizados da condicional

> args(ifelse)<br>
> function (test, yes, no)<br>
> NULL

Por exemplo:
> ifelse(0 > 5, "Correto", "Errado")<br>
> [1] "Errado"

Neste caso estamos perguntando se 0 é maior do que 5. Se o teste lógico for verdadeiro então retorna "Correto", caso contrário "Errado".

O teste que foi realizado 0 > 5 se escrito diretamente no terminal, retorna FALSE.
> 0 > 5<br>
> [1] FALSE

Isto é, todo teste lógico será repondido com TRUE ou FALSE.

Um novo exemplo:
> x = "Curso de IPR"<br>
> is.character(x)<br>
> [1] TRUE<br>
> ifelse(is.character(x), "Correto", "Errado")<br>
> [1] "Correto"

Aqui estamos definindo um objeto chamado **x** com o valor de entrada "Curso de IPR". Com o comando is.character(...) estamos perguntando se a natureza o objeto é um caractere e teremos a saída "Correto" na condicional.

Mais um exemplo:
> x = "Curso de IPR"<br>
> is.character(x)<br>
> [1] TRUE<br>
> operacao.1 = paste(x,"IFB", "2016", sep = " -> ")<br>
> ifelse(is.character(x), operacao.1, "Errado")<br>
> [1] "Curso de IPR -> IFB -> 2016"

Certo... veja que adicionamos um objeto chamado **operacao.1**. O comando **paste** seve para concatenar as entradas entre (...) e podemos utilizar um separador, **sep = " -> "** entre elas. Faça algumas alterações e perceba o que pode ser feito manipulando o texto.<br>

* IF

**if** tem uma condição plástica de resposta, ou seja, podem ser adicionados níveis e subníveis:

Vamos aproveitar o exemplo anterior.

> x = "Curso de IPR"<br>
> is.character(x)<br>
> [1] TRUE<br>
> operacao.1 = paste(x,"IFB", "2016", sep = " -> ")<br>
> if (is.character(x)) {<br>
>   operacao.1<br>
> } else {<br>
>   "Errado"<br>
> }<br>
> [1] "Curso de IPR -> IFB -> 2016"

O **if** verifica a condição lógica e se for verdadeira retorna o resultado de operacao.1, caso contrário, **else** retorna "Errado". O próximo passo é criar uma operação que seja falsa para que utilize os próximos testes.

> y = 15<br>
> if (y %% 2 == 0) {<br>
>   "É divisível por 2"<br>
> } else if (y %% 3 == 0) {<br>
>   "É divisível por 3"<br>
> } else {<br>
>   "Nenhum dos casos anteriores"<br>
> }<br>
>[1] "É divisível por 3"

Definimos um objeto **y** com valor **15** e rodamos a condicional. Na sequência temos: O objeto **y** se dividido, **%%**, por **2** tem resto igual a 0, **==**? Caso sim retorne **"É divisível por 2"**, caso não, vá para o próximo teste lógico. Se for veradeiro então retorne **"É divisível por 3"**, caso contrário vá para o próximo teste lógico.

E assim segue teste por teste até o final da condicional.

Podemos testar se atende a dois ou mais critérios ao mesmo tempo:
> y = 15<br>
> if (y %% 3 == 0 && y %% 5 == 0) {<br>
>   "É divisível por 3 e 5 ao mesmo tempo"<br>
> } else {<br>
>   "NÃO é divisível por 3 e 5 ao mesmo tempo"<br>
> }<br>
> [1] "É divisível por 3 e 5 ao mesmo tempo"

A pergunta foi: O objeto **y** se dividido, **%%**, por **3** tem resto igual a 0 e, **&&** se dividido, **%%**, por **5** tem resto igual a 0? Caso sim retorne **"É divisível por 3 e 5 ao mesmo tempo"**, caso contrário retorne **"NÃO é divisível por 3 e 5 ao mesmo tempo"**.

Ou Podemos testar se atende a dois ou mais critérios, não sendo necessário ocorrer ao mesmo tempo:
> y = 21<br>
> if (y %% 3 == 0 || y %% 5 == 0) {<br>
>   "É divisível por 3 ou por 5"<br>
>   } else {<br>
>     "NÃO é divisível por 3 ou por 5"<br>
> }<br>
> [1] "É divisível por 3 ou por 5"<br>

Caso **y** seja divisível por 3 ou por 5 então verdadeiro, caso contrário, falso, com seus respectivos retornos.

**Subníveis condicionados**

**Nota pessoal:** Deste ponto em diante utilizaremos o código comentado. Para comentar o seu código durante a aula utilize a cerquilha **#**

> y = 15<br>
> if (is.numeric(y)) { # PRIMEIRO NÍVEL<br>
>   <br>
>   # INÍCIO DO SEGUNDO NÍVEL<br>
>   if (y %% 3 == 0 && y %% 5 == 0) { # EFETUA O TESTE LÓGICO<br>
>     "É divisível por 3 e 5 ao mesmo tempo" # RETORNA ESTE, SE VERDADEIRO<br>
>   } else {<br>
>     "NÃO é divisível por 3 e 5 ao mesmo tempo" # RETORNA ESTE, SE FALSO<br>
>   }<br>
>   # FIM DO SEGUNDO NÍVEL<br>
>   
> } else { # CASO NÃO SEJA NUMÉRICO<br>
>   <br>
>   paste("Argumento", y, "não numérico", sep = " ") # IMPRIMA ESTA RESPOSTA<br>
>   <br>
> }<br>
> [1] "É divisível por 3 e 5 ao mesmo tempo"

Agora altere o valor de **y**:
> y = "15"

Rode novamente e depois retorne neste texto.

Ok... repararam que o retorno foi diferente? Isso ocorre devido a forma de entrada do objeto **y**. Podemos verificar o modo que a entrada foi interpretada utilizando o comando **mode(...)**.
> z = 23 # ENTRADA NUMÉRICA, SEM ASPAS<br>
> w = "23" # ENTRADA CARACTERE, COM ASPAS<br>
> mode(z)<br>
> mode(w)<br><br>

**Conclusão**

Neste tópico foram vistas as estruturas de tomadas de decisão, que existem em todas as linguagens de programação. 

Elas permitem que o programador estabeleça de antemão qual o caminho a ser seguido pelo programa, e em que condições isso ocorre.

Na linguagem R as decisões são tomadas através dos comandos **ifelse** e **if**.




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
