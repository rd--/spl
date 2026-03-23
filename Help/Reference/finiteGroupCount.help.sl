# finiteGroupCount

- _finiteGroupCount(n)_

Answer the number of finite groups of order _n_.

First few terms,
threads over lists,
OEIS [A000001](https://oeis.org/A000001):

```
>>> 0:19.finiteGroupCount
[0 1 1 1 2 1 2 1 5 2 2 1 5 1 2 1 14 1 5 1]
```

At primes answer `one`,
OEIS [A000012](http://oeis.org/A000012):

```
>>> 1:20.prime.finiteGroupCount
[1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1]
```

At square of prime answer two,
OEIS [A007395](https://oeis.org/A007395):

```
>>> 1:14.prime.square.finiteGroupCount
[2 2 2 2 2 2 2 2 2 2 2 2 2 2]
```

At cube of prime:

```
>>> 1:5.prime.cube.finiteGroupCount
[5 5 5 5 5]
```

The number of finite groups of order _n_,
OEIS [A000001](https://oeis.org/A000001):

~~~spl svg=A oeis=A000001
0:30.finiteGroupCount
.discretePlot
~~~

![](Help/Image/finiteGroupCount-A.svg)

The number of finite groups of order _n_,
log scale scatter plot,
OEIS [A000001](https://oeis.org/A000001):

~~~spl svg=B oeis=A000001
1:250.finiteGroupCount
.scatterPlot.log
~~~

![](Help/Image/finiteGroupCount-B.svg)

First differences of the number of groups of order _n_,
OEIS [A298739](https://oeis.org/A298739):

~~~spl svg=C oeis=A298739
1:115.finiteGroupCount
.differences
.discretePlot.logScale
~~~

![](Help/Image/finiteGroupCount-C.svg)

* * *

See also: finiteAbelianGroupCount

Guides: Integer Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/FiniteGroup.html)
[2](https://reference.wolfram.com/language/ref/FiniteGroupCount.html),
_OEIS_
[1](https://oeis.org/A000001),
_W_
[1](https://en.wikipedia.org/wiki/Finite_group)
