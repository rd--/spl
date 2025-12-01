# binaryCombinations

- _binaryCombinations(s, t)_

Answer the combinations of _s_ zeroes and _t_ ones,
or equally the multiset permutations of the specified binary multiset.

Where _s=1,t=3_:

```
>>> binaryCombinations(1, 3)
[
	1 1 1 0;
	0 1 1 1;
	1 0 1 1;
	1 1 0 1
]

>>> binomial(4, 3)
4

>>> binaryCombinations(1, 3)
>>> .collect { :c |
>>> 	c.indicesOf(1)
>>> }
[
	1 2 3;
	2 3 4;
	1 3 4;
	1 2 4
]
```

Where _s=2,t=3_:

```
>>> binaryCombinations(2, 3)
[
	1 1 1 0 0;
	0 1 1 1 0;
	1 0 1 1 0;
	1 1 0 1 0;
	0 1 1 0 1;
	1 0 1 0 1;
	0 1 0 1 1;
	0 0 1 1 1;
	1 0 0 1 1;
	1 1 0 0 1
]

>>> binomial(5, 3)
10
```

Where _s=2,t=4_:

```
>>> binaryCombinations(2, 4)
[
	1 1 1 1 0 0;
	0 1 1 1 1 0;
	1 0 1 1 1 0;
	1 1 0 1 1 0;
	1 1 1 0 1 0;
	0 1 1 1 0 1;
	1 0 1 1 0 1;
	1 1 0 1 0 1;
	0 1 1 0 1 1;
	1 0 1 0 1 1;
	0 1 0 1 1 1;
	0 0 1 1 1 1;
	1 0 0 1 1 1;
	1 1 0 0 1 1;
	1 1 1 0 0 1
]

>>> binomial(6, 4)
15
```

Where _s=3,t=3_:

```
>>> binaryCombinations(3, 3)
[
	1 1 1 0 0 0;
	0 1 1 1 0 0;
	1 0 1 1 0 0;
	1 1 0 1 0 0;
	0 1 1 0 1 0;
	1 0 1 0 1 0;
	0 1 0 1 1 0;
	0 0 1 1 1 0;
	1 0 0 1 1 0;
	1 1 0 0 1 0;
	0 1 1 0 0 1;
	1 0 1 0 0 1;
	0 1 0 1 0 1;
	0 0 1 1 0 1;
	1 0 0 1 0 1;
	0 1 0 0 1 1;
	0 0 1 0 1 1;
	0 0 0 1 1 1;
	1 0 0 0 1 1;
	1 1 0 0 0 1
]

>>> binomial(6, 3)
20
```

* * *

See also: combinations

Guides: Combinatorial Functions

Further Reading: Ruskey 2005
