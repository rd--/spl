# carryLessMultiplication

- _carryLessMultiplication(m, n, b=2)_

Implement carry-less multiplication of the integers _m_ and _n_ in base _b_.

Carry-less multiplication in base two:

```
>>> 2r1001.carryLessMultiplication(
>>> 	2r111, 2
>>> )
2r111111

>>> 2r10100010.carryLessMultiplication(
>>> 	2r10010110, 2
>>> )
2r101100011101100
```

At `LargeInteger`:

```
>>> 9L.carryLessMultiplication(7, 2)
63L

>>> 162L.carryLessMultiplication(150, 2)
22764L

>>> 1073741824L.carryLessMultiplication(8L, 2L)
8589934592L
```

Multiplication table for base two:

```
>>> carryLessMultiplication:/2
>>> .table(0:9, 0:9)
[
	0 0  0  0  0  0  0  0  0  0;
	0 1  2  3  4  5  6  7  8  9;
	0 2  4  6  8 10 12 14 16 18;
	0 3  6  5 12 15 10  9 24 27;
	0 4  8 12 16 20 24 28 32 36;
	0 5 10 15 20 17 30 27 40 45;
	0 6 12 10 24 30 20 18 48 54;
	0 7 14  9 28 27 18 21 56 63;
	0 8 16 24 32 40 48 56 64 72;
	0 9 18 27 36 45 54 63 72 65
]
```

Multiplication table for base two,
read by antidiagonals,
OEIS [A048720](https://oeis.org/A048720):

~~~spl svg=A oeis=A048720
0:21.antidiagonalArray(
	carryLessMultiplication:/2
).catenate.scatterPlot
~~~

![](Help/Image/carryLessMultiplication-A.svg)

Exponentiation table for base two,
read by antidiagonals,
OEIS [A048723](https://oeis.org/A048723):

~~~spl svg=B oeis=A048723
0L:21.antidiagonalArray(
	carryLessPower:/2
).catenate.log.scatterPlot
~~~

![](Help/Image/carryLessMultiplication-B.svg)

* * *

See also: times

Guides: Integer Functions

References:
_W_
[1](https://en.wikipedia.org/wiki/Carry-less_product)
