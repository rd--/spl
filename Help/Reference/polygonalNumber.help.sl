# polygonalNumber

- _polygonalNumber(n)_
- _polygonalNumber(r, n)_

Answer the _n_-th triangular number, or
the _n_-th _r_-gonal number.

Return the first 18 triangular numbers (OEIS A000217):

```
>>> 0:17.collect { :n |
>>> 	n.polygonalNumber
>>> }
[
	0 1 3 6 10 15 21 28 36 45
	55 66 78 91 105 120 136 153
]
```

Return the tenth r-gonal number of several regular polygons (OEIS A139610):

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

Categories: Math, Combinations
