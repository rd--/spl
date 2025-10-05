# numberOfCompositions

- _numberOfCompositions(n, k)_

The number of strict compositions of a number _n_ of length _k_ (where zero is not allowed).

Construct Pascal’s triangle,
OEIS [A007318](https://oeis.org/A007318):

```
>>> 1:9.collect { :n |
>>> 	(1 .. n).collect { :k |
>>> 		n.numberOfCompositions(k)
>>> 	}
>>> }
[
	1;
	1 1;
	1 2 1;
	1 3 3 1;
	1 4 6 4 1;
	1 5 10 10 5 1;
	1 6 15 20 15 6 1;
	1 7 21 35 35 21 7 1;
	1 8 28 56 70 56 28 8 1
]
```

Specific values:

```
>>> 9.integerCompositions([5]).size
70

>>> 9.numberOfCompositions(5)
70
```

Vary _n_ wehere _k=5_:

```
>>> 5:12.collect { :n |
>>> 	n.numberOfCompositions(5)
>>> }
[1 5 15 35 70 126 210 330]
```

For varying _k_ and vary _n_ up to eleven:

```
>>> 6:9.collect { :k |
>>> 	(k .. 11).collect { :n |
>>> 		n.numberOfCompositions(k)
>>> 	}
>>> }
[
	1 6 21 56 126 252;
	1 7 28 84 210;
	1 8 36 120;
	1 9 45
]
```

* * *

See also: integerCompositions, numberOfCompositionsWeak, pascalTriangle

Guides: Combinatorial Function

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Composition.html),
_OEIS_
[1](https://oeis.org/A007318)

Categories: Combinatorics
