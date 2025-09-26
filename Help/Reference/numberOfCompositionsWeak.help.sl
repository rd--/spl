# numberOfCompositionsWeak

- _numberOfCompositions(n, k)_

Count the number of weak compositions of a number _n_ of length _k_ (where zero is allowed).

Triangle of solutions,
OEIS [A178300](https://oeis.org/A178300):

```
>>> 1:9.collect { :n |
>>> 	1:n.collect { :k |
>>> 		n.numberOfCompositionsWeak(k)
>>> 	}
>>> }
[
	1;
	1 3;
	1 4 10;
	1 5 15 35;
	1 6 21 56 126;
	1 7 28 84 210 462;
	1 8 36 120 330 792 1716;
	1 9 45 165 495 1287 3003 6435;
	1 10 55 220 715 2002 5005 11440 24310
]
```

Specific values:

```
>>> 9.integerCompositionsWeak([5]).size
715

>>> 9.numberOfCompositionsWeak(5)
715

>>> binomial(9 + 5 - 1, 9)
715
```

Varying _n_ where _k=5_:

```
>>> 1:12.collect { :n |
>>> 	n.numberOfCompositionsWeak(5)
>>> }
[5 15 35 70 126 210 330 495 715 1001 1365 1820]
```

Varying _k_ where _k>n_:

```
>>> 6:9.collect { :k |
>>> 	1:5.collect { :n |
>>> 		n.numberOfCompositionsWeak(k)
>>> 	}
>>> }
[
	6 21 56 126 252;
	7 28 84 210 462;
	8 36 120 330 792;
	9 45 165 495 1287
]
```

* * *

See also: binomial, integerCompositionsWeak, numberOfCompositions

Guides: Combinatorial Function

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Composition.html),
_OEIS_
[1](https://oeis.org/A178300),
_W_
[1](https://en.wikipedia.org/wiki/Composition_(combinatorics))

Categories: Combinatorics
