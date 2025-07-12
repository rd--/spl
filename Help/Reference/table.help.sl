# table

- _table(aBlock:/2)_
- _table(aBlock:/1, iSequence)_
- _table(aBlock:/2, iSequence, jSequence)_
- _table(aBlock:/3, iSequence, jSequence, kSequence)_

The unary form answers a `Block`,
the binary form a `List`,
the ternary form a _matrix_,
the quaternary form a _volume_.
The list associated with i is outermost.

A table of the first 10 squares:

```
>>> { :i |
>>> 	i ^ 2
>>> }.table(1:10)
[1 4 9 16 25 36 49 64 81 100]
```

This makes a table with values of _x_ running from 0 to 1 in steps of 0.25:

```
>>> sqrt:/1.table(Range(0, 1, 0.25))
[0 0.5 0.707107 0.866025 1]
```

A table with _i_ running from 0 to 20 in steps of 2:

```
>>> squared:/1.table(Range(0, 20, 2))
[0 4 16 36 64 100 144 196 256 324 400]
```

A list of 10 _x_:

```
>>> 'x'.constant.table(1:10)
['x' 'x' 'x' 'x' 'x' 'x' 'x' 'x' 'x' 'x']
```

Make a 3×3 matrix:

```
>>> { :i :j |
>>> 	i.squared + j.squared
>>> }.table(1:3, 1:3)
[
	 2  5 10;
	 5  8 13;
	10 13 18
]
```

Make a 3×4 matrix:

```
>>> { :i :j |
>>> 	i ^ j
>>> }.table(1:3, 1:4)
[
	1  1  1  1;
	2  4  8 16;
	3  9 27 81
]
```

Make a 4×3 matrix:

```
>>> { :i :j |
>>> 	10 * i + j
>>> }.table(1:4, 1:3)
[
	11 12 13;
	21 22 23;
	31 32 33;
	41 42 43
]
```

The index in the table can run backward:

```
>>> identity:/1.table(Range(10, -4, -2))
[10 8 6 4 2 0 -2 -4]
```

Make a 3×2×3 array:

```
>>> { :i :j :k |
>>> 	(100 * i) + (10 * j) + k
>>> }.table(1:3, 1:2, 1:3)
[
	111 112 113;
	121 122 123
	:;
	211 212 213;
	221 222 223
	:;
	311 312 313;
	321 322 323
]
```

Make a 3×2×4 array:

```
>>> { :i :j :k |
>>> 	(10 * i) + (j * k)
>>> }.table(1:3, [-1 1], 0:3)
[
	10 9 8 7;
	10 11 12 13
	:;
	20 19 18 17;
	20 21 22 23
	:;
	30 29 28 27;
	30 31 32 33
]
```

Iterate over an existing list:

```
>>> sqrt:/1.table([1 4 9 16])
[1 2 3 4]
```

Make an array from existing lists:

```
>>> { :i :j |
>>> 	j ^ (1 / i)
>>> }.table([1 2 4], [1 4 9])
[
	1 4 9;
	1 2 3;
	1 2.sqrt 3.sqrt
]
```

The two argument form of table is _collect_ with reversed arguments:

```
>>> { :i |
>>> 	i * i
>>> }.table(1:9)
1:9.collect { :i |
	i * i
}
```

A `List` of the values of _i^2_, with _i_ from 1 to 6:

```
>>> { :i |
>>> 	i ^ 2
>>> }.table(1:6)
[1 4 9 16 25 36]
```

Construct a contour matrix (Polansky, 1992):

```
>>> let l = [2 10 6 7];
>>> <=>.table(l, l)
[
	0 -1 -1 -1;
	1  0  1  1;
	1 -1  0 -1;
	1 -1  1  0
]
```

The unary form is _adverbial_,
it answers a Block that will apply the ternary form:

```
>>> 1:3 *.table 1:5
[
	1  2  3  4  5;
	2  4  6  8 10;
	3  6  9 12 15
]

>>> let i = 6.iota;
>>> i *.table i
[
	1  2  3  4  5  6;
	2  4  6  8 10 12;
	3  6  9 12 15 18;
	4  8 12 16 20 24;
	5 10 15 20 25 30;
	6 12 18 24 30 36
]
```

Show the truth table for a given `Boolean` verb:

```
>>> [true false] &&.table [true false]
[
	true false;
	false false
]
```

At matrices answers a volume:

```
>>> [1 2; 3 4] *.table [5 6; 7 8]
[
	 5 12;
	 7 16
	:;
	15 24;
	21 32
]
```

A table of successively longer lists:

```
>>> { :n |
>>> 	[1 .. n]
>>> }.table(1:5)
[
	1;
	1 2;
	1 2 3;
	1 2 3 4;
	1 2 3 4 5
]
```

Plot a table:

~~~spl svg=A
prime:/1.table(1:50).linePlot
~~~

![](sw/spl/Help/Image/table-A.svg)

Plot Eisenstein integers,
which form a triangular lattice in the complex plane:

~~~spl svg=B
let omega = (-1 + (0J1 * 3.sqrt)) / 2;
{ :a :b |
	let c = a + (b * omega);
	c.asList
}.table(-9:9, -9:9).flatten(1).scatterPlot
~~~

![](sw/spl/Help/Image/table-B.svg)

* * *

See also: array, collect, diagonalMatrix, identityMatrix, do, map, sum, product, nestList, tuples, withCollect

References:
_J_
[1](https://code.jsoftware.com/wiki/Vocabulary/slash#dyadic),
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Table.html)
