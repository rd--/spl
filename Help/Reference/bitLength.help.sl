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
OEIS [A029837](https://oeis.org/A029837),
also
OEIS [A070939](https://oeis.org/A070939)
if first terms is instead `one`:

```
>>> 0:23.bitLength
[
	0 1 2 2 3 3 3 3 4 4
	4 4 4 4 4 4 5 5 5 5
	5 5 5 5
]
```

Most significant bit of _n_,
OEIS [A053644](https://oeis.org/A053644):

```
>>> 2 ^ (1:16.bitLength - 1)
[1 2 2 4 4 4 4 8 8 8 8 8 8 8 8 16]

>>> 2 ^ 1:16.log2.floor
[1 2 2 4 4 4 4 8 8 8 8 8 8 8 8 16]

>>> let n = 2 ^ 0:3;
>>> n # n
[1 2 2 4 4 4 4 8 8 8 8 8 8 8 8]
```

`bitLength` is a kind of staircase function,
OEIS [A029837](https://oeis.org/A029837):

~~~spl svg=A oeis=A029837
(-25:25).bitLength.discretePlot
~~~

![](sw/spl/Help/Image/bitLength-A.svg)

_2^l(n)_,
[A003817](https://oeis.org/A003817):

~~~spl svg=B oeis=A003817
(2 ^ 0:50.bitLength).discretePlot
~~~

![](sw/spl/Help/Image/bitLength-B.svg)

Sum of _n_ modulo _2^k_ for _k_ in `bitLength` of _n_,
OEIS [A049802](https://oeis.org/A049802):

~~~spl svg=C oeis=A049802
1:100.collect { :n |
	let m = n.bitLength - 1;
	1:m.sum { :k |
		n % (2 ^ k)
	}
}.scatterPlot
~~~

![](sw/spl/Help/Image/bitLength-C.svg)

The characteristic function of the powers of two,
OEIS [A209229](https://oeis.org/A209229):

~~~spl svg=D oeis=A209229
(0:86 - 1).bitLength.differences
.discretePlot
~~~

![](sw/spl/Help/Image/bitLength-D.svg)

`bitLength` up to _2^9_,
OEIS [A029837](https://oeis.org/A029837):

~~~spl svg=E oeis=A029837
let n = 2 ^ 9;
0:n.bitLength.stepPlot
~~~

![](sw/spl/Help/Image/bitLength-E.svg)

Simple self-inverse permutation of natural numbers,
OEIS [A054429](https://oeis.org/A054429):

~~~spl svg=F oeis=A054429 permutation
1:63.collect { :n |
	3 * (2 ^ (n.bitLength - 1)) - n - 1
}.discretePlot
~~~

![](sw/spl/Help/Image/bitLength-F.svg)

Denominators of Farey tree fractions,
OEIS [A007306](https://oeis.org/A007306):

~~~spl svg=G oeis=A007306
let a = Map { :n |
	(n < 2).if {
		1
	} {
		let m = 2 ^ (n - 1).bitLength;
		a[n - (m / 2)] + a[m - n + 1]
	}
};
a[0:260].scatterPlot
~~~

![](sw/spl/Help/Image/bitLength-G.svg)

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
