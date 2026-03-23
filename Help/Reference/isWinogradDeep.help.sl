# isWinogradDeep

- _isWinogradDeep([x₁ x₂ …], m)_

Answer `true` if the integer set _x_ is Winograd-deep modulo _m_,
that is if it has exactly one modular distance of multiplicity _i_ for _i_ in _1…n−1_,
where _n=m/2_,
else `false`.
Every Winograd deep _x_ is also Erdös deep.

```
>>> [0 4 5 9 10 14 15]
>>> .isWinogradDeep(16)
false

>>> [0 2 4 5 7 9 11]
>>> .isWinogradDeep(12)
true

>>> [0 4 7]
>>> .isWinogradDeep(10)
false

>>> [0 2 3 5 7 9 11 13 15]
>>> .isWinogradDeep(17)
true
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
>>> 	a.isWinogradDeep(16)
>>> }
[false false false false false false]
```

The underlying structure is the modular distance multiset:

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

See also: isErdosDeep, modularDistance, modularDistanceMultiset

Guides: Modular Arithmetic Functions

Further Reading: Demaine 2005, Winograd 1966
