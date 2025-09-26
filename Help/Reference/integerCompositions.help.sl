# integerCompositions

- _integerCompositions(n)_
- _integerCompositions(n, [k…])_

A composition is an ordered arrangement of _k_ positive integers which sum to _n_.
It is therefore a partition in which order is significant.
The compositions given here are sometimes called strict compositions,
see also `integerCompositionsWeak`.

There are eight compositions of four:

```
>>> 4.integerCompositions
[
	4;
	1 3; 2 2; 3 1;
	1 1 2; 1 2 1; 2 1 1;
	1 1 1 1
]

>>> 2 ^ (4 - 1)
8

>>> [
>>> 	4;
>>> 	1 3; 2 2; 3 1;
>>> 	1 1 2; 1 2 1; 2 1 1;
>>> 	1 1 1 1
>>> ].collect(sum:/1)
(4 # 8)
```

There are sixteen compositions of five:

```
>>> 5.integerCompositions
[
	5;
	1 4; 2 3; 3 2; 4 1; 1 1 3;
	1 2 2; 1 3 1; 2 1 2; 2 2 1; 3 1 1;
	1 1 1 2; 1 1 2 1; 1 2 1 1; 2 1 1 1;
	1 1 1 1 1
]

>>> 2 ^ (5 - 1)
16
```

There are three compositions of four into two parts,
and two of three into two parts:

```
>>> 4.integerCompositions([2])
[1 3; 2 2; 3 1]

>>> 3.integerCompositions([2])
[1 2; 2 1]
```

The compositions of 1, 2 & 3:

```
>>> 1.integerCompositions
[[1]]

>>> 2.integerCompositions
[2; 1 1]

>>> 3.integerCompositions
[3; 1 2; 2 1; 1 1 1]
```

The composition of 5:

```
>>> 5.integerCompositions
[
	5;
	1 4; 2 3; 3 2; 4 1;
	1 1 3; 1 2 2; 1 3 1; 2 1 2; 2 2 1; 3 1 1;
	1 1 1 2; 1 1 2 1; 1 2 1 1; 2 1 1 1;
	1 1 1 1 1
]
```

A positive integer _n_ has _2 ^ (n - 1)_ compositions:

```
>>> 9.integerCompositions.size
2 ^ (9 - 1)
```

The number of _n,k_ compositions:

```
>>> let n = 7;
>>> let k = 3;
>>> n.integerCompositions([k]).size
(n - 1).binomial(k - 1)
```

* * *

See also: binomial, integerCompositionsDo, integerCompositionsWeak, integerPartitions

Guides: Combinatorial Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Composition.html),
_W_
[1](https://en.wikipedia.org/wiki/Composition_(combinatorics))
