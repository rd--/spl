# pyramid

- _pyramid([x₁ x₂ …], k)_

Return a new sequence whose elements are those of the sequence _x_ reordered using the counting algorithm _k_.

_k=1_ answers the `catenate` of `prefixes`:

```
>>> [1 2 3 4 5].pyramid(1)
[
	1
	1 2
	1 2 3
	1 2 3 4
	1 2 3 4 5
]

>>> [1 2 3 4 5].prefixes
[
	1;
	1 2;
	1 2 3;
	1 2 3 4;
	1 2 3 4 5
]
```

_k=2_ answers the `catenate` of the `reverse` of the `suffixes`:

```
>>> [1 2 3 4 5].pyramid(2)
[
	5
	4 5
	3 4 5
	2 3 4 5
	1 2 3 4 5
]

>>> [1 2 3 4 5].suffixes.reverse
[
	5;
	4 5;
	3 4 5;
	2 3 4 5;
	1 2 3 4 5
]
```

_k=3_ answers `catenate` of the `reverse` of the `prefixes`:

```
>>> [1 2 3 4 5].pyramid(3)
[
	1 2 3 4 5
	1 2 3 4
	1 2 3
	1 2
	1
]

>>> [1 2 3 4 5].prefixes.reverse
[
	1 2 3 4 5;
	1 2 3 4;
	1 2 3;
	1 2;
	1
]
```

_k=4_ answers the `catenate` of the `suffixes`:

```
>>> [1 2 3 4 5].pyramid(4)
[
	1 2 3 4 5
	2 3 4 5
	3 4 5
	4 5
	5
]

>>> [1 2 3 4 5].suffixes
[
	1 2 3 4 5;
	2 3 4 5;
	3 4 5;
	4 5;
	5
]
```

_k=5_ answers pyramids _1_ and _3_:

```
>>> [1 2 3 4 5].pyramid(5)
[
	1
	1 2
	1 2 3
	1 2 3 4
	1 2 3 4 5
	1 2 3 4
	1 2 3
	1 2
	1
]
```

_k=6_ answers pyramids _2_ and _4_:

```
>>> [1 2 3 4 5].pyramid(6)
[
	5
	4 5
	3 4 5
	2 3 4 5
	1 2 3 4 5
	2 3 4 5
	3 4 5
	4 5
	5
]
```

_k=7_ answers pyramids _3_ and _1_:

```
>>> [1 2 3 4 5].pyramid(7)
[
	1 2 3 4 5
	1 2 3 4
	1 2 3
	1 2
	1
	1 2
	1 2 3
	1 2 3 4
	1 2 3 4 5
]
```

* * *

See also: ++, catenate, mirror, Permutation, prefixes, suffixes

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/Array.html#-pyramid)

Categories: Counting
