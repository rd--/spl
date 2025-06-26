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

* * *

See also: jacobiSymbol, kroneckerSymbol

References:
_Mathematica_
[1](https://mathworld.wolfram.com/LegendreSymbol.html)
[2](https://reference.wolfram.com/language/ref/JacobiSymbol.html),
_W_
[1](https://en.wikipedia.org/wiki/Legendre_symbol)
