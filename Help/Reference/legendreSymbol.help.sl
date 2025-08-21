# legendreSymbol

- _legendreSymbol(a, p)_

Answer the Legendre symbol for _a/p_,
where _p_ is an odd prime.

```
>>> 12345.legendreSymbol(331)
-1

>>> 98.legendreSymbol(331)
-1

>>> 59.legendreSymbol(619)
-1

>>> [2 3 5 7 11].collect { :i |
>>> 	legendreSymbol(i, 5)
>>> }
[-1 -1 0 -1 1]

>>> 0:6.collect { :i |
>>> 	legendreSymbol(i, 7)
>>> }
[0 1 1 -1 1 -1 -1]

>>> { :p :a |
>>> 	a.legendreSymbol(p)
>>> }.table([3 5 7 11], [0 .. 10])
[
	0  1 -1  0  1 -1  0  1 -1  0  1;
	0  1 -1 -1  1  0  1 -1 -1  1  0;
	0  1  1 -1  1 -1 -1  0  1  1 -1;
	0  1 -1  1  1  1 -1 -1 -1  1 -1
]
```

Plot table:

~~~spl svg=A
legendreSymbol:/2
.swap
.table(2:14.prime, 1:13)
.rescale
.matrixPlot
~~~

![](sw/spl/Help/Image/legendreSymbol-A.svg)

* * *

See also: jacobiSymbol, kroneckerSymbol

References:
_Mathematica_
[1](https://mathworld.wolfram.com/LegendreSymbol.html),
_W_
[1](https://en.wikipedia.org/wiki/Legendre_symbol)
