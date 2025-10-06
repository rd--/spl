# sylvesterExpansion

- _sylvesterExpansion(n/d)_

Answer the Sylvester expansion of the fraction _n/d_.
The answer is an Egyptian fraction,
a list of distinct unit fractions that sum to _n/d_.

```
>>> 7/15.sylvesterExpansion
[1/3 1/8 1/120]

>>> 4/13.sylvesterExpansion
[1/4 1/18 1/468]

>>> 17/29.sylvesterExpansion
[1/2 1/12 1/348]

>>> 8/11.sylvesterExpansion
[1/2 1/5 1/37 1/4070]
```

The expansion can be quite long, with large denominators:

```
>>> 5/121.sylvesterExpansion
[
	1/25
	1/757
	1/763309
	1/873960180913
	1/1527612795642093385023488
]

>>> [1/33 1/121 1/363].sum
5/121
```

Size of expansions for fractal sequence of fractions,
OEIS [A050205](http://oeis.org/A050205):

```
>>> (2 .. 11).collect { :i |
>>> 	(1 .. i - 1).collect { :j |
>>> 		(j \ i).sylvesterExpansion.size
>>> 	}
>>> }
[
	1;
	1 2;
	1 1 2;
	1 2 2 3;
	1 1 1 2 2;
	1 2 3 2 3 3;
	1 1 2 1 2 2 3;
	1 2 1 2 2 2 3 3;
	1 1 2 2 1 2 2 3 3;
	1 2 2 2 3 2 3 4 4 4
]
```

* * *

See also: engelExpansion, Fraction

Guides: Fraction Functions, Integer Sequence Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/EgyptianFraction.html),
_OEIS_
[1](http://oeis.org/A050205),
_W_
[1](https://en.wikipedia.org/wiki/Egyptian_fraction)
[2](https://en.wikipedia.org/wiki/Greedy_algorithm_for_Egyptian_fractions)
