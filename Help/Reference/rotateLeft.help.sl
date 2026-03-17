# rotateLeft

- _rotateLeft([x₁ x₂ …], n=1)_

Rotate te sequence _x_ by _n_ places to the left,
i.e. _n_ elements from the start are moved to the end.
The rotation is not in place, a new sequence is answered.
Also called a circular shift.

```
>>> [1 2 3 4 5 6 7].rotateLeft(3)
[4 5 6 7 1 2 3]

>>> [1 2 3 4 5 6 7].rotateLeft(8)
[2 3 4 5 6 7 1]

>>> [1 2 3 4 5 6 7].rotateLeft(-4)
[4 5 6 7 1 2 3]
```

Rotate two positions to the left:

```
>>> 1:5.rotateLeft(2)
[3 4 5 1 2]
```

Rotate one position to the left:

```
>>> 1:5.rotateLeft(1)
[2 3 4 5 1]
```

Successively rotate a list left:

```
>>> rotateLeft:/1.nestList([1 2 3 4 5], 4)
[
	1 2 3 4 5;
	2 3 4 5 1;
	3 4 5 1 2;
	4 5 1 2 3;
	5 1 2 3 4
]
```

Rotate successive rows of a matrix by their row number:

```
>>> let u = [1 2 3 4];
>>> let m = List(5, u);
>>> m.withIndexCollect(rotateLeft:/2)
[
	2 3 4 1;
	3 4 1 2;
	4 1 2 3;
	1 2 3 4;
	2 3 4 1
]
```

Rotate matrix rows:

```
>>> 0:9.reshape([5 2]).rotateLeft(2)
[
	4 5;
	6 7;
	8 9;
	0 1;
	2 3
]
```

The unary form rotates by one place:

```
>>> [1 2 3 4 5 6 7].rotateLeft
[2 3 4 5 6 7 1]
```

There is also an in-place variant:

```
>>> let x = [1 2 3 4 5];
>>> x.rotateLeftInPlace;
>>> x
[2 3 4 5 1]
```

At `Range`:

```
>>> 1:10.rotateLeft(3)
[4 5 6 7 8 9 10 1 2 3]

>>> 1:10.rotateLeft(-3)
[8 9 10 1 2 3 4 5 6 7]
```

Identity:

```
>>> 1:10.rotateLeft(0)
1:10

>>> [1 .. 10].rotateLeft(0)
[1 2 3 4 5 6 7 8 9 10]
```

Rotate by size:

```
>>> 1:5.rotateLeft(5)
1:5

>>> 5 % 5
0
```

At `String`:

```
>>> 'abcdefg'.rotateLeft(3)
'defgabc'

>>> 'abcdefg'.rotateLeft(-3)
'efgabcd'
```

A version of Josephus problem,
OEIS [A054995](https://oeis.org/A054995):

```
>>> 1:72.collect { :n |
>>> 	{ :x |
>>> 		x.rotateLeft(2).allButFirst
>>> 	}.iterate([1 .. n], n - 1)
>>> }.catenate
[
	 1  2  2  1  4  1  4  7  1  4
	 7 10 13  2  5  8 11 14 17 20
	 2  5  8 11 14 17 20 23 26 29
	 1  4  7 10 13 16 19 22 25 28
	31 34 37 40 43 46  2  5  8 11
	14 17 20 23 26 29 32 35 38 41
	44 47 50 53 56 59 62 65 68  1
	 4  7
]
```

Periodic derivative of _n_,
OEIS [A038556](https://oeis.org/A038556):

~~~spl svg=A oeis=A038556
0:76.collect { :n |
	let b = n.integerDigits(2);
	b.bitXor(b.rotateLeft).fromDigits(2)
}.scatterPlot
~~~

![](Help/Image/rotateLeft-A.svg)

A version of Josephus problem,
OEIS [A054995](https://oeis.org/A054995):

~~~spl svg=B oeis=A054995
1:115.collect { :n |
	{ :x |
		x.rotateLeft(2).allButFirst
	}.iterate([1 .. n], n - 1)
}.catenate.scatterPlot
~~~

![](Help/Image/rotateLeft-B.svg)

* * *

See also: atWrap, rotateRight

Guides: List Functions

References:
_Apl_
[1](https://aplwiki.com/wiki/Rotate),
_J_
[1](https://code.jsoftware.com/wiki/Vocabulary/bardot#dyadic),
_Mathematica_
[1](https://reference.wolfram.com/language/ref/RotateLeft.html),
_OEIS_
[1](https://oeis.org/A038556),
_W_
[1](https://en.wikipedia.org/wiki/Circular_shift)

Categories: Ordering
