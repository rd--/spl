# siteswapStateTransition

- _siteswapStateTransition(σ, j)_

Answer the siteswap state arrived at by transition _j_ from state _σ_.

The map of all allowed transitions for the state space of D₃:

```
>>> [
>>> 	0 0 1 1 1;
>>> 	0 1 0 1 1;
>>> 	0 1 1 0 1;
>>> 	0 1 1 1 0;
>>> 	1 0 0 1 1;
>>> 	1 0 1 0 1;
>>> 	1 0 1 1 0;
>>> 	1 1 0 0 1;
>>> 	1 1 0 1 0;
>>> 	1 1 1 0 0
>>> ].collect { :sigma |
>>> 	sigma.siteswapStateAllowedTransitions
>>> 	.collect { :j |
>>> 		(j -> sigma.siteswapStateTransition(j))
>>> 	}
>>> }
[
	[
		0 -> [0 1 1 1 0]
	],
	[
		0 -> [1 0 1 1 0]
	],
	[
		0 -> [1 1 0 1 0]
	],
	[
		0 -> [1 1 1 0 0]
	],
	[
		1 -> [1 0 1 1 0],
		2 -> [0 1 1 1 0],
		5 -> [0 0 1 1 1]
	],
	[
		1 -> [1 1 0 1 0],
		3 -> [0 1 1 1 0],
		5 -> [0 1 0 1 1]
	],
	[
		1 -> [1 1 1 0 0],
		4 -> [0 1 1 1 0],
		5 -> [0 1 1 0 1]
	],
	[
		2 -> [1 1 0 1 0],
		3 -> [1 0 1 1 0],
		5 -> [1 0 0 1 1]
	],
	[
		2 -> [1 1 1 0 0],
		4 -> [1 0 1 1 0],
		5 -> [1 0 1 0 1]
	],
	[
		3 -> [1 1 1 0 0],
		4 -> [1 1 0 1 0],
		5 -> [1 1 0 0 1]
	]
]
```

At `Integer`:

```
>>> [
>>> 	2b11100
>>> 	2b11010
>>> 	2b10110
>>> 	2b01110
>>> 	2b11001
>>> 	2b10101
>>> 	2b01101
>>> 	2b10011
>>> 	2b01011
>>> 	2b00111
>>> ].collect { :sigma |
>>> 	sigma.siteswapStateAllowedTransitions(5)
>>> 	.collect { :j |
>>> 		(j -> sigma.siteswapStateTransition(j))
>>> 	}
>>> }
[
	[
		0 -> 2b01110
	],
	[
		0 -> 2b01101
	],
	[
		0 -> 2b01011
	],
	[
		0 -> 2b00111
	],
	[
		1 -> 2b01101,
		2 -> 2b01110,
		5 -> 2b11100
	],
	[
		1 -> 2b01011,
		3 -> 2b01110,
		5 -> 2b11010
	],
	[
		1 -> 2b00111,
		4 -> 2b01110,
		5 -> 2b10110
	],
	[
		2 -> 2b01011,
		3 -> 2b01101,
		5 -> 2b11001
	],
	[
		2 -> 2b00111,
		4 -> 2b01101,
		5 -> 2b10101
	],
	[
		3 -> 2b00111,
		4 -> 2b01011,
		5 -> 2b10011
	]
]
```

The state may elide trailing zeroes:

```
>>> [1 1 1 0 0].siteswapStateTransition(5)
[1 1 0 0 1]

>>> [1 1 1].siteswapStateTransition(5)
[1 1 0 0 1]

>>> 2b00111.siteswapStateTransition(5)
2b10011

>>> 2b111.siteswapStateTransition(5)
2b10011
```

* * *

See also: isSiteswap, siteswapStateAllowedTransitions

Guides: Combinatorial Functions
