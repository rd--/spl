# modularDistanceMultiset

- _modularDistanceMultiset([x₁ x₂ …], m)_

Answer the multiset counting the distances, modulo _m_, of pairs of integers in _x_.

A set where each distance has a unique multiplicity,
up to one less than the size of _x_,
is called Erdös-deep:

```
>>> [0 4 7]
>>> .modularDistanceMultiset(10)
>>> .sortedCounts
[
	2 -> 3,
	1 -> 4
]

>>> [0 2 4 7 9 11]
>>> .modularDistanceMultiset(12)
>>> .sortedCounts
[
	5 -> 5,
	4 -> 2,
	3 -> 3,
	2 -> 4,
	1 -> 1
]

>>> [0 4 5 9 10 14 15]
>>> .modularDistanceMultiset(16)
>>> .sortedCounts
[
	6 -> 5,
	5 -> 6,
	4 -> 1,
	3 -> 4,
	2 -> 7,
	1 -> 2
]
```

A set where each distance has a unique multiplicity,
up to _m⫽2_,
is called Winograd-deep:

```
>>> [0 2 3 5 7 9 11 13 15]
>>> .modularDistanceMultiset(17)
>>> .sortedCounts
[
	8 -> 2,
	7 -> 4,
	6 -> 6,
	5 -> 8,
	4 -> 7,
	3 -> 5,
	2 -> 3,
	1 -> 1
]
```

* * *

See also: isErdosDeep, isWinogradDeep, modularDistance, Multiset

Guides: Modular Arithmetic Functions
