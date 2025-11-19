# colexicographicCompare

- _colexicographicCompare([x₁ x₂ …], [y₁ y₂ …])_

Compare the sequences _x_ and _y_ colexicographically.

Find whether two equal length lists are ordered colexicographically:

```
>>> [1 2 3].colexicographicCompare([2 3 4])
-1

>>> [1 2 3].colexicographicCompare([1 2 4])
-1

>>> [2 3 4].colexicographicCompare([1 2 3])
1

>>> [1 2 4].colexicographicCompare([1 2 3])
1
```

At unequal length lists:

```
>>> [1 2].colexicographicCompare([1 2 3])
-1

>>> [1 2 3].colexicographicCompare([1 2])
1

>>> [1 2 3].colexicographicCompare([2 3])
1

>>> [2 3].colexicographicCompare([1 2 3])
-1
```

At `String`:

```
>>> [
>>> 	'column'
>>> 	'digit'
>>> 	'minimal'
>>> 	'radix'
>>> 	'representation'
>>> 	'string'
>>> 	'weight'
>>> ].colexicographicSort
[
	'string'
	'minimal'
	'column'
	'representation'
	'weight'
	'digit'
	'radix'
]

>>> [
>>> 	'string'
>>> 	'minimal'
>>> 	'column'
>>> 	'representation'
>>> 	'weight'
>>> 	'digit'
>>> 	'radix'
>>> ].lexicographicSort
[
	'column'
	'digit'
	'minimal'
	'radix'
	'representation'
	'string'
	'weight'
]
```

* * *

See also: colexicographicSort, lexicographicSort

Guides: Sort Functions
