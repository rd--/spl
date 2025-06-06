# SparseArray

- _SparseArray(anAssociationList, shape, unspecifiedValue)_

`normal` answers the `List` array form of the sparse array.
`size` answers the first element of the `shape`.

Construct a sparse matrix with values at only a few specified positions:

```
>>> let s = SparseArray([
>>> 	[1 1] -> 1,
>>> 	[2 2] -> 2,
>>> 	[3 3] -> 3,
>>> 	[1 3] -> 4
>>> ]);
>>> (
>>> 	s.normal,
>>> 	s.shape,
>>> 	s.rank,
>>> 	s.depth,
>>> 	s.isMatrix,
>>> 	s.unspecifiedValue,
>>> 	s.sum
>>> )
(
	[1 0 4; 0 2 0; 0 0 3],
	[3 3],
	2,
	3,
	true,
	0,
	10
)
```

Make a large sparse vector:

```
>>> let s = SparseArray(
>>> 	1:10.collect { :i | [2 ^ i] -> 1}
>>> );
>>> (s.shape, s.sum)
([1024], 10)
```

Make a large sparse matrix:

```
>>> let s = SparseArray(
>>> 	1:10.collect { :i |
>>> 		[2 ^ i, 3 ^ i + i] -> 1
>>> 	}
>>> );
>>> (s.shape, s.sum)
([1024 59059], 10)
```

Construct a tridiagonal matrix using patterns for indices:

```
>>> let k = 5;
>>> let t = { :i :j |
>>> 	((i - j).abs = 1).if {
>>> 		[[i j] -> 1, [i i] -> -2]
>>> 	} {
>>> 		[i i] -> -2
>>> 	}
>>> }.table(1:k, 1:k);
>>> let s = SparseArray(t.flatten);
>>> (s.shape, s.normal, s.sum)
(
	[5 5],
	[
		-2  1  0  0  0;
		 1 -2  1  0  0;
		 0  1 -2  1  0;
		 0  0  1 -2  1;
		 0  0  0  1 -2
	],
	-2
)
```

Make a sparse diagonal matrix:

```
>>> let k = 100;
>>> let r = Sfc32(367814);
>>> let d = r.randomReal([0 1], [k]);
>>> let l = 1:k.collect { :i | [i i] -> d[i] };
>>> let s = SparseArray(l);
>>> (
>>> 	s.shape,
>>> 	s.specifiedElementCount,
>>> 	d.sum,
>>> 	s.sum
>>> )
(
	[100 100],
	100,
	47.556,
	47.556
)
```

Convert an ordinary matrix into a sparse matrix:

```
>>> let l = [1 0 0; 1 2 0; 1 2 3];
>>> let s = l.asSparseArray(0);
>>> (
>>> 	s.shape,
>>> 	s.specifiedElementCount,
>>> 	s.arrayRules,
>>> 	s.normal,
>>> 	s.sum
>>> )
(
	[3 3],
	6,
	[
		[1 1] -> 1,
		[2 1] -> 1,
		[2 2] -> 2,
		[3 1] -> 1,
		[3 2] -> 2,
		[3 3] -> 3
	],
	[
		1 0 0;
		1 2 0;
		1 2 3
	],
	10
)
```

Make a rank-4 sparse tensor with values at random positions:

```
>>> let r = Sfc32(367114);
>>> let l = 1:10.collect { :i |
>>> 	r.randomInteger([1 2], [4]) -> i
>>> };
>>> let s = SparseArray(l);
>>> (
>>> 	s.shape,
>>> 	s.specifiedElementCount,
>>> 	s.normal,
>>> 	s.arrayRules
>>> )
(
	[2 2 2 2],
	9,
	[
		[7 10; 8 0:; 0 9; 3 6],
		[4 0; 0 5:; 0 0; 0 1]
	],
	[
		[2 2 2 2] -> 1,
		[1 2 2 1] -> 3,
		[2 1 1 1] -> 4,
		[2 1 2 2] -> 5,
		[1 2 2 2] -> 6,
		[1 1 1 1] -> 7,
		[1 1 2 1] -> 8,
		[1 2 1 2] -> 9,
		[1 1 1 2] -> 10
	]
)
```

Create a list with a single nonzero element:

```
>>> SparseArray([[10] -> 1], [19], 0)
>>> .normal
[
	0 0 0 0 0 0 0 0 0 1
	0 0 0 0 0 0 0 0 0
]
```

Create a matrix with a single nonzero element:

```
>>> SparseArray([[3 3] -> 1], [5 5], 0)
>>> .normal
[
	0 0 0 0 0;
	0 0 0 0 0;
	0 0 1 0 0;
	0 0 0 0 0;
	0 0 0 0 0
]
```

`at` at a `SparseArray` matrix answers a `SparseArray` vector,
`at` at a `SparseArray` vector answers the item:

```
>>> let l = [3 3].iota;
>>> let s = l.asSparseArray(0);
>>> (
>>> 	l.at(2), s.at(2).normal,
>>> 	l.at(2, 2), s.at(2, 2),
>>> 	l.atPath([2 2]), s.atPath([2 2])
>>> )
([4 5 6], [4 5 6], 5, 5, 5, 5)
```

Sparse identity matrix:

```
>>> [3 5].sparseIdentityMatrix
SparseArray(
	[[1 1] -> 1, [2 2] -> 1, [3 3] -> 1],
	[3 5],
	0
)
```

Scalar multiplication of a sparse array:

```
>>> let l = [[218904 789134] -> 1];
>>> let s = SparseArray(l);
>>> (s.shape.product, (s * 2).arrayRules)
(172744589136, [[218904, 789134] -> 2])
```

`nonZeroValues` answers the specified values,
and `nonZeroPositions` answers the indices of the specified values:

```
>>> let m = [0 0 0 4; 1 0 0 0; 3 0 2 2];
>>> let a = m.asSparseArray(0);
>>> (a.nonZeroValues, a.nonZeroPositions)
(
	[4 1 3 2 2],
	[1 4; 2 1; 3 1; 3 3; 3 4]
)
```

Plot a list of rules:

~~~spl svg=A
SparseArray([[1] -> 2, [10] -> 7, [3] -> 2])
.normal
.linePlot
~~~

![](sw/spl/Help/Image/SparseArray-A.svg)

* * *

See also: arrayRules, List, Map, shape

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/SparseArray.html)
_W_
[1](https://en.wikipedia.org/wiki/Sparse_matrix)
