# bitXor

- _bitXor(n1, n2)_

Answer bitwise exclusive or.

Truth table:

```
>>> bitXor:/2.table(0:1, 0:1)
[
	0 1;
	1 0
]
```

The `bitXor` of nine and fifteen is six:

```
>>> 2r1001.bitXor(2r1111)
2r0110

>>> 9.bitXor(15)
6
```

The `bitXor` of sixty-one and fifteen is fifty:

```
>>> 61.bitXor(15)
50

>>> [61 15 50].collect { :each | each.integerDigits(2, 6) }
[
	1 1 1 1 0 1;
	0 0 1 1 1 1;
	1 1 0 0 1 0
]
```

Cayley table of _Z2^4_, also the binary 4-tuples combined by `bitXor`:

```
>>> bitXor:/2.table(0:15, 0:15)
[
	 0  1  2  3  4  5  6  7  8  9 10 11 12 13 14 15;
	 1  0  3  2  5  4  7  6  9  8 11 10 13 12 15 14;
	 2  3  0  1  6  7  4  5 10 11  8  9 14 15 12 13;
	 3  2  1  0  7  6  5  4 11 10  9  8 15 14 13 12;
	 4  5  6  7  0  1  2  3 12 13 14 15  8  9 10 11;
	 5  4  7  6  1  0  3  2 13 12 15 14  9  8 11 10;
	 6  7  4  5  2  3  0  1 14 15 12 13 10 11  8  9;
	 7  6  5  4  3  2  1  0 15 14 13 12 11 10  9  8;
	 8  9 10 11 12 13 14 15  0  1  2  3  4  5  6  7;
	 9  8 11 10 13 12 15 14  1  0  3  2  5  4  7  6;
	10 11  8  9 14 15 12 13  2  3  0  1  6  7  4  5;
	11 10  9  8 15 14 13 12  3  2  1  0  7  6  5  4;
	12 13 14 15  8  9 10 11  4  5  6  7  0  1  2  3;
	13 12 15 14  9  8 11 10  5  4  7  6  1  0  3  2;
	14 15 12 13 10 11  8  9  6  7  4  5  2  3  0  1;
	15 14 13 12 11 10  9  8  7  6  5  4  3  2  1  0
]
```

Scatter plot of OEIS [A003188](https://oeis.org/A003188):

~~~spl svg=A
0:250.collect { :n |
	(n / 2).floor.bitXor(n)
}.scatterPlot
~~~

![](sw/spl/Help/Image/bitXor-A.svg)

* * *

See also: bitAnd, bitOr

References:
_Mathematica_
[1](https://mathworld.wolfram.com/XOR.html)
[2](https://reference.wolfram.com/language/ref/BitXor.html),
_OEIS_
[1](https://oeis.org/A003188),
_Smalltalk_
5.6.5.9,
_W_
[1](https://en.wikipedia.org/wiki/Exclusive_or)
