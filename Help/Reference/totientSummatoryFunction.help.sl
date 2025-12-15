# totientSummatoryFunction

- _totientSummatoryFunction(n)_

The totient summatory function,
written _Φ(n)_,
sums the Euler totient function,
written _φ(n)_,
over the integers from one to _n_.

First few terms,
OEIS [A002088](https://oeis.org/A002088):

```
>>> 0:24.collect(
>>> 	totientSummatoryFunction:/1
>>> )
[
	  0   1   2   4   6
	 10  12  18  22  28
	 32  42  46  58  64
	 72  80  96 102 120
	128 140 150 172 180
]
```

Plot first few terms:

~~~spl svg=A
0:50.collect(
	totientSummatoryFunction:/1
).stepPlot
~~~

![](sw/spl/Help/Image/totientSummatoryFunction-A.svg)

* * *

See also: eulerPhi, sum

Guides: Integer Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/TotientSummatoryFunction.html),
_OEIS_
[1](https://oeis.org/A002088),
_W_
[1](https://en.wikipedia.org/wiki/Totient_summatory_function)

Unicode: U+03A6 Φ Greek Capital Letter Phi
