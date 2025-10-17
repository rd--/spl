# integerSquareRoot

- _integerSquareRoot(n)_

Answer the integer square root of the integer _n_.

```
>>> 293.integerSquareRoot
17
```

Threads over lists:

```
>>> [4 5 8 10].integerSquareRoot
[2 2 2 3]
```

Integer square root of the first few integers,
OEIS [A000196](https://oeis.org/A000196):

```
>>> 0:65.integerSquareRoot
[
	0 1 1 1 2 2 2 2 2 3
	3 3 3 3 3 3 4 4 4 4
	4 4 4 4 4 5 5 5 5 5
	5 5 5 5 5 5 6 6 6 6
	6 6 6 6 6 6 6 6 6 7
	7 7 7 7 7 7 7 7 7 7
	7 7 7 7 8 8
]
```

Integer square root of the first few odd powers of seven:

```
>>> (7L ^ 1:2:21).integerSquareRoot
[
	2
	18
	129
	907
	6352
	44467
	311269
	2178889
	15252229
	106765608
	747359260
]
```

Integer square root of a large integer:

```
>>> (7L ^ 73).integerSquareRoot
7015820362023593956150476655802L

>>> (7L ^ 73).sqrt
7015820362023593956150476655802L
```

At `zero`:

```
>>> 0.integerSquareRoot
0
```

Not defined for negative _n_:

```
>>> {
>>> 	-4.integerSquareRoot
>>> }.hasError
true
```

Show that the expression _f_ below answers non-square numbers:

```
>>> let f = { :n |
>>> 	n + ((1 / 2) + n.sqrt).floor
>>> };
>>> let isSquare = { :n |
>>> 	let r = n.integerSquareRoot;
>>> 	r.square = n
>>> };
>>> (
>>> 	1:22.collect(f:/1),
>>> 	1:1000.anySatisfy { :n | f(n).isSquare }
>>> )
(
	[
		 2  3  5  6  7  8 10 11 12 13
		14 15 17 18 19 20 21 22 23 24
		26 27
	],
	false
)
```

* * *

See also: Integer, LargeInteger, sqrt

References:
_OEIS_
[1](https://oeis.org/A000196),
_W_
[1](https://en.wikipedia.org/wiki/Integer_square_root)
