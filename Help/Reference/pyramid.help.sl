# pyramid

- _pyramid(aSequence, patternType)_

Return a new sequence whose elements are those of _aSequence_ reordered using a "counting" algorithm.
_patternType_ is an integer and selects the counting algorithm.

The `catenate` of `prefixes`:

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

The `catenate` of the `reverse` of the `suffixes`:

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

The `catenate` of the `reverse` of the `prefixes`:

```
>>> [1 2 3 4 5].pyramid(3)
[
	1 2 3 4 5
	1 2 3 4
	1 2 3
	1 2
	1
]
```

The `catenate` of the `suffixes`:

```
>>> [1 2 3 4 5].pyramid(4)
[
	1 2 3 4 5
	2 3 4 5
	3 4 5
	4 5
	5
]
```

Pyramids _1_ and _3_:

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

Pyramids _2_ and _4_:

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

Pyramids _3_ and _1_:

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
