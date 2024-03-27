# combinations

- _combinations(n, m)_

The combinations of the set _1:n_, taken _m_ at a time.

```
>>> 4.combinations(3)
[1 2 3; 1 2 4; 1 3 4; 2 3 4]

>>> 5.combinations(3)
[
	1 2 3; 1 2 4; 1 2 5; 1 3 4; 1 3 5; 1 4 5;
	2 3 4; 2 3 5; 2 4 5;
	3 4 5
]
```

The number of such combinations is given by `binomial`:

```
>>> 4.binomial(3)
4

>>> 5.binomial(3)
10
```

* * *

See also: binomial, combinationsAtATimeDo, subsets, tuples

Categories: Enumerating
