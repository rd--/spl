# isSiteswap

- _isSiteswap([x₁ x₂ …])_

Answer `true` if the integer sequence _x_ is a siteswap, also called a juggling sequence.

```
>>> [5 0 5 3 0 5 5 1]
>>> .isSiteswap
true
```

The length of a siteswap is called the period.
The average of a siteswap is the number of balls being juggled.

A period ten, three-ball siteswap:

```
>>> let t = [5 3 0 4 2 5 2 6 1 2];
>>> (t.isSiteswap, t.size, t.average)
(true, 10, 3)
```

Three decompositions:

```
>>> [5 3 0 4; 2 5 2; 6 1 2]
>>> .collect { :t |
>>> 	(t.isSiteswap, t.size, t.average)
>>> }
[
	(true, 4, 3),
	(true, 3, 3),
	(true, 3, 3)
]
```

Five primitive juggling sequences,
and three composite sequences:

```
>>> [
>>> 	3
>>> 	4 2;
>>> 	5 3 1;
>>> 	4 5 3 0
>>> 	5 2 2
>>> ].allSatisfy(isSiteswap:/1)
true

>>> [
>>> 	3 3 3 4 2 5 3 1 3 4
>>> 	5 3 0 5 2 2
>>> 	;
>>> 	4 2 3 3 4 2 3 3 5 2
>>> 	2 4 5 3 0 4 2 4 2 3
>>> 	;
>>> 	3 5 3 1 4 2 4 2 3 3
>>> 	3 4 5 3 0 4 5 3 0 5
>>> 	3 1 3 5 3 1
>>> ].allSatisfy(isSiteswap:/1)
true
```

* * *

See also: siteswapState, siteswapStateAllowedTransitions, siteswapStateTransition

Guides: Combinatorial Functions

Further Reading: Buhler 1994
