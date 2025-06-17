# geometricProgression

- _geometricProgression(n, a, r)_

Answer a `List` holding the first _n_ places of the geometric sequence _a,ar,ar²,ar³,…_.

```
>>> 7.geometricProgression(1, 3)
[1 3 9 27 81 243 729]

>>> 7.geometricProgression(729, 1 / 3)
[729 243 81 27 9 3 1]
```

The `differences` of a geometric sequence is a geometric sequence:

```
>>> 7.geometricProgression(1, 3)
>>> .differences
6.geometricProgression(2, 3)

>>> 7.geometricProgression(729, 1 / 3)
>>> .differences
6.geometricProgression(-486, 1 / 3)
```

The `ratios` of a geometric sequence are _r_:

```
>>> 7.geometricProgression(1, 3)
>>> .ratios
[3 3 3 3 3 3]
```

The `powerRange` method gives the same sequence, requiring a limit, or stop, value rather than a _n_:

```
>>> 1.powerRange(10 ^ 6, 10)
[1 10 100 1000 10000 100000 1000000]

>>> 7.geometricProgression(1, 10)
[1 10 100 1000 10000 100000 1000000]
```

A two dimensional geometric series diagram by Nicole Oresme:

~~~spl svg=A
6.geometricProgression(0.5, 0.5)
.withIndexCollect { :n :i |
	let m = 50;
	let k = 2.5;
	let x = m - (n * m);
	Rectangle([x, 0], [m, i * k])
}.LineDrawing
~~~

![](sw/spl/Help/Image/geometricProgression-A.svg)

* * *

See also: arithmeticProgression, arithmeticoGeometricSequence, isGeometricProgression, powerRange, Range, ratios

Guides: List Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/GeometricSequence.html)
[2](https://mathworld.wolfram.com/CommonRatio.html),
_W_
[1](https://en.wikipedia.org/wiki/Geometric_progression)

Categories: Arithmetic
