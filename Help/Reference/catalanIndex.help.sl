# catalanIndex

- _catalanIndex(n)_

Answer the least index _i_ such that the _i_-th Catalan number is greater than _n_.

First few terms,
OEIS [A081288](https://oeis.org/A081288):

```
>>> 0:43.collect(
>>> 	catalanIndex:/1
>>> )
[
	0 2 3 3 3 4 4 4 4 4 4 4 4 4 5 5 5 5 5 5
	5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
	5 5 6 6
]
```

The largest Catalan number _≤n_,
OEIS [A081290](https://oeis.org/A081290):

```
>>> 1:43.collect { :n |
>>> 	(n.catalanIndex - 1)
>>> 	.catalanNumber
>>> }
[
	 1  2  2  2  5  5  5  5  5  5
	 5  5  5 14 14 14 14 14 14 14
	14 14 14 14 14 14 14 14 14 14
	14 14 14 14 14 14 14 14 14 14
	14 42 42
]
```

* * *

See also: catalanExpansion, catalanNumber

Guides: Combinatorial Functions

References:
_OEIS_
[1](https://oeis.org/A081288)
[2](https://oeis.org/A081290)
