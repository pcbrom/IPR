<img align="left" img src="https://cloud.githubusercontent.com/assets/10408245/13290324/022a1f82-daf2-11e5-8179-00d828bf27a0.jpg" width="249px" height="147px" />

<p align="center">
###################################################################<br>
INSTITUTO FEDERAL DE EDUCAÇÃO, CIÊNCIA E TECNOLOGIA DE BRASÍLIA<br>
INTRODUÇÃO À PROGRAMAÇÃO COM R<br>
MATERIAL DE LEITURA - SEMANA_6<br>
###################################################################
</p>

<br>

**Objetivos do capítulo e Introdução**

Este capítulo se destina à operações escalares e matriciais.

**Produto Escalar**

Existem duas operações básicas envolvendo vetores: a adição e a multiplicação por um escalar, isto é, por um número real.

Em R para efetuar o produto escalar basta aplicar o **asterístico**, ** '*' **, entre dois vetores e depois aplicar a soma do vetor resultante.
> v = 1:10<br>
> u = 20:11<br>
> w = u*v<br>
> print(w)<br>
> [1]  20  38  54  68  80  90  98 104 108 110<br>
> sum(w)<br>
> [1] 770

Outra forma seria diretamente por:
> k = u%*%v<br>
> print(k)<br>
>     [,1]<br>
> [1,]  770

Onde o **%*%** indica produto vetorial, mas a forma padrão que o sistema entende é operação (1xn)x(nx1) = (1x1), pois **u** e **v** são vetores de ordem (1xn).

**Produto Vetorial**

Em matemática, o produto vetorial ou produto externo, é uma operação binária sobre vetores em um espaço vetorial. Seu resultado difere do produto escalar por ser também um vetor, ao invés de um escalar. Seu principal uso baseia-se no facto que o resultado de um produto vetorial é sempre perpendicular a ambos os vetores originais.

O mesmo caso anterior pode ser replicando azendo apenas a alteração de transpor **u**, por exemplo.
> u2 = t(u)<br>
> print(u2)<br>
>      [,1] [,2] [,3] [,4] [,5] [,6] [,7] [,8] [,9] [,10]<br>
> [1,]   20   19   18   17   16   15   14   13   12    11<br>
> k2 = v%*%u2<br>
> print(k2)<br>
>       [,1] [,2] [,3] [,4] [,5] [,6] [,7] [,8] [,9] [,10]<br>
>  [1,]   20   19   18   17   16   15   14   13   12    11<br>
>  [2,]   40   38   36   34   32   30   28   26   24    22<br>
>  [3,]   60   57   54   51   48   45   42   39   36    33<br>
>  [4,]   80   76   72   68   64   60   56   52   48    44<br>
>  [5,]  100   95   90   85   80   75   70   65   60    55<br>
>  [6,]  120  114  108  102   96   90   84   78   72    66<br>
>  [7,]  140  133  126  119  112  105   98   91   84    77<br>
>  [8,]  160  152  144  136  128  120  112  104   96    88<br>
>  [9,]  180  171  162  153  144  135  126  117  108    99<br>
>  [10,]  200  190  180  170  160  150  140  130  120   110<br>

**Matriz identidade**

Usamos o comando **diag(n)** com **n** sendo a ordem da matriz.
> id = diag(3)<br>
> print(id)<br>
>      [,1] [,2] [,3]<br>
> [1,]    1    0    0<br>
> [2,]    0    1    0<br>
> [3,]    0    0    1

**Criando matrizes**

Podem ser invocadas diretamente de uma base de dados ou podem ser adicionadas por: **matrix(...)**
> args(matrix)<br>
> matrix(data = NA, nrow = 1, ncol = 1, byrow = FALSE, dimnames = NULL)
* data indica os valores de entrada da matriz.
* nrow indica a quantidade de linhas.
* ncol indica a quantidade de colunas.
* byrow, se F, então sera preenchido por coluna, se V, por linha.

Note a diferença na forma de preenchimento:
> A = matrix(data = u, nrow = 5, ncol = 2)<br>
> print(A)<br>
>      [,1] [,2]<br>
> [1,]   20   15<br>
> [2,]   19   14<br>
> [3,]   18   13<br>
> [4,]   17   12<br>
> [5,]   16   11<br>
> B = matrix(data = u, nrow = 5, ncol = 2, byrow = T)<br>
> print(B)<br>
>      [,1] [,2]<br>
> [1,]   20   19<br>
> [2,]   18   17<br>
> [3,]   16   15<br>
> [4,]   14   13<br>
> [5,]   12   11

O R recilcla vetores, portanto tenha atenção e cuidado.
> print(u)<br>
>  [1] 20 19 18 17 16 15 14 13 12 11<br>
> C = matrix(data = u, nrow = 5, ncol = 3)<br>
> Warning message:<br>
> In matrix(data = u, nrow = 5, ncol = 3) :<br>
>   comprimento dos dados [10] não é um submúltiplo ou múltiplo do número de colunas [3]<br>
> print(C)<br>
>      [,1] [,2] [,3]<br>
> [1,]   20   15   20<br>
> [2,]   19   14   19<br>
> [3,]   18   13   18<br>
> [4,]   17   12   17<br>
> [5,]   16   11   16

**Matriz Inversa**

Usamos o comando **solve** veja mais detalhes em **?solve**

> D2 = D^2<br>
> print(D2)<br>
>      [,1] [,2] [,3]<br>
> [1,]    1   16   49<br>
> [2,]    4   25   64<br>
> [3,]    9   36   81<br>
> D2inv = solve(D^2)<br>
> print(D2inv)<br>
>           [,1]      [,2]       [,3]<br>
> [1,]  1.291667 -2.166667  0.9305556<br>
> [2,] -1.166667  1.666667 -0.6111111<br>
> [3,]  0.375000 -0.500000  0.1805556

**Potencia de matrizes**

> D = matrix(data = 1:9, nrow = 3, ncol = 3)<br>
> D%*%D<br>
>      [,1] [,2] [,3]<br>
> [1,]   30   66  102<br>
> [2,]   36   81  126<br>
> [3,]   42   96  150<br>
> pow = function(X, n) {<br>
>    i = 1<br>
>    while(i < n) {<br>
>      X = X%*%X<br>
>      i = i + 1  <br>
>    }<br>
>    return(X)<br>
>  }<br>
> pow(D, 2)<br>
>      [,1] [,2] [,3]<br>
> [1,]   30   66  102<br>
> [2,]   36   81  126<br>
> [3,]   42   96  150

O comando solve também serve para resolver sistemas lineares, por exemplo:
> print(D2)<br>
>      [,1] [,2] [,3]<br>
> [1,]    1   16   49<br>
> [2,]    4   25   64<br>
> [3,]    9   36   81<br>
> igualdade = c(0, 1, 2)<br>
> solucao = solve(a = D^2, b = igualdade)<br>
> print(solucao)<br>
> [1] -0.3055556  0.4444444 -0.1388889

**Para terminar uma aplicação de cálculo matricial**

www.github.com/pcbrom/IPR/blob/master/Semana_6/MRLS.R

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
* Operações com vetores.
    * www.im.ufrj.br/dmm/projeto/projetoc/precalculo/sala/conteudo/capitulos/cap91s4.html
* Wikipedia - Produto Vetorial.
    * pt.wikipedia.org/wiki/Produto_vetorial
