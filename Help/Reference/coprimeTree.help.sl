# coprimeTree

- _coprimeTree([m n], k)_

Answer the coprime tree,
starting at the coprime pair _(m,n)_,
and having _k_ levels.

The _2,1_ coprime tree:

```
>>> [2 1].coprimeTree(3)
>>> .levelOrderValues
[
	2 1;
	3 2; 5 2; 4 1;
	4 3; 8 3; 7 2;
	8 5; 12 5; 9 2;
	7 4; 9 4; 6 1
]
```

The _3,1_ coprime tree:

```
>>> [3 1].coprimeTree(3)
>>> .levelOrderValues.++
[
	3 1;
	5 3; 7 3; 5 1;
	7 5; 13 5; 11 3;
	11 7; 17 7; 13 3;
	9 5; 11 5; 7 1
]
```

The _2,1_ coprime tree:

~~~spl svg=A
[2 1].coprimeTree(5)
.values
.scatterPlot
~~~

![](Help/Image/coprimeTree-A.svg)

The _3,1_ coprime tree:

~~~spl svg=B
[3 1].coprimeTree(5)
.values
.scatterPlot
~~~

![](Help/Image/coprimeTree-B.svg)

The _2,1_ and _3,1_ coprime trees:

~~~spl svg=C
let k = 5;
let a = [2 1].coprimeTree(k);
let b = [3 1].coprimeTree(k);
(a.values ++ b.values).scatterPlot
~~~

![](Help/Image/coprimeTree-C.svg)

The _m_ values of the _2,1_ coprime tree:

~~~spl svg=D
[2 1].coprimeTree(6)
.levelOrderValues.column(1)
.scatterPlot
~~~

![](Help/Image/coprimeTree-D.svg)

The _m_ values of the _3,1_ coprime tree:

~~~spl svg=E
[3 1].coprimeTree(6)
.levelOrderValues.column(1)
.scatterPlot
~~~

![](Help/Image/coprimeTree-E.svg)

The _n_ values of the _2,1_ coprime tree:

~~~spl svg=F
[2 1].coprimeTree(6)
.levelOrderValues.column(2)
.scatterPlot
~~~

![](Help/Image/coprimeTree-F.svg)

The _n_ values of the _3,1_ coprime tree:

~~~spl svg=G
[3 1].coprimeTree(6)
.levelOrderValues.column(2)
.scatterPlot
~~~

![](Help/Image/coprimeTree-G.svg)

The _2,1_ coprime tree:

~~~spl svg=H
[2 1].coprimeTree(3)
.treePlot
~~~

![](Help/Image/coprimeTree-H.svg)

The _3,1_ coprime tree:

~~~spl svg=I
[3 1].coprimeTree(3)
.treePlot
~~~

![](Help/Image/coprimeTree-I.svg)

* * *

See also: calkinWilfTree, isCoprime, Tree, unfoldTree

Guides: Prime Number Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/RelativelyPrime.html),
_W_
[1](https://en.wikipedia.org/wiki/Coprime_integers)
