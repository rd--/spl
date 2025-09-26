# integerCompositionsWeak

- _integerCompositionsWeak(n)_
- _integerCompositionsWeak(n, [k…])_

A weak composition is an ordered arrangement of _k_ non-negative integers which sum to _n_.

Compositions of three into two parts:

```
>>> 3.integerCompositionsWeak([2])
[0 3; 1 2; 2 1; 3 0]

>>> 3.integerCompositions([2])
[1 2; 2 1]
```

The number of compositions of _n_ into _k_ parts:

```
>>> let n = 3;
>>> let k = 2;
>>> (n + k - 1).binomial(n)
4
```

In the weak form _k_ may be greater than _n_:

```
>>> 2.integerCompositionsWeak([3])
[0 0 2; 0 1 1; 0 2 0; 1 0 1; 1 1 0; 2 0 0]
```

4-2 compositions:

```
>>> 4.integerCompositionsWeak([2])
[0 4; 1 3; 2 2; 3 1; 4 0]

>>> (4 + 2 - 1).binomial(4)
5

>>> 4.integerCompositions([2])
[1 3; 2 2; 3 1]
```

4-3 compositions:

```
>>> 4.integerCompositionsWeak([3])
[
	0 0 4; 0 1 3; 0 2 2; 0 3 1; 0 4 0;
	1 0 3; 1 1 2; 1 2 1; 1 3 0; 2 0 2;
	2 1 1; 2 2 0; 3 0 1; 3 1 0; 4 0 0
]

>>> (4 + 3 - 1).binomial(4)
15

>>> 4.integerCompositions([3])
[1 1 2; 1 2 1; 2 1 1]
```

5-3 compositions:

```
>>> 5.integerCompositionsWeak([3])
[
	0 0 5; 0 1 4; 0 2 3; 0 3 2; 0 4 1;
	0 5 0; 1 0 4; 1 1 3; 1 2 2; 1 3 1;
	1 4 0; 2 0 3; 2 1 2; 2 2 1; 2 3 0;
	3 0 2; 3 1 1; 3 2 0; 4 0 1; 4 1 0;
	5 0 0
]

>>> (5 + 3 - 1).binomial(5)
21

>>> 5.integerCompositions([3])
[1 1 3; 1 2 2; 1 3 1; 2 1 2; 2 2 1; 3 1 1]
```

7-3 compositions:

```
>>> 7.integerCompositionsWeak([3])
[
	0 0 7; 0 1 6; 0 2 5; 0 3 4; 0 4 3;
	0 5 2; 0 6 1; 0 7 0; 1 0 6; 1 1 5;
	1 2 4; 1 3 3; 1 4 2; 1 5 1; 1 6 0;
	2 0 5; 2 1 4; 2 2 3; 2 3 2; 2 4 1;
	2 5 0; 3 0 4; 3 1 3; 3 2 2; 3 3 1;
	3 4 0; 4 0 3; 4 1 2; 4 2 1; 4 3 0;
	5 0 2; 5 1 1; 5 2 0; 6 0 1; 6 1 0;
	7 0 0
]

>>> (7 + 3 - 1).binomial(7)
36

>>> 7.integerCompositions([3])
[
	1 1 5; 1 2 4; 1 3 3; 1 4 2; 1 5 1;
	2 1 4; 2 2 3; 2 3 2; 2 4 1; 3 1 3;
	3 2 2; 3 3 1; 4 1 2; 4 2 1; 5 1 1
]
```

* * *

See also: binomial, integerCompositions, integerPartitions

Guides: Combinatorial Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Composition.html),
_W_
[1](https://en.wikipedia.org/wiki/Composition_(combinatorics))
