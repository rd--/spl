# arrayRules

- _arrayRules(a, x)_

Answer an `Association` `List` indicating the values at the array _a_ that are not equal to the object _x_.
If the bounding index would not be included it is given with the `zero` value.
This is one form of sparse representation of an array.

A six-vector with three `zero` elements answers a list of three or four places:

```
>>> [0 1 0 2 0 3].arrayRules(0)
[[2L] -> 1.0, [4L] -> 2.0, [6L] -> 3.0]

>>> [1 0 2 0 3 0].arrayRules(0)
[[1] -> 1, [3] -> 2, [5] -> 3, [6] -> 0]
```

A 3×3 matrix with six `zero` elements answers a list of three places:

```
>>> 3.identityMatrix
>>> .arrayRules(0)
[
	[1 1] -> 1,
	[2 2] -> 1,
	[3 3] -> 1
]
```

A 3×3 matrix with three `zero` elements answers a list of six places:

```
>>> [2 0 1; 2 2 0; 1 0 1]
>>> .arrayRules(2)
[
	[1 2] -> 0,
	[1 3] -> 1,
	[2 3] -> 0,
	[3 1] -> 1,
	[3 2] -> 0,
	[3 3] -> 1
]
```

Positions of `one` in an integer 2×2×2 array with the default taken to be `zero`:

```
>>> let r = Sfc32(276313);
>>> let a = r.randomSmallInteger([0 1], [2 2 2]);
>>> (a, a.arrayRules(0))
(
	[
		0 1; 1 1:;
		0 0; 0 1
	],
	[
		[1 1 2] -> 1,
		[1 2 1] -> 1,
		[1 2 2] -> 1,
		[2 2 2] -> 1
	]
)
```

* * *

See also: Association, List, Matrix, SparseMatrix

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/ArrayRules.html)

Categories: Math, Matrix
