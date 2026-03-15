# multiplicativePersistence

- _multiplicativePersistence(x, b=10)_

The number of multiplications required to obtain the `digitalRoot` of _x_ in base _b_.

Specific values:

```
>>> 9876.multiplicativePersistence(10)
2

>>> 277777788888899
>>> .multiplicativePersistence(10)
11
```

The multiplicative persistences of the first few positive integers,
OEIS [A031346](https://oeis.org/A031346):

```
>>> 0:40.collect { :n |
>>> 	n.multiplicativePersistence(10)
>>> }
[
	0 0 0 0 0 0 0 0 0 0 1 1 1 1 1 1 1 1 1 1
	1 1 1 1 1 2 2 2 2 2 1 1 1 1 2 2 2 2 2 3
	1
]
```

Smallest number of multiplicative persistence _n_,
OEIS [A003001](https://oeis.org/A003001):

```
>>> [
>>> 	0 10 25 39 77 679 6788 68889
>>> 	2677889 26888999 3778888999
>>> 	277777788888899
>>> ].collect { :n |
>>> 	n.multiplicativePersistence(10)
>>> }
[0 1 2 3 4 5 6 7 8 9 10 11]
```

The multiplicative persistences of the first few positive integers,
OEIS [A031346](https://oeis.org/A031346):

~~~spl svg=A oeis=A031346
1:100.collect { :n |
	n.multiplicativePersistence(10)
}.scatterPlot
~~~

![](sw/spl/Help/Image/multiplicativePersistence-A.svg)

The ordinal transform of the multiplicative persistence,
discrete plot,
OEIS [A263131](https://oeis.org/A263131):

~~~spl svg=B oeis=A263131
1:115.collect { :n |
	n.multiplicativePersistence(10)
}.ordinalTransform.discretePlot
~~~

![](sw/spl/Help/Image/multiplicativePersistence-B.svg)

The ordinal transform of the multiplicative persistence,
scatter plot,
OEIS [A263131](https://oeis.org/A263131):

~~~spl svg=C oeis=A263131
1:200.collect { :n |
	n.multiplicativePersistence(10)
}.ordinalTransform.scatterPlot
~~~

![](sw/spl/Help/Image/multiplicativePersistence-C.svg)

* * *

See also: additivePersistence, digitalRoot

Guides: Integer Sequence Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/MultiplicativePersistence.html),
_OEIS_
[1](https://oeis.org/A031346)

Categories: Math
