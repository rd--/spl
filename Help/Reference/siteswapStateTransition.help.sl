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
>>> 	2r11100
>>> 	2r11010
>>> 	2r10110
>>> 	2r01110
>>> 	2r11001
>>> 	2r10101
>>> 	2r01101
>>> 	2r10011
>>> 	2r01011
>>> 	2r00111
>>> ].collect { :sigma |
>>> 	sigma.siteswapStateAllowedTransitions(5)
>>> 	.collect { :j |
>>> 		(j -> sigma.siteswapStateTransition(j))
>>> 	}
>>> }
[
	[
		0 -> 2r01110
	],
	[
		0 -> 2r01101
	],
	[
		0 -> 2r01011
	],
	[
		0 -> 2r00111
	],
	[
		1 -> 2r01101,
		2 -> 2r01110,
		5 -> 2r11100
	],
	[
		1 -> 2r01011,
		3 -> 2r01110,
		5 -> 2r11010
	],
	[
		1 -> 2r00111,
		4 -> 2r01110,
		5 -> 2r10110
	],
	[
		2 -> 2r01011,
		3 -> 2r01101,
		5 -> 2r11001
	],
	[
		2 -> 2r00111,
		4 -> 2r01101,
		5 -> 2r10101
	],
	[
		3 -> 2r00111,
		4 -> 2r01011,
		5 -> 2r10011
	]
]
```

The state may elide trailing zeroes:

```
>>> [1 1 1 0 0].siteswapStateTransition(5)
[1 1 0 0 1]

>>> [1 1 1].siteswapStateTransition(5)
[1 1 0 0 1]

>>> 2r00111.siteswapStateTransition(5)
2r10011

>>> 2r111.siteswapStateTransition(5)
2r10011
```

* * *

See also: isSiteswap, siteswapStateAllowedTransitions

Guides: Combinatorial Functions
