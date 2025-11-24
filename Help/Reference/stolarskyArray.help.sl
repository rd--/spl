# stolarskyArray

- _stolarskyArray(m, n)_

Answer the `Integer` at row _m_ and column _n_ of the infinite Stolarsky array.

The first seven rows and columns of the Stolarsky array:

```
>>> { :m :n |
>>> 	m.stolarskyArray(n)
>>> }.table(1:7, 1:7)
[
	 1  2  3  5   8  13  21;
	 4  6 10 16  26  42  68;
	 7 11 18 29  47  76 123;
	 9 15 24 39  63 102 165;
	12 19 31 50  81 131 212;
	14 23 37 60  97 157 254;
	17 28 45 73 118 191 309
]
```

Plot upper left 11×11 area of the array:

~~~spl svg=A
{ :m :n |
	m.stolarskyArray(n)
}.table(1:11, 1:11)
.logScale
.matrixPlot
~~~

![](sw/spl/Help/Image/stolarskyArray-A.svg)

_Note_:
The definition is recursive and the system caches the array on construction.
The array is stored as a `Map` indexed by `cartesianIndexToDiagonalIndex`.

```
>>> system.cachedStolarskyArray.isMap
true
```

* * *

See also: fibonacci, goldenRatio, stolarskyIndex, wythoffArray

Guides: Integer Sequence Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/StolarskyArray.html),
_OEIS_
[1](https://oeis.org/A035506)

Further Reading: Morrison 1980
