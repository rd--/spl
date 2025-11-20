# bulgarianSolitaire

- _bulgarianSolitaire(p)_

Answer one step in the game of Bulgarian solitaire given an integer partition _p_.

```
>>> [2 1 1 1].bulgarianSolitaire
[4 1]
```

Partitions that are of the form _n..1_,
so that the sum is a triangular number,
answer the identity:

```
>>> [4 3 2 1].bulgarianSolitaire
[4 3 2 1]

>>> 1:4.sum
10

>>> [9, 8 .. 1].bulgarianSolitaire
[9, 8 .. 1]

>>> 1:9.sum
45
```

A state that forms a loop at the fifth step:

```
>>> bulgarianSolitaire:/1
>>> .nestList([2 1 1 1], 5)
[
	2 1 1 1;
	4 1;
	3 2;
	2 2 1;
	3 1 1;
	3 2
]
```

A state that forms a loop at the fourth step:

```
>>> bulgarianSolitaire:/1
>>> .nestListDistinct([4])
[
	[
		4;
		3 1;
		2 2;
		2 1 1
	],
	[3 1]
]
```

A state that arrives at the _n:1_ partition:

```
>>> bulgarianSolitaire:/1
>>> .nestListDistinct([3 3])
[
	[
		3 3;
		2 2 2;
		3 1 1 1;
		4 2;
		3 2 1
	],
	[3 2 1]
]
```

A state that returns to the initial state after four steps:

```
>>> bulgarianSolitaire:/1
>>> .nestListDistinct([4 2 1])
[
	[
		4 2 1;
		3 3 1;
		3 2 2;
		3 2 1 1
	],
	[4 2 1]
]
```

A state that forms a two-cycle:

```
>>> bulgarianSolitaire:/1
>>> .nestListDistinct([4 2 2])
[
	[
		4 2 2;
		3 3 1 1
	],
	[4 2 2]
]
```

The longest path through the G₆ state space:

```
>>> bulgarianSolitaire:/1
>>> .nestListDistinct([2 2 1 1])
[
	[
		2 2 1 1;
		4 1 1;
		3 3;
		2 2 2;
		3 1 1 1;
		4 2;
		3 2 1
	],
	[3 2 1]
]
```

The longest path through the G₈ state space:

```
>>> bulgarianSolitaire:/1
>>> .nestListDistinct(
>>> 	[1 1 1 1 1 1 1 1]
>>> )
[
	[
		1 1 1 1 1 1 1 1;
		8;
		7 1;
		6 2;
		5 2 1;
		4 3 1;
		3 3 2;
		3 2 2 1;
		4 2 1 1
	],
	[4 3 1]
]
```

* * *

See also: integerPartitions

Guides: Integer Functions

References:
_W_
[1](https://en.wikipedia.org/wiki/Bulgarian_solitaire)
