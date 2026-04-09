# pyramid

- _pyramid([x₁ x₂ …], k)_

Return a new sequence whose elements are those of the sequence _x_ reordered using the counting algorithm _k_.

_k=1_ answers the `catenate` of `prefixes`.

Start counting again and again,
OEIS [A002260](https://oeis.org/A002260):

```
>>> [1 2 3 4 5].pyramid(1)
[
	1
	1 2
	1 2 3
	1 2 3 4
	1 2 3 4 5
]

>>> [1 2 3 4 5].prefixes
[
	1;
	1 2;
	1 2 3;
	1 2 3 4;
	1 2 3 4 5
]
```

_k=2_ answers the `catenate` of the `reverse` of the `suffixes`:

```
>>> [1 2 3 4 5].pyramid(2)
[
	5
	4 5
	3 4 5
	2 3 4 5
	1 2 3 4 5
]

>>> [1 2 3 4 5].suffixes.reverse
[
	5;
	4 5;
	3 4 5;
	2 3 4 5;
	1 2 3 4 5
]
```

Count backwards from increasing integers,
OEIS [A004736](https://oeis.org/A004736):

```
>>> [5 .. 1; -1].pyramid(2)
[1 2 1 3 2 1 4 3 2 1 5 4 3 2 1]
```

_k=3_ answers `catenate` of the `reverse` of the `prefixes`:

```
>>> [1 2 3 4 5].pyramid(3)
[
	1 2 3 4 5
	1 2 3 4
	1 2 3
	1 2
	1
]

>>> [1 2 3 4 5].prefixes.reverse
[
	1 2 3 4 5;
	1 2 3 4;
	1 2 3;
	1 2;
	1
]
```

_k=4_ answers the `catenate` of the `suffixes`:

```
>>> [1 2 3 4 5].pyramid(4)
[
	1 2 3 4 5
	2 3 4 5
	3 4 5
	4 5
	5
]

>>> [1 2 3 4 5].suffixes
[
	1 2 3 4 5;
	2 3 4 5;
	3 4 5;
	4 5;
	5
]
```

_k=5_ answers pyramids _1_ and _3_:

```
>>> [1 2 3 4 5].pyramid(5)
[
	1
	1 2
	1 2 3
	1 2 3 4
	1 2 3 4 5
	1 2 3 4
	1 2 3
	1 2
	1
]
```

_k=6_ answers pyramids _2_ and _4_:

```
>>> [1 2 3 4 5].pyramid(6)
[
	5
	4 5
	3 4 5
	2 3 4 5
	1 2 3 4 5
	2 3 4 5
	3 4 5
	4 5
	5
]
```

_k=7_ answers pyramids _3_ and _1_:

```
>>> [1 2 3 4 5].pyramid(7)
[
	1 2 3 4 5
	1 2 3 4
	1 2 3
	1 2
	1
	1 2
	1 2 3
	1 2 3 4
	1 2 3 4 5
]
```

Pyramid _k=1_:

~~~spl svg=A
[1 .. 9].pyramid(1).scatterPlot
~~~

![](Help/Image/pyramid-A.svg)

Pyramid _k=2_:

~~~spl svg=B
[1 .. 9].pyramid(2).scatterPlot
~~~

![](Help/Image/pyramid-B.svg)

Pyramid _k=3_:

~~~spl svg=C
[1 .. 9].pyramid(3).scatterPlot
~~~

![](Help/Image/pyramid-C.svg)

Pyramid _k=4_:

~~~spl svg=D
[1 .. 9].pyramid(4).scatterPlot
~~~

![](Help/Image/pyramid-D.svg)

Pyramid _k=5_:

~~~spl svg=E
[1 .. 9].pyramid(5).scatterPlot
~~~

![](Help/Image/pyramid-E.svg)

Pyramid _k=6_:

~~~spl svg=F
[1 .. 9].pyramid(6).scatterPlot
~~~

![](Help/Image/pyramid-F.svg)

Pyramid _k=7_:

~~~spl svg=G
[1 .. 9].pyramid(7).scatterPlot
~~~

![](Help/Image/pyramid-G.svg)

* * *

See also: ++, catenate, mirror, Permutation, prefixes, suffixes

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/Array.html#-pyramid)

Categories: Counting
