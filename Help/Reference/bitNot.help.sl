# bitNot

- _bitNot(n)_
- _bitNot(n, k)_

Answer bitwise not, i.e. invert bits of _n_.

```
>>> 3.bitNot
-4
```

-1 corresponds to having all bits on:

```
>>> 0.bitNot
-1

>>> 7.bitNot
-8
```

Threads over lists:

```
>>> 1:10.bitNot
[-2, -3 .. -11]
```

At `LargeInteger`:

```
>>> 1L:10.bitNot
[-2L, -3L .. -11L]
```

The binary form truncates to _k_ bits:

```
>>> 3.bitNot(8)
252

>>> 0.bitNot(8)
255

>>> 127.bitNot(8)
128

>>> 0:255.bitNot(8)
[255, 254 .. 0]
```

At `BitSet`, mutates set:

```
>>> let b = '1001'.asBitSet;
>>> b.bitNot;
>>> b.asString
'0110'
```

As `not` of `boole`:

```
>>> 1.bitNot + 2
0

>>> 0.bitNot + 2
1

>>> 5.identityMatrix.bitNot + 2
[
	0 1 1 1 1;
	1 0 1 1 1;
	1 1 0 1 1;
	1 1 1 0 1;
	1 1 1 1 0
]
```

Make a shifted version of the _Rule 45_ cellular automaton,

~~~spl svg=A
{ :n |
	(4 * n).bitXor(
		(2 * n).bitOr(
			n.bitNot
		)
	)
}.nestList(1L, 17)
.integerDigits(2)
.padRight
.matrixPlot
~~~

![](sw/spl/Help/Image/bitNot-A.svg)

Triangle of _¬n&k_,
also called the converse nonimplication,
OEIS [A102037](https://oeis.org/A102037):

~~~spl svg=B oeis=A102037
0:19.triangularArray { :n :k |
	n.bitNot.bitAnd(k)
}.catenate.scatterPlot
~~~

![](sw/spl/Help/Image/bitNot-B.svg)

Row sums of triangle of _¬n&k_,
also called the converse nonimplication,
OEIS [A350094](https://oeis.org/A350094):

~~~spl svg=C oeis=A350094
0:63.triangularArray { :n :k |
	n.bitNot.bitAnd(k)
}.collect(sum:/1).scatterPlot
~~~

![](sw/spl/Help/Image/bitNot-C.svg)

* * *

See also: bitAnd, bitOr, bitXor, not

Guides: Bitwise Functions, Boolean Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/BitNot.html),
_W_
[1](https://en.wikipedia.org/wiki/Bitwise_operation#NOT)

Categories: Bit Manipulation, Binary
