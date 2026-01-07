# farthestFirstTraversal

- _farthestFirstTraversal([v₁ v₂ …], k, f:/2, g:/1)_

Answer the farthest-first traversal of the sequence of points _v_,
where the first point is selected arbitrarily by _k_,
and each successive point is as far as possible from the set of previously-selected points,
according to the distance function _f_.
The distance from a point to a set is defined as the reduction,
according to _g_,
of the pairwise distances to points in the set.
If _k_ is elided it is set to one.
If _f_ is elided it is set to `euclideanDistance`.
If _g_ is elided it is set to `min`.
There may be many different farthest-first traversals if there are ties.

Of an integer sequence:

```
>>> [1 10 2 8 3 6]
>>> .farthestFirstTraversal
[1 10 6 8 3 2]

>>> [1 10 6 8 3 2]
>>> .distanceMatrix.diagonal(1)
[9 4 2 5 1]
```

Of a sorted sequence of integers:

```
>>> [1 .. 9].farthestFirstTraversal
[1 9 5 3 7 2 4 6 8]

>>> [1 9 5 3 7 2 4 6 8]
>>> .distanceMatrix.diagonal(1)
[8 4 2 4 5 2 2 2]
```

Starting at specified index:

```
>>> [1 .. 9].farthestFirstTraversal(
>>> 	5,
>>> 	euclideanDistance:/2,
>>> 	min:/1
>>> )
[5 1 9 3 7 2 4 6 8]

>>> [5 1 9 3 7 2 4 6 8]
>>> .distanceMatrix.diagonal(1)
[4 8 6 4 5 2 2 2]
```

Use `sum` as the reduction function, instead of `min`:

```
>>> [1 .. 9].farthestFirstTraversal(
>>> 	5,
>>> 	euclideanDistance:/2,
>>> 	sum:/1
>>> )
[5 1 9 2 8 3 7 4 6]
```

Of a set of points in two-dimensional space:

```
>>> [0 0; 1 1; 5 5; 1 5; 5 1; 2 2]
>>> .farthestFirstTraversal
[0 0; 5 5; 1 5; 5 1; 2 2; 1 1]

>>> [0 0; 5 5; 1 5; 5 1; 2 2; 1 1]
>>> .distanceMatrix.diagonal(1)
[7.0711 4.0000 5.6569 3.1623 1.4142]
```

Of the three-tuples of _0,1_,
and of the integers _0-7_:

```
>>> [0 1].tuples(3)
>>> .farthestFirstTraversal
[
	0 0 0;
	1 1 1;
	0 0 1;
	0 1 0;
	0 1 1;
	1 0 0;
	1 0 1;
	1 1 0
]

>>> [0 .. 7].farthestFirstTraversal
>>> .integerDigits(2, 3)
[
	0 0 0;
	1 1 1;
	0 1 1;
	1 0 1;
	0 0 1;
	0 1 0;
	1 0 0;
	1 1 0
]
```

Of the three-tuples of _0,1,2_,
with squared Euclidean distance function,
and `sum` as the reduction function:

```
>>> let f = { :p :q |
>>> 	euclideanDistance(p, q).square
>>> };
>>> [0 1 2].tuples(3)
>>> .farthestFirstTraversal(
>>>	1,
>>> 	f:/2,
>>> 	sum:/1
>>> )
[
	0 0 0;
	2 2 2;
	0 0 2;
	2 2 0;
	0 2 0;
	2 0 2;
	2 0 0;
	0 2 2;
	0 0 1;
	2 2 1;
	0 1 0;
	2 1 2;
	0 1 2;
	2 1 0;
	0 2 1;
	2 0 1;
	1 0 0;
	1 2 2;
	1 0 2;
	1 2 0;
	0 1 1;
	2 1 1;
	1 0 1;
	1 2 1;
	1 1 0;
	1 1 2;
	1 1 1
]
```

* * *

See also: euclideanDistance

Guides: Permutation Functions, Sort Functions

References:
_W_
[1](https://en.wikipedia.org/wiki/Farthest-first_traversal)
