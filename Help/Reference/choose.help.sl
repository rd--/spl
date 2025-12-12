# choose

- _choose(n, k)_

At `Integer`,
`choose` is an alias for `binomial`,
which tells the number of combinations of _n_ elements taken _k_ at a time.

```
>>> 6.choose(3)
((6 * 5 * 4) / (1 * 2 * 3))

>>> binomial(6, 3)
20

>>> 10.choose(10)
1

>>> 10.choose(1)
10

>>> 10.choose(2)
45

>>> 10.choose(5)
252
```

Pascal matrix:

```
>>> choose:/2.table(0:4, 0:4)
[
	1 0 0 0 0;
	1 1 0 0 0;
	1 2 1 0 0;
	1 3 3 1 0;
	1 4 6 4 1
]
```

Transposed table:

```
>>> choose:/2.swap.table(0:4, 0:4)
[
	1 1 1 1 1;
	0 1 2 3 4;
	0 0 1 3 6;
	0 0 0 1 4;
	0 0 0 0 1
]
```

If _k > n_ answers zero:

```
>>> 3.choose(6)
0

>>> binomial(3, 6)
0
```

* * *

See also: binomial

Guides: Combinatorial Functions

References:
_J_
[1](https://code.jsoftware.com/wiki/Vocabulary/bang#dyadic),
