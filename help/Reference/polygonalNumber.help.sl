# polygonalNumber

- _polygonalNumber(n)_
- _polygonalNumber(r, n)_

Answer the _n_-th triangular number, or
the _n_-th _r_-gonal number.

Return the first 10 triangular numbers:

```
>>> 1:10.collect { :n | n.polygonalNumber }
[1 3 6 10 15 21 28 36 45 55]
```

Return the tenth r-gonal number of several regular polygons:

```
>>> 3:10.collect { :r | r.polygonalNumber(10) }
[55 100 145 190 235 280 325 370]
```

_polygonalNumber_ with integer arguments:

```
>>> 5.polygonalNumber(3)
12

>>> 3.polygonalNumber(5)
15
```

* * *

See also: ^, binomial

References:
_Mathematica_
[1](https://mathworld.wolfram.com/PolygonalNumber.html)
[2](https://reference.wolfram.com/language/ref/PolygonalNumber.html)

Categories: Math, Combinations
