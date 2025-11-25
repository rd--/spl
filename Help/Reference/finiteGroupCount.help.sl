# finiteGroupCount

- finiteGroupCount(n)_

Answer the number of finite groups of order _n_.

Threads over lists.
First few terms,
OEIS [A000001](https://oeis.org/A000001):

```
>>> 0:19.finiteGroupCount
[0 1 1 1 2 1 2 1 5 2 2 1 5 1 2 1 14 1 5 1]
```

At primes answer `one`:

```
>>> 1:20.prime.finiteGroupCount
[1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1]
```

At square of prime:

```
>>> 1:14.prime.square.finiteGroupCount
[2 2 2 2 2 2 2 2 2 2 2 2 2 2]
```

At cube of prime:

```
>>> 1:5.prime.cube.finiteGroupCount
[5 5 5 5 5]
```

Discrete plot of first few terms:

~~~spl svg=A
0:30.finiteGroupCount
.discretePlot
~~~

![](sw/spl/Help/Image/finiteGroupCount-A.svg)

Log scale scatter plot of first few terms:

~~~spl svg=B
1:250.finiteGroupCount
.log
.scatterPlot
~~~

![](sw/spl/Help/Image/finiteGroupCount-B.svg)

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
