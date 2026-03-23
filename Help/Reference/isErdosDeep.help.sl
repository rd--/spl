# isErdosDeep

- _isErdosDeep([x₁ x₂ …], m)_

Answer `true` if the integer set _x_ is Erdos-deep modulo _m_,
that is if it has exactly one modular distance of multiplicity _i_ for _i_ in _1…n−1_,
where _n_ is the size of _x_,
else `false`.

```
>>> [0 4 5 9 10 14 15]
>>> .isErdosDeep(16)
true

>>> [0 3 6 10 13]
>>> .isErdosDeep(16)
true

>>> [0 2 4 5 7 9 11]
>>> .isErdosDeep(12)
true

>>> [0 4 7]
>>> .isErdosDeep(10)
true

>>> [0 2 3 5 7 9 11 13 15]
>>> .isErdosDeep(17)
true
```

Three necklace patterns with _m=12_:

```
>>> [
>>> 	0 1 3 5 7 9 11;
>>> 	1 2 4 6 8 10 11;
>>> 	0 2 3 5 7 9 10
>>> ].collect { :a |
>>> 	a.isErdosDeep(12)
>>> }
[false false true]
```

Six sets which have equal sum of pairwise geodesic distances:

```
>>> [
>>> 	0 4 6 10 12;
>>> 	0 3 6 10 12;
>>> 	0 3 6 10 11;
>>> 	0 3 7 10 12;
>>> 	0 3 6 10 13;
>>> 	0 3 6 10 14
>>> ].collect { :a |
>>> 	a.isErdosDeep(16)
>>> }
[true false false false true false]
```

The underlying structure is the modular distance multiset:

```
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

>>> [0 2 4 7 9 11]
>>> .modularDistanceMultiset(12)
>>> .sortedCounts
[5 -> 5, 4 -> 2, 3 -> 3, 2 -> 4, 1 -> 1]

>>> [0 4 7]
>>> .modularDistanceMultiset(10)
>>> .sortedCounts
[2 -> 3, 1 -> 4]
```

* * *

See also: isWinogradDeep, modularDistance, modularDistanceMultiset

Guides: Modular Arithmetic Functions

References:
_W_
[1](https://en.wikipedia.org/wiki/Erd%C5%91s_distinct_distances_problem)

Further Reading: Demaine 2005, Erdös 1946
