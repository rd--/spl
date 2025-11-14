# siteswapState

- _siteswapState([x₁ x₂ …])_

Answer the state vector for the siteswap _x_.

Three-ball siteswaps with ground state σ³:

```
>>> [
>>> 	3;
>>> 	4 2;
>>> 	5 3 1;
>>> 	5 5 5 0 0
>>> ].collect(siteswapState:/1)
[
	1 1 1;
	1 1 1;
	1 1 1;
	1 1 1
]
```

The state vectors of all rotations of a period eight three-ball prime siteswap:

```
>>> 0:7.collect { :i |
>>> 	[5 0 5 3 0 5 5 1]
>>> 	.rotateLeft(i)
>>> 	.siteswapState
>>> }
[
	1 0 1 1;
	0 1 1 0 1;
	1 1 0 1;
	1 0 1 0 1;
	0 1 1 1;
	1 1 1;
	1 1 0 0 1;
	1 0 0 1 1
]
```

A period four three-ball prime siteswap:

```
>>> [
>>> 	4 1 5 2;
>>> 	2 4 1 5;
>>> 	5 2 4 1;
>>> 	1 5 2 4
>>> ].collect(siteswapState:/1)
[
	1 1 0 1;
	1 1 0 0 1;
	1 1 1;
	1 0 1 1
]
```

A primitive siteswap that is not prime:

```
>>> [
>>> 	2 3 5 2;
>>> 	3 5 2 2;
>>> 	5 2 2 3;
>>> 	2 2 3 5
>>> ].collect(siteswapState:/1)
[
	1 1 0 1;
	1 1 1;
	1 1 1;
	1 1 0 0 1
]
```

* * *

See also: isSiteswap

Guides: Combinatorial Functions
