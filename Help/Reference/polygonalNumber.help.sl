# polygonalNumber

- _polygonalNumber(r=3, n)_

In the unary case,
answer the _n_-th triangular number.
In the binary case,
answer the _n_-th _r_-gonal number.

Return the first 18 triangular numbers,
OEIS A000217:

```
>>> 0:17.collect { :n |
>>> 	n.polygonalNumber
>>> }
[
	0 1 3 6 10 15 21 28 36 45
	55 66 78 91 105 120 136 153
]
```

Return the tenth r-gonal number of several regular polygons,
OEIS A139610:

```
>>> 2:15.collect { :r |
>>> 	r.polygonalNumber(10)
>>> }
[
	10 55 100 145 190 235 280 325 370 415
	460 505 550 595
]

>>> 0:13 * 45 + 10
[
	10 55 100 145 190 235 280 325 370 415
	460 505 550 595
]
```

`polygonalNumber` with integer arguments:

```
>>> 5.polygonalNumber(3)
12

>>> 3.polygonalNumber(5)
15
```

Central polygonal numbers,
OIES [A000124](https://oeis.org/A000124):

```
>>> 0:52.collect { :n |
>>> 	n.polygonalNumber + 1
>>> }
[
	   1    2    4    7   11
	  16   22   29   37   46
	  56   67   79   92  106
	 121  137  154  172  191
	 211  232  254  277  301
	 326  352  379  407  436
	 466  497  529  562  596
	 631  667  704  742  781
	 821  862  904  947  991
	1036 1082 1129 1177 1226
	1276 1327 1379
]
```

Plot:

~~~spl svg=A
0:23.collect { :n |
	n.polygonalNumber
}.linePlot
~~~

![](sw/spl/Help/Image/polygonalNumber-A.svg)

* * *

See also: ^, binomial

Guides: Combinatorial Functions, Integer Sequence Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/PolygonalNumber.html)
[2](https://reference.wolfram.com/language/ref/PolygonalNumber.html),
_OEIS_
[1](https://oeis.org/A000217)
[2](https://oeis.org/A139610)
[3](https://oeis.org/A000124),
_W_
[1](https://en.wikipedia.org/wiki/Polygonal_number)
[2](https://en.wikipedia.org/wiki/Triangular_number)
[3](https://en.wikipedia.org/wiki/Lazy_caterer%27s_sequence)

Categories: Math, Combinations
