# finiteAbelianGroupCount

- _finiteAbelianGroupCount(n)_

Answer the number of finite Abelian groups of order _n_.

Threads over lists.
First few terms,
OEIS [A000688](https://oeis.org/A000688):

```
>>> 1:63.finiteAbelianGroupCount
[
	1 1 1 2 1 1 1 3 2 1 1 2 1 1 1 5 1 2 1 2
	1 1 1 3 2 1 3 2 1 1 1 7 1 1 1 4 1 1 1 3
	1 1 1 2 2 1 1 5 2 2 1 2 1 3 1 3 1 1 1 2
	1 1 2
]
```

Discrete plot of first few terms:

~~~spl svg=A
0:50.finiteAbelianGroupCount
.discretePlot
~~~

![](sw/spl/Help/Image/finiteAbelianGroupCount-A.svg)

Scatter plot of first few terms:

~~~spl svg=B
1:125.finiteAbelianGroupCount
.scatterPlot
~~~

![](sw/spl/Help/Image/finiteAbelianGroupCount-B.svg)

Number of non-Abelian groups of order _n_,
OEIS [A060689](https://oeis.org/A060689):

```
>>> 1:20.finiteGroupCount
>>> -
>>> 1:20.finiteAbelianGroupCount
[0 0 0 0 0 1 0 2 0 1 0 3 0 1 0 9 0 3 0 3]
```

Log scale plot of first few terms:

~~~spl svg=C
let n = 200;
let a = 1:n.finiteGroupCount;
let b = 1:n.finiteAbelianGroupCount;
(a - b).log.scatterPlot
~~~

![](sw/spl/Help/Image/finiteAbelianGroupCount-C.svg)

Compare cumulative counts of even and odd numbers of Abelian groups:

~~~spl svg=D
let n = 1:260;
let a = n.collect { :k |
	k.finiteAbelianGroupCount % 2
};
let b = a.accumulate;
let c = b / n;
c.drop(10).scatterPlot
~~~

![](sw/spl/Help/Image/finiteAbelianGroupCount-D.svg)

Plot successive differences modulo two:

~~~spl svg=E
let n = 25;
let d = differences:/1
.nestList(
	1:n.finiteAbelianGroupCount,
	n
);
(d % 2).padRight.matrixPlot
~~~

![](sw/spl/Help/Image/finiteAbelianGroupCount-E.svg)

* * *

See also: factorInteger, finiteGroupCount, partitionsP

Guides: Integer Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/FiniteGroup.html)
[2](https://mathworld.wolfram.com/AbelianGroup.html)
[3](https://reference.wolfram.com/language/ref/FiniteAbelianGroupCount.html),
_OEIS_
[1](https://oeis.org/A000688)
[2](https://oeis.org/A060689),
_W_
[1](https://en.wikipedia.org/wiki/Finite_group)
[2](https://en.wikipedia.org/wiki/Abelian_group)
