# log2

- _log2(x)_

The base two logarithm of the number _x_,
_log₂(x)_,
also called the binary logarithm.

```
>>> (2 ^ 10).log2
10

>>> (2 ^ 1/2).log2
1/2

>>> 2.sqrt.log2
1/2

>>> (2 ^ -1).log2
-1

>>> let n = system.nextRandomFloat;
>>> n.log2
(n.log / 2.log)
```

Log base two of the first few primes:

```
>>> 10.primesList.log2
[
	1.0000 1.5850 2.3220 2.8074 3.4594
	3.7004 4.0875 4.2480 4.5240 4.8580
]
```

At `Fraction`:

```
>>> 3/2.log2
0.5849625
```

The pitch of A4 in octaves above `one` hertz:

```
>>> 440.log2
8.7814

>>> 2 ^ 8.7814
440
```

The pitch of middle C (C4) in octaves above `one` hertz:

```
>>> 440.log2 - 9/12
8.0314

>>> 2 ^ (440.log2 - 9/12)
261.6256
```

Frequency of middle C (C4) in hertz:

```
>>> 2 ^ (440.log2 - 9/12)
261.6256

>>> 261.6256.CpsMidi
60
```

Geometric Connell sequence,
OEIS [A049039](https://oeis.org/A049039):

```
>>> 1:23.collect { :n |
>>> 	(2 * n) - 1 - n.log2.floor
>>> }
[
	 1  2  4  5  7  9 11 12 14 16
	18 20 22 24 26 27 29 31 33 35
	37 39 41
]
```

Continued fraction expansion for _log₂(3)_,
OEIS [A028507](https://oeis.org/A028507):

```
>>> 3.log2.continuedFraction(16)
[1 1 1 2 2 3 1 5 2 23 2 2 1 1 55 1]
```

Decimal expansion of _log₂(3)_,
OEIS [A020857](https://oeis.org/A020857):

```
>>> 3.log2
1.584962500721156
```

Benson’s variants of Carlos’ α β and γ-scales:

```
>>> (
>>> 	[11 6 5] * [3/2 5/4 6/5].log2
>>> ).sum / [11 6 5].square.sum * 1200
63.8329

>>> (
>>> 	[9 5 4] * [3/2 5/4 6/5].log2
>>> ).sum / [9 5 4].square.sum * 1200
77.9650

>>> (
>>> 	[20 11 9] * [3/2 5/4 6/5].log2
>>> ).sum / [20 11 9].square.sum * 1200
35.0985
```

Plot over a subset of the reals:

~~~spl svg=A
(0.01 -- 5).functionPlot(log2:/1)
~~~

![](Help/Image/log2-A.svg)

Sum of _n_ `mod` powers of two,
see `bitLength` for a simpler definiton,
OEIS [A049802](https://oeis.org/A049802):

~~~spl svg=B oeis=A049802
1:200.collect { :n |
	let m = n.log2.floor;
	n * m - 1:m.sum { :k |
		(n * (2 ^ -k)).floor * (2 ^ k)
	}
}.scatterPlot
~~~

![](Help/Image/log2-B.svg)

Floor of log base two of _n_,
OEIS [A000523](https://oeis.org/A000523):

~~~spl svg=C oeis=A000523
let n = 0:65;
n.log2.floor.discretePlot
~~~

![](Help/Image/log2-C.svg)

Ceiling of log base two of _n_,
OEIS [A029837](https://oeis.org/A029837):

~~~spl svg=D oeis=A029837
let n = 0:65;
n.log2.ceiling.scatterPlot
~~~

![](Help/Image/log2-D.svg)

* * *

See also: log, log10

Guides: Mathematical Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/BinaryLogarithm.html)
[2](https://mathworld.wolfram.com/Lg.html)
[3](https://reference.wolfram.com/language/ref/Log2.html),
_OEIS_
[1](https://oeis.org/A049039),
_W_
[1](https://en.wikipedia.org/wiki/Binary_logarithm),
_Xenharmonic_
[1](https://en.xen.wiki/w/Log2)
