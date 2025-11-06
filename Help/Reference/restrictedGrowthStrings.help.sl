# restrictedGrowthStrings

- _restrictedGrowthStrings(n)_
- _restrictedGrowthStrings(n, k)_

Answer the restricted growth strings of length _n_ in lexicographic order.

The five strings of length three:

```
>>> 3.restrictedGrowthStrings
[
	0 0 0;
	0 0 1;
	0 1 0;
	0 1 1;
	0 1 2
]

>>> 3.bellNumber
5
```

The fifteen strings of length four:

```
>>> 4.restrictedGrowthStrings
[
	0 0 0 0;
	0 0 0 1;
	0 0 1 0;
	0 0 1 1;
	0 0 1 2;
	0 1 0 0;
	0 1 0 1;
	0 1 0 2;
	0 1 1 0;
	0 1 1 1;
	0 1 1 2;
	0 1 2 0;
	0 1 2 1;
	0 1 2 2;
	0 1 2 3
]

>>> 4.bellNumber
15
```

The binary form answers the string of length _n_ that partition into _k_ blocks:

```
>>> restrictedGrowthStrings(4, 3)
[
	0 0 1 2;
	0 1 0 2;
	0 1 1 2;
	0 1 2 0;
	0 1 2 1;
	0 1 2 2
]

>>> stirlingS2(4, 3)
6
```

A restricted growth string can be used to describe a set partition:

```
>>> [0 1 2 2].setPartition
[1; 2; 3 4]

>>> 4.restrictedGrowthStrings
>>> .collect(setPartition:/1)
[
	1 2 3 4:;
	1 2 3; 4:;
	1 2 4; 3:;
	1 2; 3 4:;
	1 2; 3; 4:;
	1 3 4; 2:;
	1 3; 2 4:;
	1 3; 2; 4:;
	1 4; 2 3:;
	1; 2 3 4:;
	1; 2 3; 4:;
	1 4; 2; 3:;
	1; 2 4; 3:;
	1; 2; 3 4:;
	1; 2; 3; 4
]
```

* * *

See also: bellNumber, setPartitions

Guides: Combinatorial Functions

References:
_Mathematica_
[1](http://mathworld.wolfram.com/RestrictedGrowthString.html)

Further Reading: Knuth 2011
