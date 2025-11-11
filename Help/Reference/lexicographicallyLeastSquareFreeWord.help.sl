# lexicographicallyLeastSquareFreeWord

- _lexicographicallyLeastSquareFreeWord([x₁ x₂ …], n)_

Answer the lexicographically least _n_-place square-free sequence of nonnegative integers that starts with _x_.

The first few terms of the word that starts with zero,
OEIS [A007814](https://oeis.org/A007814),
also called the the ruler sequence:

```
>>> [0].lexicographicallyLeastSquareFreeWord(111)
[
	0 1 0 2 0 1 0 3 0 1 0 2 0 1 0 4 0 1 0 2
	0 1 0 3 0 1 0 2 0 1 0 5 0 1 0 2 0 1 0 3
	0 1 0 2 0 1 0 4 0 1 0 2 0 1 0 3 0 1 0 2
	0 1 0 6 0 1 0 2 0 1 0 3 0 1 0 2 0 1 0 4
	0 1 0 2 0 1 0 3 0 1 0 2 0 1 0 5 0 1 0 2
	0 1 0 3 0 1 0 2 0 1 0
]
```

The first few terms of the word that starts with one,
OEIS [A356677](https://oeis.org/A356677):

```
>>> [1].lexicographicallyLeastSquareFreeWord(100)
[
	1 0 1 2 0 1 0 2 0 1 2 0 2 1 0 1 2 0 1 0
	2 0 1 2 0 3 0 1 0 2 0 1 0 3 0 1 0 2 0 3
	0 1 0 3 0 2 0 1 0 2 0 3 0 1 0 2 0 1 0 3
	0 1 0 2 0 3 0 1 0 3 0 2 0 1 2 0 2 1 0 1
	2 0 1 0 2 0 1 2 0 2 1 0 1 2 0 2 3 0 1 0
]
```

The first few terms of the word that starts with two,
OEIS [A356678](https://oeis.org/A356678):

```
>>> [2].lexicographicallyLeastSquareFreeWord(100)
[
	2 0 1 0 2 0 1 2 0 2 1 0 1 2 0 1 0 2 0 1
	2 0 2 1 0 2 0 1 0 2 1 0 1 2 0 1 0 2 0 1
	2 0 2 1 0 1 2 0 1 0 2 0 1 3 0 1 0 2 0 1
	0 3 0 1 0 2 0 1 2 0 2 1 0 1 2 0 1 0 2 0
	1 2 0 2 1 0 1 3 0 1 0 2 0 1 0 3 0 1 0 2
]
```

The first few terms of the word that starts with three,
OEIS [A356679](https://oeis.org/A356679):

```
>>> [3].lexicographicallyLeastSquareFreeWord(87)
[
	3 0 1 0 2 0 1 0 3 0 1 0 2 0 1 2 0 2 1 0
	1 2 0 1 0 2 0 1 2 0 2 1 0 1 3 0 1 0 2 0
	1 0 3 0 1 0 2 0 1 2 0 2 1 0 1 2 0 1 0 2
	0 1 2 0 2 1 0 2 0 1 0 2 1 0 1 2 0 1 0 2
	0 1 2 0 2 1 0
]
```

The first few terms of the word that starts with _1,2_,
OEIS [A356680](https://oeis.org/A356680):

```
>>> [1 2].lexicographicallyLeastSquareFreeWord(87)
[
	1 2 0 1 0 2 0 1 2 0 2 1 0 1 2 0 1 0 2 0
	1 2 0 2 1 2 0 1 0 2 0 1 2 0 3 0 1 0 2 0
	1 0 3 0 1 0 2 0 3 0 1 0 3 0 2 0 1 0 2 0
	3 0 1 0 2 0 1 0 3 0 1 0 2 0 3 0 1 0 3 0
	2 0 1 2 0 2 1
]
```

The first few terms of the word that starts with _1,3_,
OEIS [A356681](https://oeis.org/A356681):

```
>>> [1 3].lexicographicallyLeastSquareFreeWord(87)
[
	1 3 0 1 0 2 0 1 0 3 0 1 0 2 0 1 2 0 2 1
	0 1 2 0 1 0 2 0 1 2 0 2 1 0 1 3 0 1 0 2
	0 1 0 3 0 1 0 2 0 1 2 0 2 1 0 1 2 0 1 0
	2 0 1 2 0 2 1 2 0 1 0 2 0 1 2 0 3 0 1 0
	2 0 1 0 3 0 1
]
```

The first few terms of the word that starts with _2,1_,
OEIS [A356682](https://oeis.org/A356682):

```
>>> [2 1].lexicographicallyLeastSquareFreeWord(87)
[
	2 1 0 1 2 0 1 0 2 0 1 2 0 2 1 0 1 2 0 1
	0 2 0 1 2 1 0 1 2 0 1 0 2 0 3 0 1 0 2 0
	1 0 3 0 1 0 2 0 3 0 1 0 3 0 2 0 1 0 2 0
	3 0 1 0 2 0 1 0 3 0 1 0 2 0 3 0 1 0 3 1
	0 1 2 0 1 0 2
]
```

* * *

See also: isSquareFreeWord

Further Reading: Berera 2023
