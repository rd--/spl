# lodumoTransform

- _lodumoTransform([x₁ x₂ …], m)_

Answer the Ludomo-_m_ transform of the sequence _x_.

OEIS [A160016](https://oeis.org/A160016)
is the _L(2)_ transform of
OEIS [A159833](https://oeis.org/A159833):

```
>>> [0 4 19 54 124 250 459 784 1264 1944]
>>> .lodumoTransform(2)
[0 2 1 4 6 8 3 10 12 14]
```

OEIS [A160081](https://oeis.org/A160081)
is the _L(5)_ transform of
OEIS [A000045](https://oeis.org/A000045):

```
>>> [0 1 1 2 3 5 8 13 21 34 55 89 144 233]
>>> .lodumoTransform(5)
[0 1 6 2 3 5 8 13 11 4 10 9 14 18]
```

OEIS [A159966](https://oeis.org/A159966)
is the _L(5)_ transform of
OEIS [A102370](https://oeis.org/A102370):

```
>>> [0 3 6 5 4 15 10 9 8 11 14 13 28]
>>> .lodumoTransform(4)
[0 3 2 1 4 7 6 5 8 11 10 9 12]
```

OEIS [A006368](https://oeis.org/A006368)
is the _L(3)_ transform of
OEIS [A131743](https://oeis.org/A131743):

```
>>> [0 1 0 2].repeat(4)
>>> .lodumoTransform(3)
[0 1 3 2 6 4 9 5 12 7 15 8 18 10 21 11]
```

_L(2)_ applied to each row of Pascal’s triangle,
OEIS [A160019](https://oeis.org/A160019):

~~~spl svg=A oeis=A160019
17.pascalTriangle.collect { :x |
	x.lodumoTransform(2)
}.catenate.scatterPlot
~~~

![](Help/Image/lodumoTransform-A.svg)

_L(2)_ of Kolakoski sequence,
OEIS [A160051](https://oeis.org/A160051):

~~~spl svg=B oeis=A160051
65.kolakoskiSequence
.lodumoTransform(2)
.scatterPlot
~~~

![](Help/Image/lodumoTransform-B.svg)

_L(5)_ of Fibonacci sequence,
OEIS [A160081](https://oeis.org/A160081):

~~~spl svg=C oeis=A160081
65.fibonacciSequence
.lodumoTransform(5)
.scatterPlot
~~~

![](Help/Image/lodumoTransform-C.svg)

* * *

See also: binomialTransform, eulerTransform, mod, moebiusTransform

Guides: Integer Sequence Functions

References:
_OEIS_
[1](https://oeis.org/wiki/Lodumo_transform)
