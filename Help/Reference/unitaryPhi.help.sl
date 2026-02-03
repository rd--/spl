# unitaryPhi

- _unitaryPhi(n)_

Implement the unitary totient, or unitary phi, function.

First few terms,
OEIS [A047994](https://oeis.org/A047994):

```
>>> 1:71.collect(unitaryPhi:/1)
[
	 1  1  2  3  4  2  6  7  8  4
	10  6 12  6  8 15 16  8 18 12
	12 10 22 14 24 12 26 18 28  8
	30 31 20 16 24 24 36 18 24 28
	40 12 42 30 32 22 46 30 48 24
	32 36 52 26 40 42 36 28 58 24
	60 30 48 63 48 20 66 48 44 24
	70
]
```

Scatter plot of first few terms:

~~~spl svg=A
1:99.collect(unitaryPhi:/1)
.scatterPlot
~~~

![](sw/spl/Help/Image/unitaryPhi-A.svg)

* * *

See also: eulerPhi, product

References:
_OEIS_
[1](https://oeis.org/A047994)

Further Reading: Cohen 1960
