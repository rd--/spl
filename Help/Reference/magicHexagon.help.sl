# magicHexagon

- _magicHexagon(n)_

Answer the _n_-th order magix hexagon.  _n_ must be `one` or three.
The answer is in the form of a matrix with `zero` entries for cells not in the heaxgon.

```
>>> 1.magicHexagon
[1]

>>> 3.magicHexagon
[
	 0  0  3 17 18;
	 0 19  7  1 11;
	16  2  5  6  9;
	12  4  8 14  0;
	10 13 15  0  0
]

>>> 3.magicHexagon.collect { :row |
>>> 	row.select { :x |
>>> 		x ~= 0
>>> 	}
>>> }
[
	       3    17    18;
	   19     7     1    11;
	16     2     5     6    9;
	   12     4     8    14;
	      10    13    15
]
```

Row sums:

```
>>> 3.magicHexagon.sum
38 # 5
```

Column sums:

```
>>> 3.magicHexagon.collect(sum:/1)
38 # 5
```

Antidiaogonals and sums:

```
>>> let m = 3.magicHexagon;
>>> [-2 .. 2].collect { :n |
>>> 	let d = m.antidiagonal(n);
>>> 	(d, d.sum)
>>> }
[
	([ 9 14 15], 38),
	([11  6  8 13], 38),
	([18  1  5  4 10], 38),
	([17  7  2 12], 38),
	([ 3 19 16], 38)
]
```

All lines and sums:

```
>>> [
>>> 	 3 17 18;
>>> 	19  7  1 11;
>>> 	16  2  5  6  9;
>>> 	12  4  8 14;
>>> 	10 13 15;
>>> 	16 19  3;
>>> 	12  2  7 17;
>>> 	10  4  5  1 18;
>>> 	13  8  6 11;
>>> 	15 14  9;
>>> 	16 12 10;
>>> 	19  2  4 13;
>>> 	 3  7  5  8 15;
>>> 	17  1  6 14;
>>> 	18 11  9
>>> ].collect(sum:/1)
38 # 15
```

Sums of concentric circles:

```
>>> [
>>> 	 5;
>>> 	 6  1  7  2  4 8;
>>> 	 9 11 18 17  3 19
>>> 	16 12 10 13 15 14
>>> ].collect(sum:/1)
[5 28 157]
```

* * *

See also: magicSquare

Guides: Magic Squares

References:
_Mathematica_
[1](https://mathworld.wolfram.com/MagicHexagon.html),
_W_
[1](https://en.wikipedia.org/wiki/Magic_hexagon)
