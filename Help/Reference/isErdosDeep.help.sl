# isErdosDeep

- _isErdosDeep([x₁ x₂ …], m)_

Answer `true` if the integer set _x_ is Erdös-deep modulo _m_,
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

By convention neither the empty set not any singleton set are Erdös deep:

```
>>> [].isErdosDeep(12)
false

>>> [0].isErdosDeep(12)
false
```

By definition all two element sets are Erdös deep:

```
>>> [0 6].isErdosDeep(12)
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

Select items in the Rahn set-class table that are Erdös deep:

```
>>> system.rahnSetClassTable
>>> .select { :x |
>>> 	x.size > 2 & {
>>> 		x.isErdosDeep(12)
>>> 	}
>>> }
(
	'3-1': [0 1 2],
	'3-6': [0 2 4],
	'3-9': [0 2 7],
	'3-10': [0 3 6],
	'4-1': [0 1 2 3],
	'4-21': [0 2 4 6],
	'4-23': [0 2 5 7],
	'4-24': [0 2 4 8],
	'5-1': [0 1 2 3 4],
	'5-35': [0 2 4 7 9],
	'6-1': [0 1 2 3 4 5],
	'6-32': [0 2 4 5 7 9],
	'7-1': [0 1 2 3 4 5 6],
	'7-35': [0 1 3 5 6 8 10]
)
```

* * *

See also: isWinogradDeep, modularDistance, modularDistanceMultiset

Guides: Modular Arithmetic Functions

References:
_W_
[1](https://en.wikipedia.org/wiki/Erd%C5%91s_distinct_distances_problem)

Further Reading: Demaine 2005, Erdös 1946
