# bitXor

- _bitXor(i, j)_

Answer bitwise exclusive or of _i_ and _j_.

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

>>> [61 15 50].collect { :each |
>>> 	each.integerDigits(2, 6)
>>> }
[
	1 1 1 1 0 1;
	0 0 1 1 1 1;
	1 1 0 0 1 0
]
```

The Cayley table of _Z2^3_:

```
>>> bitXor:/2.table(0:7, 0:7)
[
	0 1 2 3 4 5 6 7;
	1 0 3 2 5 4 7 6;
	2 3 0 1 6 7 4 5;
	3 2 1 0 7 6 5 4;
	4 5 6 7 0 1 2 3;
	5 4 7 6 1 0 3 2;
	6 7 4 5 2 3 0 1;
	7 6 5 4 3 2 1 0
]
```

Left half of the Cayley table of _Z2^4_,
also the binary 4-tuples combined by `bitXor`:

```
>>> bitXor:/2.table(0:15, 0:15)
>>> .collect { :each | each.first(8) }
[
	 0  1  2  3  4  5  6  7;
	 1  0  3  2  5  4  7  6;
	 2  3  0  1  6  7  4  5;
	 3  2  1  0  7  6  5  4;
	 4  5  6  7  0  1  2  3;
	 5  4  7  6  1  0  3  2;
	 6  7  4  5  2  3  0  1;
	 7  6  5  4  3  2  1  0;
	 8  9 10 11 12 13 14 15;
	 9  8 11 10 13 12 15 14;
	10 11  8  9 14 15 12 13;
	11 10  9  8 15 14 13 12;
	12 13 14 15  8  9 10 11;
	13 12 15 14  9  8 11 10;
	14 15 12 13 10 11  8  9;
	15 14 13 12 11 10  9  8
]
```

At `LargeInteger`:

```
>>> 2166136261L.bitXor(70)
2166136195L
```

Siteswap transition sequence,
in siteswaps the number of 1-bits is a constant:

```
>>> [5 2 5 1 2 6 3 3 0 4]
>>> .foldList(2r111) { :n :k |
>>> 	n.bitXor(1 << k) - 1 / 2
>>> }
[
	2r000111 2r010011 2r001011
	2r010101 2r001011 2r000111
	2r100011 2r010101 2r001110
	2r000111 2r001011
]
```

Threads over lists:

```
>>> let n = 4;
>>> let a = [0 .. n - 1];
>>> bitXor(a, a // 2)
[0 1 3 2]
```

Scatter plot of Gray encoding of _n_,
OEIS [A003188](https://oeis.org/A003188):

~~~spl svg=A
0:250.collect { :n |
	(n / 2).floor.bitXor(n)
}.scatterPlot
~~~

![](sw/spl/Help/Image/bitXor-A.svg)

Matrix plot of `bitXor`:

~~~spl png=B
let n = 127;
(bitXor:/2.array([n n]) / n).Greymap
~~~

![](sw/spl/Help/Image/bitXor-B.png)

Generate a Gray code sequence:

~~~spl svg=C
{ :i |
	i.bitXor((i / 2).floor)
}.table(1:64).linePlot
~~~

![](sw/spl/Help/Image/bitXor-C.svg)

Plot a grid satisfying _xor(a,b)<n_:

~~~spl svg=D
let n = 5;
{ :a :b |
	(a.bitXor(b) < n).boole
}.table(0:15, 0:15).matrixPlot
~~~

![](sw/spl/Help/Image/bitXor-D.svg)

The Nim-sum table,
the antidiagonals of the Cayley table,
OEIS [A003987](https://oeis.org/A003987):

```
>>> 0:13.triangularArray { :a :b |
>>> 	b.bitXor(a - b)
>>> }
[
	0;
	1 1;
	2 0 2;
	3 3 3 3;
	4 2 0 2 4;
	5 5 1 1 5 5;
	6 4 6 0 6 4 6;
	7 7 7 7 7 7 7 7;
	8 6 4 6 0 6 4 6 8;
	9 9 5 5 1 1 5 5 9 9;
	10 8 10 4 2 0 2 4 10 8 10;
	11 11 11 11 3 3 3 3 11 11 11 11;
	12 10 8 10 12 2 0 2 12 10 8 10 12;
	13 13 9 9 13 13 1 1 13 13 9 9 13 13
]
```

Plot the Nim-sum table:

~~~spl svg=E
0:20.triangularArray { :a :b |
	b.bitXor(a - b)
}.catenate.scatterPlot
~~~

![](sw/spl/Help/Image/bitXor-E.svg)

Replace each pair of adjacent bits with their sum,
OEIS [A038554](https://oeis.org/A038554):

~~~spl svg=F
0:250.collect { :n |
	let a = (n / 2).floor.bitXor(n);
	a - (2 ^ a.log2.floor)
}.scatterPlot
~~~

![](sw/spl/Help/Image/bitXor-F.svg)

Plot table for binary multiplication without carries,
OEIS [A048720](https://oeis.org/A048720):

~~~spl svg=G
let inverse = { :n |
	(1 + (1 + (8 * n)).sqrt / 2).floor
};
let multiply = { :n :m |
	let s = 0;
	{ n > 0 }.whileTrue {
		(1 = (n % 2)).ifTrue {
			s := s.bitXor(m)
		};
		n := (n / 2).floor;
		m := m * 2
	};
	s
};
0:250.collect { :n |
	let i = n.inverse;
	let a = (i - 1) * (i / 2 + 1) - n;
	let b = n - ((i * (i - 1)) / 2);
	multiply(a, b)
}.scatterPlot
~~~

![](sw/spl/Help/Image/bitXor-G.svg)

* * *

See also: bitAnd, bitNot, bitOr, xor

Guides: Bitwise Functions, Boolean Functions, Integer Sequence Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/XOR.html)
[2](https://reference.wolfram.com/language/ref/BitXor.html),
_OEIS_
[1](https://oeis.org/A003188)
[2](https://oeis.org/A048720),
_Smalltalk_
5.6.5.9,
_W_
[1](https://en.wikipedia.org/wiki/Exclusive_or)
[2](https://en.wikipedia.org/wiki/Bitwise_XOR)
