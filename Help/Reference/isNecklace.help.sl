# isNecklace

- _isNecklace([x₁ x₂ …])_

Answer `true` if the sequence _x_ is the canonical form of a necklace,
that is if it is the lexicographically least rotation of its items.

A _(4,2)_ necklace:

```
>>> [0 0 0 1].isNecklace
true
```

The three rotations of the necklace are not necklaces:

```
>>> [0 0 0 1].circulantMatrix
>>> .collect { :x |
>>> 	(x -> x.isNecklace)
>>> }
[
	[1 0 0 0] -> false,
	[0 1 0 0] -> false,
	[0 0 1 0] -> false,
	[0 0 0 1] -> true
]
```

A list of the fourteen _(6,2)_ necklaces:

```
[
	0 0 0 0 0 0;
	0 0 0 0 0 1;
	0 0 0 0 1 1;
	0 0 0 1 0 1;
	0 0 0 1 1 1;
	0 0 1 0 0 1;
	0 0 1 0 1 1;
	0 0 1 1 0 1;
	0 0 1 1 1 1;
	0 1 0 1 0 1;
	0 1 0 1 1 1;
	0 1 1 0 1 1;
	0 1 1 1 1 1;
	1 1 1 1 1 1
].allSatisfy(isNecklace:/1)

>>> necklaceCount(6, 2)
14
```

* * *

See also: lexicographicallyLeastRotation

Guides: Combinatorial Functions, List Functions
