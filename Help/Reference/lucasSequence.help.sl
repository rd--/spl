# lucasSequence

- _lucasSequence(n, k='V', p=1, q=-1)_

Answer _n_ terms of the _(p,q)_ _k_-Lucas sequence.

The unary form answers the Lucas sequence proper,
the _k-Lucas_ sequence where _k='V',p=1,q=-1_.

First few terms,
OEIS [A000032](https://oeis.org/A000032):

```
>>> 21.lucasSequence
[
	2 1 3 4 7
	11 18 29 47 76
	123 199 322 521 843
	1364 2207 3571 5778 9349
	15127
]

>>> 21.lucasSequence('V', 1, -1)
21.lucasSequence

>>> 21.lucasSequence('V', 1, -1)
[1 1].linearRecurrence([2 1], 21)
```

Prime Lucas numbers,
OEIS [A005479](https://oeis.org/A005479):

```
>>> 21.lucasSequence
>>> .select(isPrime:/1)
[2 3 7 11 29 47 199 521 2207 3571 9349]
```

The _U(1,-1)_ sequence is the Fibonacci sequence,
OEIS [A000045](https://oeis.org/A000045):

```
>>> 15.lucasSequence('U', 1, -1)
[0 1 1 2 3 5 8 13 21 34 55 89 144 233 377]

>>> 15.lucasSequence('U', 1, -1)
[1 1].linearRecurrence([0 1], 15)
```

The _V(1,-1)_ sequence are the Lucas numbers,
OEIS [A000032](https://oeis.org/A000032):

```
>>> 14.lucasSequence('V', 1, -1)
[2 1 3 4 7 11 18 29 47 76 123 199 322 521]

>>> 14.lucasSequence('V', 1, -1)
[1 1].linearRecurrence([2 1], 14)
```

The _U(2,-1)_ sequence is the Pell sequence,
OEIS [A000129](https://oeis.org/A000129):

```
>>> 12.lucasSequence('U', 2, -1)
[0 1 2 5 12 29 70 169 408 985 2378 5741]

>>> 12.lucasSequence('U', 2, -1)
[2 1].linearRecurrence([0 1], 12)
```

The _V(2,-1)_ sequence are the Pell-Lucas numbers,
OEIS [A002203](https://oeis.org/A002203):

```
>>> 11.lucasSequence('V', 2, -1)
[2 2 6 14 34 82 198 478 1154 2786 6726]

>>> 11.lucasSequence('V', 2, -1)
[2 1].linearRecurrence([2 2], 11)
```

The _U(2,1)_ sequence is the nonnegative integers,
OEIS [A001477](https://oeis.org/A001477):

```
>>> 16.lucasSequence('U', 2, 1)
[0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15]

>>> 16.lucasSequence('U', 2, 1)
[2 -1].linearRecurrence([0 1], 16)
```

The _U(1,-2)_ sequence is the Jacobsthal sequence,
OEIS [A001045](https://oeis.org/A001045):

```
>>> 13.lucasSequence('U', 1, -2)
[0 1 1 3 5 11 21 43 85 171 341 683 1365]

>>> 13.lucasSequence('U', 1, -2)
[1 2].linearRecurrence([0 1], 13)
```

The _V(1,-2)_ sequence is the Jacobsthal-Lucas sequence,
OEIS [A014551](https://oeis.org/A014551):

```
>>> 12.lucasSequence('V', 1, -2)
[2 1 5 7 17 31 65 127 257 511 1025 2047]

>>> 12.lucasSequence('V', 1, -2)
[1 2].linearRecurrence([2 1], 12)
```

Characteristic function of the Lucas numbers,
OEIS [A102460](https://oeis.org/A102460):

~~~spl svg=A oeis=A102460
11.lucasSequence
.characteristicFunction(0:125)
.discretePlot
~~~

![](sw/spl/Help/Image/lucasSequence-A.svg)

* * *

See also: fibonacciSequence, lucasNumber, lucasPellSequence, pellSequence

Guides: Integer Functions, Integer Sequence Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/LucasSequence.html),
_OEIS_
[1](https://oeis.org/A000032)
[2](https://oeis.org/A005479),
_W_
[1](https://en.wikipedia.org/wiki/Lucas_sequence)
[2](https://en.wikipedia.org/wiki/Lucas_number)

Categories: Math, Sequence
