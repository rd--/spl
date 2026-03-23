# bjorklundsAlgorithm

- _bjorklundsAlgorithm(k, n)_

Bjorklund’s algorithm to construct a binary sequence of _n_ bits with _k_ ones,
such that the _k_ ones are distributed as evenly as possible among the _n - k_ zeroes.

```
>>> 3.bjorklundsAlgorithm(8)
[1 0 0 1 0 0 1 0]

>>> 5.bjorklundsAlgorithm(13)
[1 0 0 1 0 1 0 0 1 0 1 0 0]
```

The sequence may be periodic:

```
>>> 9.bjorklundsAlgorithm(15)
[1 0 1 1 0 1 0 1 1 0 1 0 1 1 0]

>>> 9.bjorklundsAlgorithm(15)
>>> .findRepeat
[1 0 1 1 0]

>>> [1 0 1 1 0].repeat(3)
[1 0 1 1 0 1 0 1 1 0 1 0 1 1 0]
```

Corresponds to moment of symmetry scale structures.
Consider:

```
>>> 7.bjorklundsAlgorithm(12)
[1 0 1 1 0 1 0 1 1 0 1 0]
```

Rewriting as the cyclic intervals between ones gives _2 1 2 2 1 2 2_,
which is a rotation of _2 2 2 1 2 2 1_:

```
>>> 7.momentOfSymmetry(12)
[
	7 5;
	2 5 5;
	2 2 3 2 3;
	2 2 2 1 2 2 1
]

>>> ([1 0 1 1 0 1 0 1 1 0 1 0] ++ [1])
>>> .indicesOf(1)
[1 3 4 6 8 9 11 13]

>>> [1 3 4 6 8 9 11 13].differences
[2 1 2 2 1 2 2]

>>> [2 1 2 2 1 2 2].rotateRight(2)
[2 2 2 1 2 2 1]
```

The two forms have the same least rotation:

```
>>> [
>>> 	2 1 2 2 1 2 2;
>>> 	2 2 2 1 2 2 1
>>> ].collect(
>>> 	lexicographicallyLeastRotation:/1
>>> )
[
	1 2 2 1 2 2 2;
	1 2 2 1 2 2 2
]
```

* * *

See also: bjorklundsAlgorithmDo, bresenhamLineAlgorithm, euclideanAlgorithm, lexicographicallyLeastRotation

Guides: Scale Functions

Further Reading: Bjorklund 1989, Demaine 2005

Categories: Algorithm, Math
