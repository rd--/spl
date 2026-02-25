# bitLength

- _bitLength(n)_

Answer the number of binary bits necessary to represent the integer _n_.

```
>>> 32.bitLength
6
```

For negative _n_, equivalent to _n.bitNot.bitLength_,
threads over lists:

```
>>> [1 -1 64 -64].bitLength
[1 0 7 6]

>>> [1 -1 64 -64].bitNot.bitLength
[1 0 7 6]
```

Equivalent to `floor` of `log` base two plus `one`:

```
>>> 32.log(2).floor + 1
6
```

First few terms,
OEIS [A029837](https://oeis.org/A029837):

```
>>> 0:23.bitLength
[
	0 1 2 2 3 3 3 3 4 4
	4 4 4 4 4 4 5 5 5 5
	5 5 5 5
]
```

Plot is a kind of staircase,
OEIS [A029837](https://oeis.org/A029837):

~~~spl svg=A
(-25:25).bitLength.discretePlot
~~~

![](sw/spl/Help/Image/bitLength-A.svg)

Plot _2^l(n)_,
[A003817](https://oeis.org/A003817):

~~~spl svg=B
(2 ^ 0:50.bitLength).discretePlot
~~~

![](sw/spl/Help/Image/bitLength-B.svg)

Plot sum of _n_ modulo _2^k_ for _k_ in `bitLength` of _n_,
OEIS [A049802](https://oeis.org/A049802):

~~~spl svg=C
1:100.collect { :n |
	let m = n.bitLength - 1;
	1:m.sum { :k |
		n % (2 ^ k)
	}
}.scatterPlot
~~~

![](sw/spl/Help/Image/bitLength-C.svg)

Plot characteristic function of powers of two,
OEIS [A209229](https://oeis.org/A209229):

~~~spl svg=D
(0:86 - 1).bitLength.differences
.discretePlot
~~~

![](sw/spl/Help/Image/bitLength-D.svg)

Plot up to _2^9_,
OEIS [A029837](https://oeis.org/A029837):

~~~spl svg=E
let n = 2 ^ 9;
0:n.bitLength.stepPlot
~~~

![](sw/spl/Help/Image/bitLength-E.svg)

* * *

See also: highBit, integerLength

Guides: Bitwise Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/BitLength.html)
[2](https://reference.wolfram.com/language/ref/BitLength.html),
_OEIS_
[1](https://oeis.org/A029837),
_W_
[1](https://en.wikipedia.org/wiki/Bit-length)
