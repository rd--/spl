# rencontresNumber

- _rencontresNumber(n, k)_

The rencontres numbers count permutations with specified numbers of fixed points,
in other words partial derangements.

Triangle of rencontres numbers,
OEIS [A008290](https://oeis.org/A008290):

```
>>> 0:8.triangularArray(
>>> 	rencontresNumber:/2
>>> )
[
	1;
	0 1;
	1 0 1;
	2 3 0 1;
	9 8 6 0 1;
	44 45 20 10 0 1;
	265 264 135 40 15 0 1;
	1854 1855 924 315 70 21 0 1
]
```

* * *

See also: binomial, derangements, subfactorial

Guides: Combinatorial Functions, Permutation Functions

References:
_OEIS_
[1](https://oeis.org/wiki/Rencontres_numbers),
_W_
[1](https://en.wikipedia.org/wiki/Rencontres_numbers)
[2](https://en.wikipedia.org/wiki/Cycles_and_fixed_points)

